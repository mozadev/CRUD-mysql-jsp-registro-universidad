package SERVLET;

import BEAN.EstudianteBean;
import DAO.EstudianteDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EstudianteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String opcad = request.getParameter("op");
        int op = Integer.parseInt(opcad);
        switch (op) {
        case 4: { //grabar frmEstudianteMant.jsp
                String mensaje = "";
                String codcad = request.getParameter("txtcodigo");
                int codigo = Integer.parseInt(codcad);
                String apellido = request.getParameter("txtapellido");
                String nombre = request.getParameter("txtnombre");
                String genero = request.getParameter("txtgenero");
                String ocupacion = request.getParameter("txtocupacion");
                String curriculo = request.getParameter("txtcurriculo");
                int edad = Integer.parseInt(request.getParameter("txtedad"));
                //creamos el objeto con los datos de los campos del formulario
                EstudianteBean objEstudianteBean = new EstudianteBean();
                objEstudianteBean.setID(codigo);
                objEstudianteBean.setAPELLIDO(apellido);
                objEstudianteBean.setNOMBRE(nombre);
                objEstudianteBean.setGENERO(genero);
                objEstudianteBean.setOCUPACION(ocupacion);
                objEstudianteBean.setCURRICULO(curriculo);
                objEstudianteBean.setEDAD(edad);
                //creamos un objeto dao y en su metodo insertar le insert el objet estudiante
                EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                int estado = objEstudianteDAO.InsertarEstudiante(objEstudianteBean);
                if (estado == 1) {
                    mensaje = "Registro Insertado !!";
                } else {
                    mensaje = "Registro no insertado";
                }
                request.setAttribute("mensaje", mensaje);// este mensaje se ira al formulario

                ArrayList listarestudiante = objEstudianteDAO.ListarEstudiante();//listamos otra vez para q se muestre lo agregado tmb.
                request.setAttribute("listaestudiante", listarestudiante);
                getServletContext().getRequestDispatcher("/FrmEstudianteMant.jsp").forward(request, response);// lo enviamso al formulario mensaje y lista de estu
                break;
            }
            case 5: {//salir al mismo FrmEstudianteMant.jsp al campo codigo del mismo FrmEstudianteMant
                EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                ArrayList listaestudiante = objEstudianteDAO.ListarEstudiante();
                request.setAttribute("listaestudiante", listaestudiante);
                getServletContext().getRequestDispatcher("/FrmEstudianteMant.jsp").forward(request, response);
                break;
            }
            case 6: {//MODIFICAR recibimos los valores del formulario FrmEstudianteMant.jsp para enviarlo al FrmModificarEstudianteMant.jsp
                String codcad = request.getParameter("COD");
                int codigo = Integer.parseInt(codcad);
                String apellido = request.getParameter("APE");
                String nombre = request.getParameter("NOM");
                String genero = request.getParameter("GEN");
                String ocupacion = request.getParameter("OCU");
                String curriculo = request.getParameter("CUR");
                int edad = Integer.parseInt(request.getParameter("EDA"));
                //creamos un objeto dao
                EstudianteBean objEstudianteBean = new EstudianteBean();
                objEstudianteBean.setID(codigo);
                objEstudianteBean.setAPELLIDO(apellido);
                objEstudianteBean.setNOMBRE(nombre);
                objEstudianteBean.setGENERO(genero);
                objEstudianteBean.setOCUPACION(ocupacion);
                objEstudianteBean.setCURRICULO(curriculo);
                objEstudianteBean.setEDAD(edad);
                //enviamos los datos del objeto a FrmModificarEstudiante.jsp
                request.setAttribute("datos", objEstudianteBean);
                getServletContext().getRequestDispatcher("/FrmModificarEstudianteMant.jsp").forward(request, response);
                break;
            }
            case 7: { // MODIFICAR ESTUDIANTE Llegada de los nuevos datos del FrmModificarEstudiante.jsp Para modificar en la base datos dao.modificar
                String mensaje = "";
                String codcad = request.getParameter("CODIGO");
                int codigo = Integer.parseInt(codcad);
                String apellido = request.getParameter   ("txtapellido");
                String nombre = request.getParameter("txtnombre");
                String genero = request.getParameter("txtgenero");
                String ocupacion = request.getParameter("txtocupacion");
                String curriculo = request.getParameter("txtcurriculo");
                int edad = Integer.parseInt(request.getParameter("txtedad"));
                //creamos el objeto estudiante con los datos
                EstudianteBean objEstudianteBean = new EstudianteBean();
                objEstudianteBean.setID(codigo);
                objEstudianteBean.setAPELLIDO(apellido);
                objEstudianteBean.setNOMBRE(nombre);
                objEstudianteBean.setGENERO(genero);
                objEstudianteBean.setOCUPACION(ocupacion);
                objEstudianteBean.setCURRICULO(curriculo);
                objEstudianteBean.setEDAD(edad);
                //creamos un objeto dao 
                EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                //modificamos con dao
                int estado = objEstudianteDAO.ModificarEstudiante(objEstudianteBean);
                if (estado == 1) {
                    mensaje = "Registro Modificado";
                } else {
                    mensaje = "Registro no Modificado";
                }
                //establecemos atributos mensaje y datos obje to send at same  FrmModificarEstudiante.jsp to release on same form
                request.setAttribute("mensaje", mensaje);
                request.setAttribute("datos", objEstudianteBean);
                getServletContext().getRequestDispatcher("/FrmModificarEstudianteMant.jsp").forward(request, response);
                break;
            }
            case 8: { // ELIMINAR ESTUDIANTE enviamos la lista actualizada
                String codcad = request.getParameter("COD");
                int codigo = Integer.parseInt(codcad);

                EstudianteBean objEstudianteBean = new EstudianteBean();
                objEstudianteBean.setID(codigo);

                EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                objEstudianteDAO.EliminarEstudiante(objEstudianteBean);

                ArrayList listaestudiante = objEstudianteDAO.ListarEstudiante();
                request.setAttribute("listaestudiante", listaestudiante);
                getServletContext().getRequestDispatcher("/FrmEstudianteMant.jsp").forward(request, response);
                break;
            }
            case 9: {// SALIR AL FRM PRINCIPLA Y enviamos la lista 
                EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                ArrayList listaestudiante = objEstudianteDAO.ListarEstudiante();
                request.setAttribute("listaestudiante", listaestudiante);
                getServletContext().getRequestDispatcher("/FrmEstudianteMant.jsp").forward(request, response);
                break;
            }
            
            case 10: {// SUMA EDAD MAYOR Y MENOR ENVIAMOS LA LISTA
          
                   EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                ArrayList listaestudiante = objEstudianteDAO.ListarEstudiante();
                request.setAttribute("listaestudiante", listaestudiante);
                getServletContext().getRequestDispatcher("/FrmSumaEdadMayorYmenor.jsp").forward(request, response);
                
                break;
                
            }
            
              case 11: { // MASCULINO MAYOR DE 30 AÑOS ENVIAMOS LA LISTA
                   EstudianteDAO objEstudianteDAO = new EstudianteDAO();
                ArrayList listaestudiante = objEstudianteDAO.ListarEstudiante();
                request.setAttribute("listaestudiante", listaestudiante);
                getServletContext().getRequestDispatcher("/FrmMasculinoMayor30.jsp").forward(request, response);
                break;
                  
                
            }
            
            
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
