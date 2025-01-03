class AppConstant {
  static const String getTrendingNews =
      "https://newsapi.org/v2/everything?q=tesla&from=2024-12-03&sortBy=publishedAt&apiKey=a93b081cfe6341c58fb28de53bcbf179";

  static const String getBreakingNews =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a93b081cfe6341c58fb28de53bcbf179";
// This method builds the URL dynamically based on the category name
  static String getCategoryNews(String categoryName) {
    return "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=a93b081cfe6341c58fb28de53bcbf179";
  }
}
