class ArticleModel {
  String? author;
  String? title;
  String? decsription;
  String? url;
  String? urlToImage;
  String? content;

  ArticleModel({
    this.author,
    this.title,
    this.decsription,
    this.url,
    this.urlToImage,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        author: json['author'],
        title: json['title'],
        decsription: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content']);
  }
}
