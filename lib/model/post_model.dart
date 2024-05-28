class Post {
  String? name;
  String? img_url;
  String? caption;
  String? date;

  Post({this.name, this.img_url, this.caption, this.date});

  Post.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img_url = json['img_url'],
        caption = json['caption'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'img_url': img_url,
        'caption': caption,
        'date': date,
      };
}
