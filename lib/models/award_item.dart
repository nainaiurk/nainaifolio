import 'leadership_item.dart';

class AwardItem {
  final String title;
  final String issuer;
  final String date;
  final List<List<LinkSegment>> highlights;
  final List<String> tags;
  final String? credentialUrl;

  const AwardItem({
    required this.title,
    required this.issuer,
    required this.date,
    required this.highlights,
    this.tags = const <String>[],
    this.credentialUrl,
  });
}
