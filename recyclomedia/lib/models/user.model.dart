class User {
  String firstName;
  String lastName;
  String email;
  int experiencePoints;
  String profilePicture;
  List<Badges> badges;
  int badgeExperiencePoints;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.experiencePoints,
      this.profilePicture,
      this.badges,
      this.badgeExperiencePoints});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    experiencePoints = json['experience_points'];
    profilePicture = json['profile_picture'];
    if (json['badges'] != null) {
      badges = new List<Badges>();
      json['badges'].forEach((v) {
        badges.add(new Badges.fromJson(v));
      });
    }
    badgeExperiencePoints = json['badge_experience_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['experience_points'] = this.experiencePoints;
    data['profile_picture'] = this.profilePicture;
    if (this.badges != null) {
      data['badges'] = this.badges.map((v) => v.toJson()).toList();
    }
    data['badge_experience_points'] = this.badgeExperiencePoints;
    return data;
  }
}

class Badges {
  int badgeId;
  String name;
  String description;
  String icon;
  int pointAwarded;

  Badges(
      {this.badgeId,
      this.name,
      this.description,
      this.icon,
      this.pointAwarded});

  Badges.fromJson(Map<String, dynamic> json) {
    badgeId = json['badge_id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    pointAwarded = json['point_awarded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['badge_id'] = this.badgeId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['point_awarded'] = this.pointAwarded;
    return data;
  }
}
