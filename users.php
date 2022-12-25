<?php 

?>
<style>
	body{
    background: url(jenn.jpeg);
  }
  main{
  	margin-left: unset !important;
  	width: calc(80%) !important
  }
</style>
<div class="container-fluid">
	
	<div class="row">
	<div class="col-lg-12">
			<button class="btn btn-danger float-center btn-sm" id="new_user"><i class="fa fa-plus"></i> New Student</button>
	</div>
	</div>
	<br>
	<div class="row">
		<div class="">
			<div class="card-body">
				<table class="table-normal table-bordered col-md-12">
				<div class="col-md-12">
	<div class="">
		<div class="">
			<table class="table table-bordered">
				<colgroup>
				<col width="5%">
				<col width="50%">
				<col width="35%">
				<col width="10%">
				<col width="200%">
				</colgroup>
			<thead>
				<tr>
					<th class="text-center">id</th>
					<th class="text-center">student id</th>
					<th class="text-center">last name</th>
					<th class="text-center">first Name</th>
					<th class="text-center">middle name</th>
					<th class="text-center">program</th>
					<th class="text-center">year level</th>
					<th class="text-center">vote status</th>
					<th class="text-center">voters key</th>
					<th class="text-center">user Name</th>
					<th class="text-center">password</th>
					<th class="text-center">type</th>
				</tr>
			</thead>
			<tbody>
				<?php
 					include 'db_connect.php';
 					$users = $conn->query("SELECT * FROM users order by name asc");
 					$i = 1;
 					while($row= $users->fetch_assoc()):
				 ?>
				 <tr>
				 	<td>
				 		<?php echo $i++ ?>
				 	</td>
					 <td>
				 		<?php echo $row['sid'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['lname'] ?>
				 	</td>
				 	<td>
				 		<?php echo $row['name'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['mname'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['program'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['year'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['vstatus'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['vkey'] ?>
				 	</td>
				 	<td>
				 		<?php echo $row['username'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['password'] ?>
				 	</td>
					 <td>
				 		<?php echo $row['type'] ?>
				 	</td>
				 	<td>
				 		<center>
								  <div class="text-center">
								    <a class="btn btn-sm btn-primary edit_user" href="javascript:void(0)" data-id = '<?php echo $row['id'] ?>'>Update</a>
								    <a class="btn btn-sm btn-danger delete_user" href="javascript:void(0)" data-id = '<?php echo $row['id'] ?>'>Remove</a>
								  </div>
								</div>
								</center>
				 	</td>
				 </tr>
				<?php endwhile; ?>
			</tbody>
		</table>
			</div>
		</div>
	</div>

</div>

                
            </tbody>
        </table>
    </div>
</body>
</html>
<script>
	
$('#new_user').click(function(){
	uni_modal('New User','manage_user.php')
})
$('.edit_user').click(function(){
	uni_modal('Edit User','manage_user.php?id='+$(this).attr('data-id'))
})

</script>