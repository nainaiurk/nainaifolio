import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/responsive.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:convert';
import 'dart:js_util' as js_util;
import 'package:http/http.dart' as http;

class ContactSection extends StatefulWidget {
  final Key? key;

  const ContactSection({this.key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  static const double _titleFontSize = 26;

  // Destination address for contact messages
  static const String _destinationEmail = 'nainaiu.rakhaine@gmail.com';

  late GoogleSignIn _googleSignIn;

  @override
  void initState() {
    super.initState();
    // On web we can optionally read a meta tag with the web client id
    String? webClientId;
    try {
      final meta =
          html.document.querySelector('meta[name="google-signin-client_id"]');
      if (meta != null) {
        webClientId = meta.getAttribute('content');
      }
    } catch (_) {
      webClientId = null;
    }

    _googleSignIn = GoogleSignIn(
      scopes: <String>['https://www.googleapis.com/auth/gmail.send'],
      clientId: webClientId,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String subject = _subjectController.text.trim();
    final String message = _messageController.text.trim();

    // Show loading indicator
    setState(() => _isSending = true);

    try {
      if (kDebugMode) {
        print('DEBUG: Attempting to send email...');
        print('DEBUG: Name: $name');
        print('DEBUG: Email: $email');
        print('DEBUG: Subject: $subject');
      }

      // Build a plain-text message body (used for mailto fallback).
      // Per request: body should be only the message with sender's name at last.
      final String emailBody = [
        message,
        '',
        name,
      ].join('\r\n');

      if (kDebugMode) {
        print('DEBUG: Prepared message body');
        print('DEBUG: Recipient: $_destinationEmail');
        print('DEBUG: Subject: $subject');
      }

      // Try sending via Gmail API (client-side).
      try {
        String? accessToken;

        if (kIsWeb) {
          // Prefer Google Identity Services token client injected in web/index.html
          try {
            final promise =
                js_util.getProperty(js_util.globalThis, 'requestGisToken');
            if (promise != null) {
              final future = js_util.promiseToFuture(js_util
                  .callMethod(js_util.globalThis, 'requestGisToken', []));
              final tokenResp = await future;
              accessToken =
                  js_util.getProperty(tokenResp, 'access_token') as String?;
            }
          } catch (gisError) {
            if (kDebugMode) print('DEBUG: GIS token helper failed: $gisError');
          }
        }

        // If not web or GIS helper failed, fall back to google_sign_in package
        if (accessToken == null) {
          GoogleSignInAccount? account = await _googleSignIn.signInSilently();
          account ??= await _googleSignIn.signIn();
          if (account == null) throw Exception('Google sign-in required');
          final auth = await account.authentication;
          accessToken = auth.accessToken;
        }

        if (accessToken == null) throw Exception('No access token available');

        String buildRaw(String from, String to, String subject, String body) {
          final msg = [
            'From: $from',
            'To: $to',
            'Subject: $subject',
            'MIME-Version: 1.0',
            'Content-Type: text/plain; charset="utf-8"',
            '',
            body,
          ].join('\r\n');
          String encoded = base64UrlEncode(utf8.encode(msg));
          encoded = encoded.replaceAll('=', '');
          return encoded;
        }

        final to = _destinationEmail;
        // Use the email filled in the form for the 'From' header.
        // Keep it explicit: prefer the form email so recipients see the sender's email.
        // Note: Gmail may still rewrite the visible sender to the authenticated account.
        String from = email;
        // Ensure the message body ends with the sender's name as the last line.
        // Per request: the email body should be only the message with the sender's name at last.
        final rawBody = [
          message,
          name,
        ].join('\r\n');

        final raw = buildRaw(from, to,
            subject.isNotEmpty ? subject : 'Contact from $name', rawBody);

        final resp = await http.post(
          Uri.parse(
              'https://gmail.googleapis.com/gmail/v1/users/me/messages/send'),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json; charset=utf-8',
          },
          body: jsonEncode({'raw': raw}),
        );

        if (resp.statusCode == 200 || resp.statusCode == 202) {
          if (kDebugMode) print('DEBUG: Gmail API send success');
        } else {
          if (kDebugMode)
            print(
                'DEBUG: Gmail API send failed: ${resp.statusCode} ${resp.body}');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'Gmail API send failed (${resp.statusCode}). Opening mail client...')),
            );
          }
          await _sendEmailFallback(name, email, subject, emailBody);
        }
      } catch (e) {
        if (kDebugMode) print('DEBUG: Gmail client send failed: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                    'Failed to send via Gmail API — opening mail client...')),
          );
        }
        await _sendEmailFallback(name, email, subject, emailBody);
      }

      // Clear form on success
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Message sent (or opened email composer).'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('DEBUG: Error sending email: $e');
        print('DEBUG: Error type: ${e.runtimeType}');
      }

      // Try fallback method using url_launcher
      await _sendEmailFallback(name, email, subject, message);
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  Future<void> _sendEmailFallback(
      String name, String email, String subject, String message) async {
    try {
      if (kDebugMode) {
        print('DEBUG: Trying fallback email method...');
      }

      // Build a mailto body that is only the message with the sender's name on the last line.
      final String fallbackBody = [
        message,
        name,
      ].join('\r\n');

      final String emailUrl = 'mailto:$_destinationEmail?'
          'subject=${Uri.encodeComponent(subject)}&'
          'body=${Uri.encodeComponent(fallbackBody)}';

      final Uri uri = Uri.parse(emailUrl);
      if (kDebugMode) print('DEBUG: Fallback email URL: $emailUrl');

      final bool confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Open email client?'),
              content: const Text(
                  'This will open your email client to send the message. Continue?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Open')),
              ],
            ),
          ) ??
          false;

      if (!confirm) return;

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        if (kDebugMode) print('DEBUG: Fallback email opened successfully');

        // Clear form on success
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email client opened with fallback method!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        print('DEBUG: Cannot launch email URL');
        _showContactDialog();
      }
    } catch (fallbackError) {
      print('DEBUG: Fallback method also failed: $fallbackError');
      _showContactDialog();
    }
  }

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📧 Email: $_destinationEmail'),
            SizedBox(height: 8),
            Text('📱 Phone: +1234567890'), // Replace with actual phone
            SizedBox(height: 8),
            Text('💼 LinkedIn: linkedin.com/in/nainaiu-rakhaine'),
            SizedBox(height: 16),
            Text(
              'You can also send your message directly to the email address above.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final titleFont = isMobile ? 18.0 : (isTablet ? 24.0 : _titleFontSize);
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: titleFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: theme.textTheme.bodyMedium!.color,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
      color: theme.scaffoldBackgroundColor,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.phone,
                  size: isMobile ? 20 : 24,
                  color: theme.textTheme.bodyMedium!.color,
                ),
                const SizedBox(width: 20),
                Text(
                  'Contact Me',
                  style: headingStyle,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Responsive Name / Email
            if (!isMobile)
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _nameController,
                      label: 'Name',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      theme: theme,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      theme: theme,
                    ),
                  ),
                ],
              )
            else ...[
              _buildTextField(
                controller: _nameController,
                label: 'Name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                theme: theme,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                theme: theme,
              ),
            ],

            const SizedBox(height: 20),
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
              theme: theme,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
              theme: theme,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isSending ? null : _sendEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                side: BorderSide(color: theme.colorScheme.primary),
              ),
              child: _isSending
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    required ThemeData theme,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textAlign: TextAlign.start,
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: TextStyle(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: theme.colorScheme.surface.withOpacity(0.8),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.colorScheme.outline.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
