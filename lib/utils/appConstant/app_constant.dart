class AppConstant {
  // Get yesterday's date in the required format (YYYY-MM-DD)
  static String getFormattedDate() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";
  }

  // Base URL for trending news with a dynamically calculated date
  static String getTrendingNews() {
    final formattedDate = getFormattedDate();
    return "https://newsapi.org/v2/everything?q=tesla&from=$formattedDate&sortBy=publishedAt&apiKey=bce6923a79b64f8db20607d7711449fd";
  }

  static const String getBreakingNews =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=bce6923a79b64f8db20607d7711449fd";

// This method builds the URL dynamically based on the category name
  static String getCategoryNews(String categoryName) {
    return "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=bce6923a79b64f8db20607d7711449fd";
  }
}
