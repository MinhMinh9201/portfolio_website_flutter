class UrlSocialModel {
  String icon;
  String name;
  int isFromFirebase;
  String url;
  String description;
  UrlSocialModel(
      {this.description, this.icon, this.isFromFirebase, this.name, this.url});

  factory UrlSocialModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return UrlSocialModel(
        description: json['description'],
        icon: json['icon'],
        name: json['name'],
        url: json['url'],
        isFromFirebase: json['isFromFirebase']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "url": this.url,
      "icon": this.icon,
      "name": this.name,
      "description": this.description,
      "isFromFirebase": this.isFromFirebase
    };
    return data;
  }

  @override
  String toString() {
    return '{ "url": "${this.url}", "icon": "${this.icon}",  "name": "${this.name}", "description": "${this.description}","isFromFirebase": ${this.isFromFirebase}}';
  }
}
