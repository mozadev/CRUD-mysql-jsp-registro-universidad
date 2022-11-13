
<%@page import="BEAN.EstudianteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    EstudianteBean objEstudianteBean=null;
%>
<%
    objEstudianteBean =(EstudianteBean)request.getAttribute("datos");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Modificar Estudiante</title>
     
        <script>
         
        function salir(){
            document.form.action="<%=request.getContextPath()%>/EstudianteServlet";
            document.form.method="GET";
            document.form.op.value="9";
            document.form.submit();
        }
        function modificar(){
            document.form.action="<%=request.getContextPath()%>/EstudianteServlet";
            document.form.method="GET";
            document.form.op.value="7";
            document.form.submit();
        }
        </script>
    </head>
    <body>
        <form name="form">
            <div class="form-group">
            <input type="hidden" name="op">
            <input type="hidden" name="CODIGO" VALUE="<%=objEstudianteBean.getID()%>">
            
            <center>
                <table>
                    <tr>
                        <td colspan="2">Modificar Tabla Estudiante</td>
                    </tr>
                    <tr>
                        <td>Codigo: </td>
                        <td><input type="text" class="form-control" disabled="false" name="txtcodigo" value="<%=objEstudianteBean.getID()%>"></td>
                    </tr>
                    <tr>
                        <td>Apellido: </td>
                        <td><input type="text" class="form-control" name="txtapellido" value="<%=objEstudianteBean.getAPELLIDO()%>"></td>
                    </tr>
                     <tr>
                        <td>Nombre: </td>
                        <td><input type="text" class="form-control" name="txtnombre" value="<%=objEstudianteBean.getNOMBRE()%>"></td>
                    </tr>
                     <tr>
                        <td>Genero: </td>
                        <td><input type="text" class="form-control" name="txtgenero" value="<%=objEstudianteBean.getGENERO()%>"></td>
                    </tr>
                     <tr>
                        <td>Ocupacion: </td>
                        <td><input type="text" class="form-control" name="txtocupacion" value="<%=objEstudianteBean.getOCUPACION()%>"></td>
                    </tr>
                     <tr>
                        <td>Curriculo: </td>
                        <td><input type="text" class="form-control" name="txtcurriculo" value="<%=objEstudianteBean.getCURRICULO()%>"></td>
                    </tr>
                     <tr>
                        <td>Edad: </td>
                        <td><input type="text" class="form-control" name="txtedad" value="<%=objEstudianteBean.getEDAD()%>"></td>
                    </tr>               
                </table>
                    <table border="1">
                        <tr>
                            <td><button class="btn btn-success" onclick="modificar()">Modificar</button></td>
                            <td><button class="btn btn-danger" onclick="salir()">Regresar</button></td>
                        </tr>
                    </table>
                    <font style="color: red">
                    <% 
                        if(request.getAttribute("mensaje")!=null){
                        String msj=(String)request.getAttribute("mensaje");
                        out.print(msj);
                    }
                    %>
                    </font>
            </center>
            </div>
        </form>
                     
    </body>
</html>
