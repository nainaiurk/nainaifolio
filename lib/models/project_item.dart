class ProjectItem {
  final String title;
  final String subtitle;
  final String imageUrl;
  // Optional links and media for the project detail modal
  final String? documentationUrl;
  final String? videoUrl;
  final List<String>? otherLinks;
  final List<String>? images; // additional images
  final String? description;
  final List<String>? achievements;
  final String? contest; // e.g., 'IEEE Robotics Challenge 2023' or null

  ProjectItem({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.documentationUrl,
    this.videoUrl,
    this.otherLinks,
    this.images,
    this.description,
    this.achievements,
    this.contest,
  });
}
