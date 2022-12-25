<?php include('db_connect.php');?>

<div class="container-fluid">
	
	<div class="col-lg-120">
		<div class="row text-center">

			<!-- Table Panel -->
<style>
	body{
    background: url(jenn.jpeg);
  }
  main{
  	margin-left: unset !important;
  	width: calc(100%) !important
  }
</style>
			<div class="col-md-12">
				<div class="card text-center">
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">Number</th>
									<th class="text-center">Position</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
								<?php 
								$i = 1;
								$cats = $conn->query("SELECT * FROM category_list order by id asc");
								while($row=$cats->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="text-center"><?php echo $row['category'] ?></td>
									<td class="text-center">
										<button class="btn btn-sm btn-primary edit_cat" type="button" data-id="<?php echo $row['id'] ?>" data-name="<?php echo $row['category'] ?>">Edit</button>
										<button class="btn btn-sm btn-danger delete_cat" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>
								</tr>
								<?php endwhile; ?>
								<br>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
			</div>
			<!-- Table Panel -->
			<div class="col-md-12 text-white">
			<form action="" id="manage-category">
				<div class="card bg-dark">
					<div class="card-header">
						    Category Form
				  	</div>
					<div class="card-body">
							<input type="hidden" name="id">
							<div class="form-group">
								<label class="control-label">Position</label>
								<input type="text" class="form-control" name="category">
							</div>
					</div>
					<div class="card-footer text-center">
						<div class="row">
							<div class="col-md-10">
								<button class="btn btn-sm btn-success col-sm-8"> Create</button>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>	

</div>
<script>
	$('#manage-category').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=save_category',
			method:'POST',
			data:$(this).serialize(),
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully added",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
				else if(resp==2){
					alert_toast("Data successfully updated",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	})
	$('.edit_cat').click(function(){
		start_load()
		var cat = $('#manage-category')
		cat.get(0).reset()
		cat.find("[name='id']").val($(this).attr('data-id'))
		cat.find("[name='category']").val($(this).attr('data-name'))
		end_load()
	})
	$('.delete_cat').click(function(){
		_conf("Are you sure to delete this category?","delete_cat",[$(this).attr('data-id')])
	})
	function delete_cat($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_category',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>