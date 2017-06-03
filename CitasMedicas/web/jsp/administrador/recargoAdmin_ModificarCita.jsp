<%-- 
    Document   : recargoAdmin_modificarCita
    Created on : 02-abr-2017, 17:30:25
    Author     : Gladys M
--%>

<%@page import="org.omg.Messaging.SYNC_WITH_TRANSPORT"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="FACADE.FacadeCita"%>
<%@page import="DTO.CitaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../js/funciones.js" type="text/javascript"></script>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <form action="../controlador/procesarModificarCita.jsp?" method="post" name="form" novalidate>

            <div class="col-md-10 form-group">            
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2 align="center">  Modificar Cita Medica Usuario </h2>                    
                    </div>

                    <div class="panel-body">

                        <%
                            int idcita = Integer.parseInt(request.getParameter("id"));
                            System.out.println("idcita1" + idcita);

                            CitaDTO cita = new CitaDTO();
                            FacadeCita facCita = new FacadeCita();

                            cita = facCita.consultarCitasId(idcita);


                        %>
                        <div class="form-group col-md-4"> 
                            <input type="hidden" name="idcita" id="idcita" value="<%=idcita%>"> 
                            <label class="control-label">Identificación: </label>
                            <input class="form-control " name="identf" id="identf" value="<%=cita.getId_usuario()%>" readonly> 
                        </div>                   

                        <div class="form-group col-md-4">
                            <label class="control-label">Nombre:</label>                                                                                  
                            <input class="form-control" name="nombre" id="nombre" value="<%=cita.getNombre_usuario()%>" readonly>                            
                        </div> 

                        <div class="form-group col-md-4">
                            <label class="control-label">Servicio: </label>
                            <input class="form-control" name="servicio" id="servicio" value="<%=cita.getServicio_cita()%>" readonly>
                        </div>       


                        <div class="form-group col-md-4">
                            <label class="control-label">Fecha: </label>
                            <input class="form-control" type="date" id="fecha" name="fecha" required>                                           
                        </div> 
                        <div class="form-group col-md-4">
                            <label class="control-label">Medico: </label>
                            <select class="form-control" name="prof" id="prof" required>
                                <option> --seleccione --</option>
                                <%
                                    String servicio = cita.getServicio_cita();

                                    String x = "";

                                    if (servicio.equals("odontologia") || servicio.equals("medicinageneral")) {
                                        x = "mostrar";
                                    } else {
                                        x = "ocultar";
                                    }

                                    FacadeMedico facMed = new FacadeMedico();

                                    ArrayList<MedicoDTO> listaMedicos = facMed.consultarMedicosPorServicio(servicio);

                                    for (int i = 0; i < listaMedicos.size(); i++) {

                                        String idmed = listaMedicos.get(i).getIdentificacion();
                                        FacadeUsuario facUs = new FacadeUsuario();
                                        UsuarioDTO u = facUs.consultarUsuarioPorId(idmed);
                                        String nombre = u.getNombre();


                                %>    
                                <option value="<%=idmed%>"><%=nombre%> </option>                                  
                                <%
                                    }

                                %>
                            </select>
                        </div> 

                        <div class="form-group col-md-4">
                            <label class="control-label"> </label> <br>
                            <input type="button" class="btn btn-primary" value="HORAS DISP." onclick="cargar_form('administrador/recargoAdmin_ModificarCita2.jsp?prof=' + prof.value + '&fecha=' + fecha.value + '&idcita=<%=idcita%>' + '&servicio=<%=servicio%>')"/>
                        </div>

                        <div class="panel-body">
                            <div class="form-group col-md-4"><br>
                                <label  class="control-label"> Horas disponibles: </label>
                                <select class="form-control" name="horaMedico" id="cargar" required="" >
                                    <option>  </option>
                                </select>

                            </div>


                            <style>

                                #mostrar{
                                    display: inline;
                                }
                                #ocultar{
                                    display: none;
                                }
                            </style> 

                            <div class="form-group col-md-4" id="<%=x%>">
                                <label  class="control-label"> Recibo </label>
                                <input class="form-control" type="text" id="recibo" name="recibo" required>  
                            </div>
                            <div class="form-group col-md-4">           
                                <label class="control-label"> </label> <br>
                                <input type="button" value="MODIFICAR CITA" class="btn btn-success" id="enviar" onclick="validaFormulario()"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>    
                                <script type="text/javascript">       
                function validaFormulario() {
       
                    if (document.form.fecha.value.length == 0) {
                        alert("Seleccione una fecha");
                        document.form.fecha.focus();
                        return 0;
                    }
       
                    if (document.form.prof.selectedIndex == 0) {
                        alert("Seleccione un Profesional");
                        document.form.prfo.focus();
                        return 0;
                    }
                                        
                    
                    if (document.form.horaMedico.value.length == 0) {
                        alert("Tiene que seleccionar una hora");
                        document.form.horaMedico.focus();
                        return 0;
                    }
       
                    document.form.submit();
                }
            </script>   
        </form> 
        <div class="col-md-1"></div> 
    </body>
</html>
