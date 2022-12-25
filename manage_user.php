<?php 
include('db_connect.php');
if(isset($_GET['id'])){
$user = $conn->query("SELECT * FROM users where id =".$_GET['id']);
foreach($user->fetch_array() as $k =>$v){
	$meta[$k] = $v;
}
}
?>
<div class="container-fluid">
	
	<form action="" id="manage-user">
		<input type="hidden" name="id" value="<?php echo isset($meta['id']) ? $meta['id']: '' ?>">
		<div class="form-group">
			<label for="sid">Student Id</label>
			<input type="text" name="sid" id="sid" class="form-control" value="<?php echo isset($meta['sid']) ? $meta['sid']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="lname">Last Name</label>
			<input type="text" name="lname" id="lname" class="form-control" value="<?php echo isset($meta['lname']) ? $meta['lname']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="name">First Name</label>
			<input type="text" name="name" id="name" class="form-control" value="<?php echo isset($meta['name']) ? $meta['name']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="mname">Middle Name</label>
			<input type="text" name="mname" id="mname" class="form-control" value="<?php echo isset($meta['mname']) ? $meta['mname']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="=program">Program</label>
			<input type="text" name="program" id="program" class="form-control" value="<?php echo isset($meta['program']) ? $meta['program']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="year">Year Level</label>
			<input type="text" name="year" id="year" class="form-control" value="<?php echo isset($meta['year']) ? $meta['year']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="vstatus">Vote Status</label>
			<input type="text" name="vstatus" id="vstatus" class="form-control" value="<?php echo isset($meta['vstatus']) ? $meta['vstatus']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="vkey">Voters Key</label>
			<input type="text" name="vkey" id="vkey" class="form-control" value="<?php echo isset($meta['vkey']) ? $meta['vkey']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="username">Username</label>
			<input type="text" name="username" id="username" class="form-control" value="<?php echo isset($meta['username']) ? $meta['username']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="password">Password</label>
			<input type="password" name="password" id="password" class="form-control" value="<?php echo isset($meta['password']) ? $meta['id']: '' ?>" required>
		</div>
		<div class="form-group">
			<label for="type">User Type</label>
			<select name="type" id="type" class="custom-select">
				<option value="1" <?php echo isset($meta['type']) && $meta['type'] == 1 ? 'selected': '' ?>>Admin</option>
				<option value="2" <?php echo isset($meta['type']) && $meta['type'] == 2 ? 'selected': '' ?>>Student</option>
			</select>
		</div>
	</form>
</div>
<script>
	$('#manage-user').submit(function(e){
		e.preventDefault();
		start_load()
		$.ajax({
			url:'ajax.php?action=save_user',
			method:'POST',
			data:$(this).serialize(),
			success:function(resp){
				if(resp ==1){
					alert_toast("Data successfully saved",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
			}
		})
	})
</script>
