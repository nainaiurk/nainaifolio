import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static const double _titleFontSize = 28;

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
      print('DEBUG: Attempting to send email...');
      print('DEBUG: Name: $name');
      print('DEBUG: Email: $email');
      print('DEBUG: Subject: $subject');

      final Email emailToSend = Email(
        body: '''
Hello Nainai,

My name is: $name
My email is: $email

Message:
$message

Best regards,
$name
        ''',
        subject: subject,
        recipients: ['nainaiu.rk1234@gmail.com'],
        cc: [],
        bcc: [],
        attachmentPaths: [],
        isHTML: false,
      );

      print('DEBUG: Email object created successfully');
      print('DEBUG: Recipients: ${emailToSend.recipients}');
      print('DEBUG: Subject: ${emailToSend.subject}');

      await FlutterEmailSender.send(emailToSend);
      print('DEBUG: Email sent successfully');

      // Clear form on success
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email client opened successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print('DEBUG: Error sending email: $e');
      print('DEBUG: Error type: ${e.runtimeType}');

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
      print('DEBUG: Trying fallback email method...');

      final String emailUrl = 'mailto:nainaiu.rk1234@gmail.com?'
          'subject=${Uri.encodeComponent(subject)}&'
          'body=${Uri.encodeComponent('Hello Nainai,\n\n'
              'My name is: $name\n'
              'My email is: $email\n\n'
              'Message:\n$message\n\n'
              'Best regards,\n$name')}';

      final Uri uri = Uri.parse(emailUrl);
      print('DEBUG: Fallback email URL: $emailUrl');

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        print('DEBUG: Fallback email opened successfully');

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
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📧 Email: nainaiu.rk1234@gmail.com'),
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
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: _titleFontSize,
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
                  size: 24,
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
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value.trim())) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              theme: theme,
            ),
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
