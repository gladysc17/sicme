<%-- 
    Document   : procesarAsignarHorario
    Created on : 24/03/2017, 12:50:28 AM
    Author     : LEGADO
--%>

<%@page import="DTO.HorarioMedicoDTO"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            int idMedico = Integer.parseInt(request.getParameter("idMedico"));
            String fecha = request.getParameter("fecha");
            String [] hora = request.getParameterValues("hora");
            String estado = "disponible";
            FacadeHorarioMedico fhm = new FacadeHorarioMedico();
            int cont1=hora.length; 
            int cont2 = 0;
            for(int i=0; i<hora.length; i++){
                int idHorario = Integer.parseInt(hora[i]);
                
                HorarioMedicoDTO hm = new HorarioMedicoDTO(fecha, idHorario, idMedico, estado);
                boolean rta = fhm.registrarHorarioMedico(hm);
                
                if(rta)
                    cont2++;
                
            }
            
            if(cont1==cont2){
                response.sendRedirect("../jsp/PrincipalAdministrador.jsp");
            }
        %>
    </body>
</html>
