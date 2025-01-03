class SliderModel {
  String? author;
  String? title;
  String? decsription;
  String? url;
  String? urlToImage;
  String? content;

  SliderModel(
      {this.author,
      this.title,
      this.decsription,
      this.url,
      this.urlToImage,
      this.content});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
        author: json['author'],
        title: json['title'],
        decsription: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        content: json['content']);
  }
}
