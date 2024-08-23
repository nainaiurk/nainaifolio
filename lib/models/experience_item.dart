class ExperienceItem {
  final String title;
  final String description;
  final String type; // e.g., 'Achievement', 'Job', 'Contest'
  final String imageUrl; // URL for the image

  ExperienceItem({
    required this.title,
    required this.description,
    required this.type,
    required this.imageUrl,
  });
}
