class AppConstant {
  // Get yesterday's date in the required format (YYYY-MM-DD)
  static String getFormattedDate() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";
  }

  // Base URL for trending news with a dynamically calculated date
  static String getTrendingNews() {
    final formattedDate = getFormattedDate();
    return "https://newsapi.org/v2/everything?q=tesla&from=$formattedDate&sortBy=publishedAt&apiKey=9e81396202ec4df08b5c88d4467ab205";
  }

  static const String getBreakingNews =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9e81396202ec4df08b5c88d4467ab205";

// This method builds the URL dynamically based on the category name
  static String getCategoryNews(String categoryName) {
    return "https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=9e81396202ec4df08b5c88d4467ab205";
  }
}
