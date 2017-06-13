<%-- 
    Document   : form
    Created on : 12-jun-2017, 22:44:19
    Author     : Gladys M
--%>

<%@page import="DTO.EventoDTO"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default" >
        <div class="panel-heading">                                        
            <h4 align="center"> INSCRIPCION A EVENTO</h4>
        </div>
        <%
            String id = request.getParameter("dsas");
            FacadeEvento fe = new FacadeEvento();
            EventoDTO ls = fe.consultarPorId(id);
        %>
        <div class="panel-body">
            <div class="col-lg-4">                                   
                <h3><%=ls.getNombreEvento()%></h3>
                <p>
                    <b>Descripción: </b><%=ls.getDescrEvento()%><br>                                                                                        
                    <b>Lugar:</b> <%=ls.getLugarEvento()%><br>                                                            
                    <b>Feha y hora:</b><%=ls.getFechaEvento()%> - <%=ls.getHoraEvento()%><br>                                                          
                    <b>Dirigido por:</b><%=ls.getDirector()%> <br>                                
                </p>
            </div>  
            <div class="col-lg-8">
                <form action="controlador/procesarRegistroEvento.jsp">
                    <div class="col-md-12">
                        <label class="control-label">Nombre:</label>
                        <input  type="text" name="nombre" class="form-control" required/>
                    </div>
                    <div class="col-md-12">
                        <label class="control-label">Codigo:</label>
                        <input type="number" name="codigo" class="form-control" />
                    </div>
                    <div class="col-md-12">
                        <label class="control-label">Identificacion:</label>
                        <input type="number" name="identificacion" class="form-control" required />
                    </div>
                    <div class="col-md-12">
                        <label class="control-label">Correo: </label>
                        <input type="email" name="correo" class="form-control" required />
                    </div>
                    <div class="col-md-12">
                        <label class="col-md-12">Programa académico</label>
                        <input type="text" name="programa" class="form-control"  /> <br>
                    </div>
                    <br> <br>
                    <div class="clearfix">
                        <div class="col-md-12">
                        <input type="hidden" name="idEvento" value="<%=ls.getIdEvento()%>" />
                        <input type="submit" class="btn btn-success" value="Registrarme" />
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>