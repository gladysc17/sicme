<%-- 
    Document   : recargoAdmin_CrearCitaMedica2
    Created on : 22-mar-2017, 19:00:00
    Author     : Gladys M
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="java.sql.Time"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="NEGOCIO.NegocioMedico"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    int id = Integer.parseInt(request.getParameter("identf"));
    String ide = String.valueOf(id);
    System.out.println("identif " + id);

    FacadeUsuario fac = new FacadeUsuario();

    UsuarioDTO usuario = fac.consultarUsuarioPorId(ide);

    if (usuario == null) {

%>

<h2>Usuario No encontrado. Registrar <input type="button" class="btn btn-sm" value="Nuevo" onclick="cargarForm('administrador/recargoAdmin_RegistrarUsuario.jsp')"/> </h2>

<%        } else {

    String iden = usuario.getIdentificacion();
    String codigo = usuario.getCodigo();
    String nombre = usuario.getNombre();
    String tipou = usuario.getTipo_usuario();

%>


<h2>Datos Para la cita Medica</h2> <br>
<div class="col-md-12">
    <div class="control-label"> <label>Identificacion: </label> <%=iden%> - <label>Nombre:</label> <%=nombre%> - <label>Codigo:   </label> <%=codigo%></div> <br>
    <div class="control-label"> 
        <div class="control-label"> </div>
        <input type="hidden" value="<%=nombre%>" id="nombre" name="nombre"> </div>
    <input type="hidden" value="<%=tipou%>" id="tipou" name="tipou"> </div>                                                           
</div>
<div class="panel-body">            
    <p>1. Seleccione el servicio que desea obtener, para consultar el(los) profesional(es) disponible(s)</p>
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-1 control-label">Servicio</label>
        <div class="col-sm-4">
            <select class="form-control" name="servicio" id="servicio" required>                        
                <option value="medicinageneral"> Medicina General </option>
                <option value="odontologia"> Odontología </option>
                <option value="psicologia"> Psicología</option>
                <option value="planificacion"> Planificacion Familiar</option>                  
            </select>
        </div>                                                        

        <div class="col-sm-2">                                                                              
            <input type="button" class="btn btn-primary" value="CONSULTAR" onclick="cargar('administrador/recargoAdmin_CrearCitaMedica3.jsp?servicio=' + servicio.value + '&nombre=' + nombre.value + '&tipou=' + tipou.value)"/>
        </div>


    </div>
</div>  
<div class="panel-body"> 
    <p> 2. Seleccione el profesional y acontinuación se mostrará las horas disponibles </p>


    <label for="inputEmail3" class="col-sm-1 control-label">Nombre</label>
    <div class="col-sm-4 control-label">
        <select class="form-control" name="prof" required id="recargar">

            <option></option>

        </select>
    </div> 

    <label for="inputEmail3" class="col-sm-1 control-label">Fecha</label>
    <div class="col-sm-3 control-label">
        <input type="date" name="fecha" id="fecha" class="form-control" required> 
    </div>       

    <div class="col-sm-3">
        <input type="button" class="btn btn-primary form-control" value="HORAS DISP." onclick="cargar_fr('administrador/recargoAdmin_CrearCitaMedica4.jsp?idmed=' + prof.value + '&fecha=' + fecha.value + '&servicio=' + servicio.value)"/>
    </div>

</div>



<%

    }

%>

<div class="panel-body" id="cargar_fr" >

</div>
