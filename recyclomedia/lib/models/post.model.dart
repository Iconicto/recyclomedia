import 'package:recyclomedia/models/user.model.dart';

class Post {
  int postId;
  String title;
  String banner;
  String type;
  Null link;
  String content;
  User postedBy;
  String createdAt;
  String updatedAt;

  Post(
      {this.postId,
      this.title,
      this.banner,
      this.type,
      this.link,
      this.content,
      this.postedBy,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    title = json['title'];
    banner = json['banner'];
    type = json['type'];
    link = json['link'];
    content = json['content'];
    postedBy =
        json['posted_by'] != null ? new User.fromJson(json['posted_by']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['title'] = this.title;
    data['banner'] = this.banner;
    data['type'] = this.type;
    data['link'] = this.link;
    data['content'] = this.content;
    if (this.postedBy != null) {
      data['posted_by'] = this.postedBy.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
