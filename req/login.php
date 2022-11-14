<?php
session_start();

if (isset($_POST['usuario']) &&
    isset($_POST['senha']) &&
	isset($_POST['role'])) {

	include '../DB_connection.php';
	
	$usuario = $_POST['usuario'];
	$senha = $_POST['senha'];
	$role = $_POST['role'];

	if (empty($usuario)) {
		$em  = "Necessário usuário";
		header('Location: ../login.php?error='.$em);
		exit;
	} elseif (empty($senha)) {
		$em  = "Necessário senha";
		header('Location: ../login.php?error='.$em);
		exit;
	} elseif (empty($role)) {
		$em = "Erro: tipo de usuário não selecionado";
		header('Location: ../login.php?error='.$em);
		exit;
	} else {
        
        if($role == '1'){
        	$sql = "SELECT * FROM admin WHERE usuario = ?";
        	$role = "Admin";
        }else if($role == '2'){
        	$sql = "SELECT * FROM professores WHERE usuario = ?";
        	$role = "Professor";
        }else {
        	$sql = "SELECT * FROM alunos WHERE usuario = ?";
        	$role = "Aluno";
        }

        $stmt = $conn->prepare($sql);
        $stmt->execute([$usuario]);

        if ($stmt->rowCount() == 1) {
        	$user = $stmt->fetch();
        	$username = $user['usuario'];
        	$password = $user['senha'];
        	
            if ($username === $usuario) {
            	if (password_verify($senha, $password)) {
            		$_SESSION['role'] = $role;
            		if ($role == 'Admin') {
                        $id = $user['admin_id'];
                        $_SESSION['admin_id'] = $id;
                        header('Location: ../admin/index.php');
                        exit;
                    }
				    
            	}else {
		        	$em  = "Usuário ou Senha incorretos";
				    header('Location: ../login.php?error='.$em);
				    exit;
		        }
            }else {
	        	$em  = "Usuário ou Senha incorretos";
				header('Location: ../login.php?error='.$em);
			    exit;
	        }
        }else {
        	$em  = "Usuário ou Senha incorretos";
			header('Location: ../login.php?error='.$em);
		    exit;
        }
	}

} else {
	header('Location: ../login.php');
	exit;
}