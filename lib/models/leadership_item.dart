class LinkSegment {
  final String text;
  final String? url;

  const LinkSegment(this.text, {this.url});
}

class LeadershipItem {
  final String title;
  final String period;
  final String? titleUrl;
  final List<List<LinkSegment>> highlights;

  const LeadershipItem({
    required this.title,
    required this.period,
    this.titleUrl,
    required this.highlights,
  });
}
