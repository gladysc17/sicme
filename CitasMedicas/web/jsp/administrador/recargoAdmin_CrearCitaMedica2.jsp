<%-- 
    Document   : recargoAdmin_CrearCitaMedica2
    Created on : 22-mar-2017, 19:00:00
    Author     : Gladys M
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int id = Integer.parseInt(request.getParameter("identf"));
    String ide = String.valueOf(id);
    System.out.println("identif " + id);

    FacadeUsuario fac = new FacadeUsuario();

    UsuarioDTO u = fac.consultarUsuarioPorId(ide);

    if (u == null) {

%>

<h2>Usuario No encontrado <input type="button" class="btn btn-sm" value="REGISTRAR" onclick="cargarForm('administrador/recargoAdmin_RegistrarUsuario.jsp')"/> </h2>

<%        } else {

    String iden = u.getIdentificacion();
    String codigo = u.getCodigo();
    String nombre = u.getNombre();

%>

<div class="panel-body">
<h2>Datos Para la cita Medica</h2> <br> 
<label>Identificacion: <%=iden%></label> 
<label> Nombre: <%=nombre%> </label>  
<label>Codigo:  <%=codigo%> </label> 
</div>

<%
    }

%>