<!DOCTYPE html>
<html>
<head>
	<title>Change</title>

	<table>
		<h2>Blogs</h2>
	<p>Blogs:</p>
	<table>
		%for row in rows:
		<tr>
			%for col in row:
			<td>{{col}}</td>
			%end
		</tr>
		%end
	</table>


	</table>
</head>
<body>

</body>
</html>