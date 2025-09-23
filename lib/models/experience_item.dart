class ExperienceItem {
  final String role;
  final String organization;
  final String period;
  final String location;
  final String summary;
  final String? supervisor;
  final List<String> highlights;
  final String? professorLink;

  const ExperienceItem({
    required this.role,
    required this.organization,
    required this.period,
    required this.location,
    required this.summary,
    this.supervisor,
    required this.highlights,
    this.professorLink,
  });
}
