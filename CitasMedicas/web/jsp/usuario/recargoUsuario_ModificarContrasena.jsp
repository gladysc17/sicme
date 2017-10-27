<%-- 
    Document   : recargoUsuario_ModificarContrasena
    Created on : 1/09/2017, 08:52:52 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-md-2"></div>
<div class="col-md-6">
    <div class="panel panel-default">
        <div class="panel-heading" align="center">                                        
            <h3>Modificar Contraseña </h3>                                                                                  
        </div>                    
        <div class="panel-body">  
            <form action="../controlador/procesarModificarContrasena.jsp" method="post" name="form">
                
                <%
                 String id = request.getParameter("id");
                 String tipo = request.getParameter("tipo");
                 System.out.println("id rec "+id + "tipo " + tipo);
                %>
                <div class="form-group" id="contrasena"> 
                    <input type="hidden" id="id" name="id" value="<%=id%>">
                    <input type="hidden" id="tipo" name="tipo" value="<%=tipo%>">
                    <div class="col-sm-4">
                        <label class="control-label">Nueva Contraseña: </label>
                        <input type="password" class="form-control" id="contrasena1" name="contrasena1" required onkeyup="validatePassword();" alt="Nueva Contraseña">
                    </div>

                    <div class="col-sm-4">
                        <label class="control-label">Repetir Contraseña: </label>
                        <input type="password" class="form-control" id="contrasena2" name="contrasena2" required onkeyup="validatePassword();" alt="Repetir Contraseña">
                    </div>  
                    <div class="col-sm-6">
                        <label class="control-label"> </label>
                        <input class="btn btn-success btn-block" type="button" value="MODIFICAR" onclick="validate();">

                    </div>
                </div>
            </form>
        </div>

    </div>

    <script>
        function validate() {
            var password1 = document.getElementById("contrasena1");
            var password2 = document.getElementById("contrasena2");

            
            if (!validateFieldNull(password1)) {
                return;
            }
            if (!validateFieldNull(password2)) {
                return;
            }

            if (password1.value != password2.value) {
                alert("No se ha validado correctamente la contraseña");
                return;
            } else {
                document.form.submit();
            }
        }

        function validatePassword() {

            var password1 = document.getElementById("contrasena1");
            var password2 = document.getElementById("contrasena2");           

            if (password1.value == "" && password2.value == "") {
                password1.style.background = 'white';
                password2.style.background = 'white';
            }

            if ((password1.value != password2.value)) {
                password1.style.background = '#FF4A4A';
                password2.style.background = '#FF4A4A';
            }

            if ((password1.value == password2.value) && password1.value != "") {
                password1.style.background = '#13F926';
                password2.style.background = '#13F926';
            }
        }
    </script>
    <div class="col-md-2"></div>
