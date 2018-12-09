<!DOCTYPE html>
<html>

<head>
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  	<script>tinymce.init({ selector:'textarea', forced_root_block : ''});</script>
	<title>Change</title>
	<link rel="stylesheet" type="text/css" href="/static/style.css">

	


</head>
<body>

		<h2>Update blog</h2>

	
		% cnt = 0
		<form method="post" action="/update" accept-charset="ISO-8859-1">
			%for row in rows:
				%for col in row:
				% if cnt == 1:
					<textarea name="blog" cols="100" rows="5">{{col}}</textarea>
					<input hidden="True" type="text" name="id"value="{{rows[0][0]}}">
						<input type="submit" name="update blog">
				%end
			% cnt += 1
			%end
		</form>


</body>
</html>