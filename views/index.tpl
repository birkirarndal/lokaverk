<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<title>Lokaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/static/style.css">
	<style type="text/css">
		.blog {
			background-color: white;
			padding: 1em;

		}

	</style>

</head>
<body>
	<h3>Lokaverkefni</h3>
	<p><a href="/login">Login/register</a></p>
	% for x in rows:
	% for y in x:
		<h3 class="blog">{{y}}</h3>
		<hr>
	% end
	% end

</body>
</html>