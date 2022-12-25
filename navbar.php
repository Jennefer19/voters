
<nav id="buttom" class='mx-lt-1 bg-jenn.jpeg' >
		
		<div class="nav-bar text-center">
			<br>
			<br>
		</div>
		<body>
    <header class="header_section">
      <div class="container text-center">
        <nav class="navbar navbar-expand-lg custom_nav-container">
			
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=home">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=categories">Position</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=voting_list">Candidates</a>
                </li>
				        <li class="nav-item">
                    <a class="nav-link" href="index.php?page=users">Students</a>
                </li>
            </ul>
          </div>
          <div class="" id="">

</nav>
<script>
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>