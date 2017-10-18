<%-- 
    Document   : recargoAdmin_ConsultarCitasMedico
    Created on : 18/10/2017, 03:31:17 PM
    Author     : usuario
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default">
        <div class="panel-heading">                                        
            <h3 align="center"> Consultar Citas Medicas</h3>
        </div>
        <div class="panel-body">
            <%
                String id = request.getParameter("ident");
                System.out.println("id ad " + id);
                FacadeUsuario fm = new FacadeUsuario();

                UsuarioDTO usu = fm.consultarUsuarioPorId(id);
            %>
            <label> Medico:  <%=usu.getNombre()%></label>                            
            <input type="hidden" id="idMedico" value="<%=id%>" name="idMedico" />
            <div class="panel-body">

            <div class="form-group">
                <label for="" class="control-label"> Fecha </label>
                <input type="date" id="fecha" name="fecha" required > &nbsp;&nbsp;&nbsp;
                <label>&nbsp;&nbsp; hasta &nbsp;&nbsp;</label>
                <input type="date" id="fecha2" name="fecha2"/> &nbsp;&nbsp;&nbsp;
                <input type="button" class="btn btn-danger" value="CONSULTAR" onclick="cargar_form('administrador/recargoAdmin_ConsultarCitasMedico2.jsp?idMedico=<%=id%>' +'&fecha=' + fecha.value + '&fecha2=' + fecha2.value)"/>
            </div>                                                    

            <div class="panel-body" id="cargar">

            </div>
        </div>
        </div>
    </div>
</div>
