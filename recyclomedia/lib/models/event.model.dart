class Event {
  int eventId;
  String name;
  String time;
  String duration;
  String content;
  String banner;
  ManagedBy managedBy;

  Event(
      {this.eventId,
      this.name,
      this.time,
      this.duration,
      this.content,
      this.banner,
      this.managedBy});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    name = json['name'];
    time = json['time'];
    duration = json['duration'];
    content = json['content'];
    banner = json['banner'];
    managedBy = json['managed_by'] != null
        ? new ManagedBy.fromJson(json['managed_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['name'] = this.name;
    data['time'] = this.time;
    data['duration'] = this.duration;
    data['content'] = this.content;
    data['banner'] = this.banner;
    if (this.managedBy != null) {
      data['managed_by'] = this.managedBy.toJson();
    }
    return data;
  }
}

class ManagedBy {
  String name;
  String email;
  String orgPicture;

  ManagedBy({this.name, this.email, this.orgPicture});

  ManagedBy.fromJson(Map<String, dynamic> json) {
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
