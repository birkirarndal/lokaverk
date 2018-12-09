<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/static/style.css">
	<title>Blogs</title>
	% empty = True

	
	% if len(rows) != 0:
		% empty = False
	% end
	
	% if empty:
		<h3>Það eru engin blogs á síðunni</h3>
		<a href="/">Forsíða</a>
	% else:
	<style>
		table {
		border-collapse: collapse;
		width: 100%
		}

		td, th {
			border: 1px solid black;
			text-align: left;
			padding: 8px;
			width: 50%;
		}
		tr:nth-child(even) {
			background-color: gray;
		}
		tr:nth-child(odd) {
			background-color: white;
		}

	</style>
</head>
<body>
	<h2>Blogs</h2>
	<p>Blogs:</p>
	<table>
		% cnt = 0
		%for row in rows:
		<tr>
			%for col in row:
			<td>{{col}}</td>
			%end
			<td><a href="/change/<{{rows[cnt][0]}}>">Edit</a></td>
			<td><a href="/del/<{{rows[cnt][0]}}>">Delete</a></td>
		</tr>
		% cnt +=1
		%end
	</table>

	<a href="/">Aftur á Forsíðu</a>
	<a href="/change">Breyta</a>
</body>
</html>