<%-- 
    Document   : asignar_horario
    Created on : 21/03/2017, 09:51:50 PM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default">
        <div class="panel-heading">                                        
            <h3 align="center"> ASIGNACIÓN DE HORARIO</h3>
        </div>
        <div class="panel-body">
            <form action="../controlador/procesarAsignarHorario.jsp" method="post" name="formAsignarHorarioMedico">
                <div>
                    <%
                        String id = request.getParameter("ident");
                        System.out.println("id ad " + id);
                        FacadeUsuario fm = new FacadeUsuario();

                        UsuarioDTO usu = fm.consultarUsuarioPorId(id);
                    %>
                    <label> Medico:  <%=usu.getNombre()%></label>                            
                    <input type="hidden" id="idMedico" value="<%=id%>" name="idMedico" />
                    <div>                        
                        <%
                        FacadeHorarioMedico fc = new FacadeHorarioMedico();
                        String fec = fc.fechaActual();
                    %>
                    Fecha: <input type="date" class="inline-group" id="fechaHM" name="fecha" size="12" alt="Fecha" required step="1" min="<%=fec%>">
                    </div>
                    

                    <div>
                        <div>
                            <label> Hora(s): </label>
                        </div>
                        <%
                            FacadeHorario fh2 = new FacadeHorario();
                            List<HorarioDTO> ho2 = fh2.consultarHoras();
                            int col = 5;
                            int tamLista = ho2.size();
                            double aux1 = ho2.size();
                            double aux2 = 5;
                            int pivote = 0;
                            double cantPorCol =  Math.ceil(aux1/aux2);  
                            int topeActual = 0;
                            
                            for(int i=0; i<col; i++){
                                System.out.println("hola div");
                        %>
                                <div style="float: left" >
                                    <%
                                     
                                    if ((tamLista - topeActual) >= (int)cantPorCol) {
                                        for (;pivote < (topeActual + (int) cantPorCol); pivote ++) {
                                            HorarioDTO h = ho2.get(pivote);
                                        %>
                                        <input type="checkbox" name="hora" value="<%=h.getId_horario()%>"/> <%=h.getHora_inicio() + " - " + h.getHora_final()%> &nbsp;&nbsp; <br> 
                                        <% 
                                        }
                                    } else {
                                        for (;pivote < tamLista; pivote ++) {
                                            HorarioDTO h = ho2.get(pivote);
                                        %>
                                        <input type="checkbox" name="hora" value="<%=h.getId_horario()%>"/> <%=h.getHora_inicio() + " - " + h.getHora_final()%> &nbsp;&nbsp; <br> 
                                        <% 
                                        }
                                    }
                                    topeActual = (int) cantPorCol * (1+i);
                                    %>                                    
                                </div>
                        <%
                            }
                        %>                
                        
                        <div class="col-sm-12">
                            <br>
                            <input type="button" class="btn btn-success" value="Registrar Horario" onclick="validateForm();"/>
                        </div>


                    </div>
                        
                </div>
            </form>
            <script>
                function validateForm() {

                    var fechaHM = document.getElementById("fechaHM");

                    if (fechaHM.value == "") {
                        alert("Debe seleccionar la fecha para la asignación del horario");
                        return;
                    }

                    if (validarCheckHorario() === false) {
                        return;
                    }
                }

                function validarCheckHorario() {
                    var checksHora = document.getElementsByName("hora");
                    var cont = 0;

                    for (var i = 0; i < checksHora.length; i++) {
                        if (checksHora[i].checked) {
                            cont = cont + 1;
                        }
                    }

                    if (cont === 0) {
                        alert("No se han seleccionado horas para asignar");
                        return false;
                    } else {
                        document.formAsignarHorarioMedico.submit();
                    }
                }
            </script>
        </div>
    </div>
</div>
                        <div>
                            
                        </div>

