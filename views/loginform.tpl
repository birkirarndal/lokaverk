% rebase('login.tpl', title="Skráningarform")

<form method="post" action="/donyskra" accept-charset="ISO-8859-1" id="ny">
		<h3>Nýskrá</h3>
		<br>
		<label>
			Notandanafn:
			<br>
			<input type="text" name="user" required>
		</label>
		<br><br>
		<label>
			Lykilorð:
			<br>
			<input type="password" name="pass" required>
		</label>
		<br><br>
		<label>
			nafn:
			<br>
			<input type="name" name="nafn" required>
		</label>
		<br><br>
		<label>
			<input type="submit" value="Login">
		</label>
		<label>
			<input type="reset" value="hreinsa">
		</label>
	</form>
	<br><br>
	<hr>
	<h3>Innskráningarform</h3>	
	<form method="post" action="/doinnskra" accept-charset="ISO-8859-1" id="inn">
		<h3>Innskrá</h3>
		<br>
		<label>
			Notandanafn:
			<br>
			<input type="text" name="user"  required>
		</label>
		<br><br>
		<label>
			Lykilorð:
			<br>
			<input type="password" name="pass" required>
		</label>
		<br><br>
		<label>
		<input type="submit" value="Login">
	</form>