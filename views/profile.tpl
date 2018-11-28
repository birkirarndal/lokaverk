<!DOCTYPE html>
<html>
<head>
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  	<script>tinymce.init({ selector:'textarea' });</script>
	<link rel="stylesheet" type="text/css" href="/static/style.css">
	<title>Profile</title>
</head>
<body>
	<h2>Your profile {{u}}</h2>
	<form method="post" action="/nyblog" accept-charset="ISO-8859-1">
	<textarea name="blog" cols="100" rows="5"></textarea>
		<input type="text" name="user" required> | <input type="submit" name="skrifa blog">
		
	</form>
	<a href="/">Signout</a>
</body>
</html>