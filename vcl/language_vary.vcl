if ( req.url.path !~ "^/[a-zA-Z]{2}(?:-[a-zA-Z]{2})?/" ) {
  set req.http.Vary = "Accept-Language";
}
