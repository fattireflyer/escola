<?php 
session_start();

if (isset($_POST['uname']) &&
    isset($_POST['senha']) &&
    isset($_POST['role'])) {

	include "../DB_connection.php";
	
	$usuario = $_POST['uname'];
	$senha = $_POST['senha'];
	$role = $_POST['role'];

	if (empty($usuario)) {
		$em  = "Necessário usuário";
		header("Location: ../login.php?error=$em");
		exit;
	}else if (empty($senha)) {
		$em  = "Necessário senha";
		header("Location: ../login.php?error=$em");
		exit;
	}else if (empty($role)) {
		$em  = "An error Occurred";
		header("Location: ../login.php?error=$em");
		exit;
	}else {
        
        if($role == '1'){
        	$sql = "SELECT * FROM admin 
        	        WHERE username = ?";
        	$role = "Admin";
        }else if($role == '2'){
        	$sql = "SELECT * FROM teachers 
        	        WHERE username = ?";
        	$role = "Teacher";
        }else {
        	$sql = "SELECT * FROM students 
        	        WHERE username = ?";
        	$role = "Student";
        }

        $stmt = $conn->prepare($sql);
        $stmt->execute([$usuario]);

        if ($stmt->rowCount() == 1) {
        	$user = $stmt->fetch();
        	$nomeUsuario = $user['username'];
        	$senhaUsuario = $user['password'];
        	
            if ($nomeUsuario === $usuario) {
            	if (password_verify($senha, $senhaUsuario)) {
            		$_SESSION['role'] = $role;
            		if ($role == 'Admin') {
                        $id = $user['admin_id'];
                        $_SESSION['admin_id'] = $id;
                        header("Location: ../admin/index.php");
                        exit;
                    }
				    
            	}else {
		        	$em  = "Incorrect Username or senhaword";
				    header("Location: ../login.php?error=$em");
				    exit;
		        }
            }else {
	        	$em  = "Usuário ou Senha incorretos";
			    header("Location: ../login.php?error=$em");
			    exit;
	        }
        }else {
        	$em  = "Usuário ou Senha incorrtos";
		    header("Location: ../login.php?error=$em");
		    exit;
        }
	}


}else{
	header("Location: ../login.php");
	exit;
}