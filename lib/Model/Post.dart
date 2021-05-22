class Post {
  final String post_id;
  final String user_id;
  final String description;
  final String visibility_score;
  final String post_image;

  Post(
      {this.post_id,
      this.user_id,
      this.description,
      this.visibility_score,
      this.post_image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        post_id: json['post_id'],
        user_id: json['user_id'],
        description: json['description'],
        visibility_score: json['visibility_score'],
        post_image: json['post_image']);
  }
}
