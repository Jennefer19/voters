<?php include('db_connect.php');?>
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
	<div class="card">
		<div class="card-body">
			<table class="table table-bordered">
				<colgroup>
				<col width="5%">
				<col width="30%">
				<col width="35%">
				<col width="10%">
				<col width="200%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">id</th>
						<th class="text-center">Title</th>
						<th class="text-center">Descrition</th>
						<th class="text-center">Default</th>
						<th class="text-center">Action</th>
					</tr>
				</thead>
				<?php
				$i = 1;
				$vote = $conn->query("SELECT * FROM voting_list order by id asc");
				while($row=$vote->fetch_assoc()):?>
				<tr>
					<td class="text-center"><?php echo $i++ ?></td>
					<td class=""><a href="index.php?page=manage_voting&id=<?php echo $row['id'] ?>"><?php echo $row['title'] ?></a></td>
					<td class=""><?php echo $row['description'] ?></td>
					<?php if($row['is_default'] == 1): ?>
						<td class="text-center"><div class="badge badge-success">setup</div></td>
						<?php elseif($row['is_default'] == 0):  ?>
							<td class="text-center"><div class="badge badge-info update_default" data-id="<?php echo $row['id'] ?>">not</div></td>
							<?php endif; ?>
							<td class="text-center">
								<button class="btn btn-sm btn-primary edit_voting" type="button" data-id="<?php echo $row['id'] ?>">Update</button>
								<button class="btn btn-sm btn-danger delete_voting" type="button" data-id="<?php echo $row['id'] ?>">Remove</button>
							</td>
				</tr>
				<?php endwhile; ?>
			</table>
		</div>
	</div>
	<br>
	<br>
</div>
<!-- Table Panel -->

<!-- FORM Panel -->
<div class="col-md-12 text-center text-white">
	<form action="" id="manage-voting">
		<div class="card bg-dark">
			<div class="card-header">Create Title</div>
			<div class="card-body">
				<input type="hidden" name="id">
				<div class="form-group">
					<label class="control-label">Title</label>
					<input type="text" class="form-control" name="title">
				</div>
				<div class="card-body">
					<div class="form-group">
						<label class="control-label">Description</label>
						<textarea type="text" class="form-control" name="description"></textarea>
					</div>
					<div class="card-footer text-center">
						<div class="row text-center">
							<div class="col-md-6">
								<button class="btn btn-sm btn-primary col-md-12"> Save</button>
							</div>
						</div>
					</div>
					<!-- FORM Panel -->
				</div>
			</div>	
		</div>
</div>

<script>
$('#manage-voting').submit(function(e){
	e.preventDefault()
	start_load()
	$.ajax({
		url:'ajax.php?action=save_voting',
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
				},1500)}}})})
	$('.edit_voting').click(function(){
		start_load()
		var cat = $('#manage-voting')
		var _this = $(this)
		cat.get(0).reset()
		$.ajax({
			url:'ajax.php?action=get_voting',
			method:'POST',
			data:{id:_this.attr('data-id')},
			success:function(resp){
				if(typeof resp != undefined){
					
					resp = JSON.parse(resp)
					cat.find('[name="id"]').val(_this.attr('data-id'))
					cat.find('[name="title"]').val(resp.title)
					cat.find('[name="description"]').val(resp.description)
					end_load()
				}
			}
		})
	})
	$('.update_default').click(function(){
		_conf("Are you sure to set this data as default?","update_default",[$(this).attr('data-id')])
		
	})
	$('.delete_voting').click(function(){
		_conf("Are you sure to delete this data?","delete_voting",[$(this).attr('data-id')])
	})
	function update_default($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=update_voting',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp == 1){
					alert_toast("Data successfully updated",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
			}
		})
	}
	function delete_voting($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_voting',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp == 1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>