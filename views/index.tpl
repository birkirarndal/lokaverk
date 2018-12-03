<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<title>Lokaverkefni</title>
	<link rel="stylesheet" type="text/css" href="/static/style.css">
</head>
<body>
	<h3>Lokaverkefni</h3>
	<p><a href="/login">Login/register</a></p>
	
	% for x in range(2):
		<h3>{{rows[x][0]}}</h3>
		<hr>
	% end

</body>
</html>