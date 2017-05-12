<%-- 
    Document   : recargoAdmin_CrearCitaMedica2
    Created on : 22-mar-2017, 19:00:00
    Author     : Gladys M
--%>

<%@page import="DTO.OtroUsuarioDTO"%>
<%@page import="DTO.ServicioGeneralDTO"%>
<%@page import="DTO.ProfesionalDTO"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="NEGOCIO.NegocioOtroUsuario"%>
<%@page import="NEGOCIO.NegocioServicioGeneral"%>
<%@page import="NEGOCIO.NegocioProfesional"%>
<%@page import="NEGOCIO.NegocioMedico"%>
<%@page import="DTO.DocenteDTO"%>
<%@page import="FACADE.FacadeDocente"%>
<%@page import="FACADE.Facade"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int id = Integer.parseInt(request.getParameter("identf"));
            String tipo = request.getParameter("tipo");
            System.out.println("identif " + id + " tipo: " + tipo);

            Facade fac = new Facade();

            boolean rta = fac.verificarUsuario(tipo, id);
            int ide = 0;
            int codigo = 0;
            String nombre ="";
            
            if (!rta) {

        %>

        <h1>Usuario No encontrado</h1>

        <%        } else {

            if (tipo.equals("estudiante")) {
                FacadeEstudiante facEst = new FacadeEstudiante();
                EstudianteDTO est = facEst.consultarEstudianteporId(id);
                ide = est.getIdentificacion_est();
                nombre = est.getNombre_est();
                codigo = est.getCodigo_est();
       
            }

            if (tipo.equals("docente")) {
                FacadeDocente facDoc = new FacadeDocente();
                DocenteDTO doc = facDoc.consultarDocenteporId(id);
                ide = doc.getIdentificacion_doc();
                nombre = doc.getNombre_doc();
                codigo = doc.getCodigo_doc();
        
            }

            if (tipo.equals("medico")) {

                NegocioMedico negMed = new NegocioMedico();
                MedicoDTO med = negMed.consultarMedicoPorId(id);
                ide = med.getIdentificacion_med();
                nombre = med.getNombre_med();
                codigo = med.getCodigo_med();
        
            }
            if (tipo.equals("profesional")) {

                NegocioProfesional negPro = new NegocioProfesional();
                ProfesionalDTO pro = negPro.consultarProefionalPorId(id);
                ide = pro.getIdentificacion_prof();
                nombre = pro.getNombre_prof();
                codigo = pro.getCodigo_prof();
       
            }
            if (tipo.equals("serviciogeneral")) {

                NegocioServicioGeneral negSer = new NegocioServicioGeneral();
                ServicioGeneralDTO ser = negSer.consultarServicioGeneralId(id);
                ide = ser.getIdentificacion_sg();
                nombre = ser.getNombre_sg();
                codigo = ser.getCodigo_sg();
        
            }
            if (tipo.equals("otro")) {

                NegocioOtroUsuario negOtro = new NegocioOtroUsuario();
                OtroUsuarioDTO otro = negOtro.consultarOtroUsuarioId(id);
                ide = otro.getIdentificacion_otro();
                nombre = otro.getNombre_otro();
                codigo = otro.getCodigo_otro();
        
            }
        %>

        <h2>Datos Para la cita Medica</h2>
        <div class="col-md-12">
            <div class="control-label"> <label>Identificacion: </label> <%=ide%> </div>
            <div class="control-label"> <label>Nombre:   </label> <%=nombre%>
                <input type="hidden" value="<%=nombre%>" id="nombre" name="nombre"> </div>
            <div class="control-label"> <label>Codigo:   </label> <%=codigo%></div>                                               
        </div>
        <div class="panel-body">            
            <p>1. Seleccione el servicio que desea obtener, para consultar el(los) profesional(es) disponible(s)</p>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-1 control-label">Servicio</label>
                <div class="col-sm-4">
                    <select class="form-control" name="servicio" id="servicio" required="">                        
                        <option value="medicinageneral"> Medicina General </option>
                        <option value="odontologia"> Odontología </option>
                        <option value="psicologia"> Psicología</option>
                        <option value="planificacion"> Planificacion Familiar</option>                  
                    </select>
                </div>                                                        

                <div class="col-sm-2">                                                                              
                    <input type="button" class="btn btn-primary" value="CONSULTAR PROFESIONAL" onclick="cargar('administrador/recargoAdmin_CrearCitaMedica3.jsp?servicio=' + servicio.value +'&nombre='+nombre.value+'&tipo=<%=tipo%>')"/>
                </div>
            </div>                                                    

        </div>

        <%
            }

        %> 



        <div class="panel-body">
            <p> 2. Seleccione el profesional y acontinuación se mostrará las horas disponibles </p>


        <label for="inputEmail3" class="col-sm-1 control-label">Nombre</label>
        <div class="col-sm-4 control-label">
            <select class="form-control" name="prof" required="" id="recargar">
                                                                  
                <option> seleccione profesional </option>
               
            </select>
        </div> 

        <label for="inputEmail3" class="col-sm-1 control-label">Fecha</label>
        <div class="col-sm-3 control-label">
            <input type="date" name="fecha" id="fecha" class="form-control" required=""> 
        </div>       

        <div class="col-sm-3">
            <input type="button" class="btn btn-primary form-control" value="HORAS DISPONIBLES" onclick="cargar_fr('administrador/recargoAdmin_CrearCitaMedica4.jsp?prof=' + prof.value + '&fecha=' + fecha.value + '&servicio=' + servicio.value+'&tipo=<%=tipo%>')"/>
        </div>
        <div class="panel-body" id="cargar_fr">

        </div> 
        </div>        
    </body>
</html>
