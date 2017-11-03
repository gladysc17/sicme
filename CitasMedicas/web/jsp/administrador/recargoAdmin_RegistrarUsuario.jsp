<%-- 
    Document   : recargoAdmin_RegistrarUsuario
    Created on : 15-may-2017, 21:02:09
    Author     : Gladys M
--%>

<%@page import="DTO.ServicioDTO"%>
<%@page import="FACADE.FacadeServicio"%>
<%@page import="DTO.Programa_academicoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadePrograma_academico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">            
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 align="center">  REGISTRO USUARIO </h2>
        </div>
        <div class="panel-body">  
            <form action="../controlador/procesarRegistroUsuario.jsp" method="post" name="form">

                <style>
                    #estudiante{
                        display: none;
                    }
                    #medico{
                        display: none;
                    }
                </style>
                <div class="form-group">  
                    <div class="col-sm-4">
                        <label class="control-label">Tipo Identificación: </label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select id="tipoid" name="tipoid">
                                <option value="T.I"> Tarjeta de Identidad </option>
                                <option value="C.C"> C. de Ciudadania </option>
                                <option value="C.E"> C. de Extranjeria </option>
                                <option value="P.P"> Pasaporte </option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Número de documento</label>
                        <input type="number" class="form-control" id="identificacion" name="identificacion" required alt="Numero de documento">
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Código</label>
                        <input type="number" class="form-control" id="codigo" name="codigo" required alt="Codigo">
                    </div>                            
                </div>

                <div class="form-group">                              
                    <div class="col-sm-6">
                        <label class="control-label">Nombres y Apellidos:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required alt="Nombres y Apellidos">
                    </div>
                    <div class="col-sm-6">
                        <label class="control-label">Correo Electrónico:</label>
                        <input type="email" class="form-control" id="correo" name="correo" required alt="Correo electronico">
                    </div>

                </div>

                <div class="form-group">  
                    <div class="col-sm-4">
                        <label class="control-label">Fecha de Nacimiento: </label>
                        <input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" required alt="Fecha de Nacimiento">
                    </div>                    
                    <div class="col-sm-4">
                        <label class="control-label">Género: </label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select id="genero" name="genero">
                                <option value="F"> Femenino </option>
                                <option value="M"> Masculino </option>
                                <option value="O"> Otro </option>                                
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Estado civil: </label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select name="estadocivil" id="estadocivil">
                                <option value="Soltero(a)"> Soltero(a) </option>
                                <option value="Casado(a)"> Casado(a) </option>
                                <option value="Union Libre"> Union Libre </option>                                
                                <option value="Viudo(a)"> Viudo(a) </option>                                
                            </select>
                        </div>
                    </div>                                                        
                </div>

                <div class="form-group">   

                    <div class="col-sm-4">
                        <label class="control-label">Dirección: </label>
                        <input type="text" class="form-control" id="direccion" name="direccion" required alt="Direccion">
                    </div>
                    <div class="col-sm-4">
                        <label class="control-label">Teléfono: </label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required alt="Telefono">
                    </div>  
                    <div class="col-sm-4">
                        <label class="control-label">Tipo de Usuario</label>
                        <div class="form-control"style="border-box: box-sizing;">
                            <select name="tipousuario" id="tipousuario" onchange="mostrarDatos()" alt="tipo de Usuario">
                                <option> </option>
                                <option value="estudiante"> Estudiante </option>
                                <option value="docente"> Docente </option>     
                                <option value="administrativo"> Administrativo </option>       
                                <option value="servicios_generales"> Servicios Generales </option>                                  
                                <option value="medico"> Medico </option>                                            
                                <option value="administrador"> Administrador </option>
                                <option value="vicerrector"> Vicerrector </option>

                            </select>
                        </div>
                    </div>



                    <script>
                        function mostrarDatos() {

                            var tipo = document.form.tipousuario;

                            var selec = tipo.options[tipo.selectedIndex].value;

                            if (selec == "estudiante") {
                                document.getElementById("estudiante").style.display = 'inline';
                                document.getElementById("medico").style.display = 'none'
                            } else if (selec == "medico") {
                                document.getElementById("medico").style.display = 'inline';
                                document.getElementById("estudiante").style.display = 'none'
                            } else {
                                document.getElementById("estudiante").style.display = 'none'
                                document.getElementById("medico").style.display = 'none'

                            }

                        }

                    </script>

                    <div class="form-group" id="estudiante">

                        <div class="col-sm-6">
                            <label class="control-label">Estado del estuidante: </label>
                            <div class="">
                                <select name="estado_estudiante" id="estado_estudiante" onchange="mostrarDatos()" required alt="Estado:">
                                    <option> </option>
                                    <option value="activo"> Activo </option>
                                    <option value="egresado"> Egresado </option>                                                                                          
                                    <option value="graduado"> Graduado </option>                                                                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <label class="control-label">Programa </label>
                            <div class="">
                                <select id="programa" name="programa">                                        
                                    <option></option>
                                    <%
                                        FacadePrograma_academico fpa = new FacadePrograma_academico();
                                        List<Programa_academicoDTO> lispro = fpa.consultarPrograma_academico();

                                        for (Programa_academicoDTO x : lispro) {
                                    %>
                                    <option value="<%=x.getId()%>"> <%=x.getNombre_programa()%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>        
                        </div>
                    </div>                                       
                    <div class="form-group" id="medico">
                        <div class="col-sm-12">
                            <label class="control-label">Servicio: </label>
                            <div class="form-control"style="border-box: box-sizing;">
                                <select id="servicio" name="servicio">
                                    <%
                                        FacadeServicio fs = new FacadeServicio();
                                        List<ServicioDTO> li = fs.consultarServicio();
                                        for (ServicioDTO x : li) {
                                    %>
                                    <option value="<%=x.getId()%>"> <%=x.getNombre()%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>                        
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6">
                            <label class="control-label">Contraseña: </label>
                            <input type="password" class="form-control" id="contrasena" name="contrasena" required onkeyup="validatePassword();" alt="Contraseña">
                        </div>                                                                      

                        <div class="col-sm-6">
                            <label class="control-label">Repetir Contraseña: </label>
                            <input type="password" class="form-control" id="contrasena2" name="contrasena1" required onkeyup="validatePassword();" alt="Repetir Contraseña">
                        </div>

                    </div>
                </div>

                <br> <br>
                <div class="clearfix">
                    <div class="col-sm-12">
                        <label class="control-label"> </label>
                        <input class="btn btn-success btn-block" type="button" value="REGISTRAR" onclick="validate()">

                    </div>
                    <br><br>


                </div>
            </form>
        </div>                
    </div>
    <script>
        function validate() {

            var tipoIdElm = document.getElementById("tipoid");
            var identificacionElm = document.getElementById("identificacion");
            var tipoUsuarioElm = document.getElementById("tipousuario");
            var codigoElm = document.getElementById("codigo");
            var programaElm = document.getElementById("programa"); // depende del tipo usuario
            var nombreElm = document.getElementById("nombre");
            var correoElm = document.getElementById("correo");
            var fechaNacimientoElm = document.getElementById("fechanacimiento");
            var generoElm = document.getElementById("genero");
            var estadoCivilElm = document.getElementById("estadocivil");
            var direccionElm = document.getElementById("direccion");
            var telefonoElm = document.getElementById("telefono");
            var password1 = document.getElementById("contrasena");
            var password2 = document.getElementById("contrasena2");

            if (!validateFieldNull(tipoIdElm)) {
                return;
            }
            if (!validateFieldNull(identificacionElm)) {
                return;
            }
            
            if (!validateFieldNull(codigoElm)) {
                return;
            }
            if (tipoUsuarioElm.options[tipoUsuarioElm.selectedIndex].value === "estudiante") {
                if (!validateFieldNull(programaElm)) {
                    return;
                }
            }
            if (!validateFieldNull(nombreElm)) {
                return;
            }
            if (!validateFieldNull(correoElm)) {
                return;
            }
            if (!validateFieldNull(fechaNacimientoElm)) {
                return;
            }
            if (!validateFieldNull(generoElm)) {
                return;
            }
            if (!validateFieldNull(estadoCivilElm)) {
                return;
            }
            if (!validateFieldNull(direccionElm)) {
                return;
            }
            if (!validateFieldNull(telefonoElm)) {
                return;
            }
            if (!validateFieldNull(tipoUsuarioElm)) {
                return;
            }
            if (!validateFieldNull(password1)) {
                return;
            }
            if (!validateFieldNull(password2)) {
                return;
            }

            var expr = /^([a-zA-Z0-9_\.\-])+\@((ufps.edu)+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (!expr.test(correoElm.value)) {
                alert('Correo incorrecto, debe ser un correo institucional');
                correoElm.focus();
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

            var password1 = document.getElementById("contrasena");
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
        function validatePass(campo) {
            var RegExPattern = /(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$/;
            var errorMessage = 'Password Incorrecta.';
            if ((campo.value.match(RegExPattern)) && (campo.value != '')) {
                alert('Password Correcta');
            } else {
                alert(errorMessage);
                campo.focus();
            }
        }
    </script>

</div>
