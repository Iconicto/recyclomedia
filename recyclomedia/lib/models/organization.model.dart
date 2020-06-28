class Organization {
  String name;
  String email;
  String orgPicture;

  Organization({this.name, this.email, this.orgPicture});

  Organization.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    orgPicture = json['org_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['org_picture'] = this.orgPicture;
    return data;
  }
}
