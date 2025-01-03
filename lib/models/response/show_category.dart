class ShowCategory {
  String? author;
  String? title;
  String? decsription;
  String? url;
  String? urlToImage;
  String? content;

  ShowCategory({
    this.author,
    this.title,
    this.decsription,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory ShowCategory.fromJson(Map<String, dynamic> json) {
    return ShowCategory(
        author: json['author'],
        title: json['title'],
        decsription: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content']);
  }
}
