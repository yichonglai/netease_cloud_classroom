class BrowserParamsType {
  BrowserParamsType({this.title, this.url}): assert(url != null, 'The "url" param must not be a null!');
  final String url;
  final String title;
}