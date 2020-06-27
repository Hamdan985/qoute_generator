class Quote{
  final tags;
  final String quoteText;
  final String quoteAuthor;

  Quote({this.tags, this.quoteText, this.quoteAuthor});
  

   factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      tags: json['tags'],
      quoteText: json['content'],
      quoteAuthor: json['author'],
    );
  }

}