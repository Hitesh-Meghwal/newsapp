class AppConstant {
  static const String apiKey = "a93b081cfe6341c58fb28de53bcbf179";
  // Get yesterday's date in the required format (YYYY-MM-DD)
  static String getFormattedDate() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";
  }

  // Base URL for trending news with a dynamically calculated date
  static String getTrendingNews() {
    final formattedDate = getFormattedDate();
    return "https://newsapi.org/v2/everything?q=tesla&from=$formattedDate&sortBy=publishedAt&apiKey=$apiKey";
  }

  static const String getBreakingNews =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey";

// This method builds the URL dynamically based on the category name
  static String getCategoryNews(String categoryName) {
    return "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=$apiKey";
  }
}
