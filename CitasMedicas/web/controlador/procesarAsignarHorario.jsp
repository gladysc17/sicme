<%-- 
    Document   : procesarAsignarHorario
    Created on : 24/03/2017, 12:50:28 AM
    Author     : LEGADO
--%>

<%@page import="java.util.List"%>
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
            String idMedico = request.getParameter("idMedico");
            String fecha = request.getParameter("fecha");
            String[] hora = request.getParameterValues("hora");
            String estado = "disponible";
            FacadeHorarioMedico fhm = new FacadeHorarioMedico();
            List<HorarioMedicoDTO> lis = fhm.listarHorasMedico(idMedico);
            boolean band = true;
            int cont1 = hora.length;
            int cont2 = 0;
            for (HorarioMedicoDTO x : lis) {
                if (hora.length <= lis.size() ) {
                    if (!(x.getFecha().equalsIgnoreCase(fecha))) {
                        break;
                    }
                    int con1 = hora.length;
                    int con2 = 0;
                    for (int i = 0; i < hora.length; i++) {
                        int h = Integer.parseInt(hora[i]);
                        if (x.getId_horario_horariomedico() != h) {
                            boolean r = fhm.eliminarHora(x.getId_horariomedico());

                            if (r) {
                                con2++;
                            }

                            if (con1 == con2) {
                                band = false;
                            }
                        }
                    }
                }
            }

            if (band) {

                for (int i = 0; i < hora.length; i++) {
                    int idHorario = Integer.parseInt(hora[i]);

                    HorarioMedicoDTO hm = new HorarioMedicoDTO(fecha, idHorario, idMedico, estado);
                    boolean rta = fhm.registrarHorarioMedico(hm);

                    if (rta) {
                        cont2++;
                    }

                }
            }

            if (cont1 == cont2) {
        %>
        <script type="text/javascript">
            alert("Registro exitoso");
            location.href = '../jsp/PrincipalAdministrador.jsp';
        </script>

        <%
            }
        %>
    </body>
</html>
