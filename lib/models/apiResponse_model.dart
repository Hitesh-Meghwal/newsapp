class ApiresponseModel {
  String? status;
  int? totalResults;
  List<dynamic>? articles;

  ApiresponseModel({this.status, this.totalResults, this.articles});

  factory ApiresponseModel.fromJson(Map<String, dynamic> json) {
    return ApiresponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'],
    );
  }
}
