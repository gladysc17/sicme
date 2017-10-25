<%-- 
    Document   : newjsp
    Created on : 22-may-2017, 22:47:52
    Author     : Gladys M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<title></title>
<script type="text/javascript">
function validatePass(campo) {
    var RegExPattern = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$/;
    var errorMessage = 'Password Incorrecta.';
    if ((campo.value.match(RegExPattern)) && (campo.value!='')) {
        alert('Password Correcta'); 
    } else {
        alert(errorMessage);
        campo.focus();
    } 
}

</script>
</head>
<body>
<form action="#" method="post">
    <p><input type="text" name="date" onclick="validatePass(this);">
  <input name="button" type="button" value="Probar">
  <br>
  Entre 8 y 10 caracteres, por lo menos un digito y un alfanumérico, y no  puede contener caracteres espaciales
</form>
</body>
</html> 