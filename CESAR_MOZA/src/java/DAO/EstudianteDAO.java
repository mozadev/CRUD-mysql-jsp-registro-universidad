package DAO;

import BEAN.EstudianteBean;
import UTIL.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EstudianteDAO {

    Connection cn = null;
    PreparedStatement pt = null;
    ResultSet rs = null;
    ArrayList<EstudianteBean> lista = null;
    EstudianteBean objEstudianteBean = null;

    public ArrayList<EstudianteBean> ListarEstudiante() {
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("select * from estudiante;");
            rs = pt.executeQuery();
            lista = new ArrayList<EstudianteBean>();
            while (rs.next()) {
                objEstudianteBean = new EstudianteBean();
                objEstudianteBean.setID(rs.getInt(1));
                objEstudianteBean.setAPELLIDO(rs.getString(2));
                objEstudianteBean.setNOMBRE(rs.getString(3));
                objEstudianteBean.setGENERO(rs.getString(4));
                objEstudianteBean.setOCUPACION(rs.getString(5));
                objEstudianteBean.setCURRICULO(rs.getString(6));
                objEstudianteBean.setEDAD(rs.getInt(7));
                lista.add(objEstudianteBean);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }

    public int InsertarEstudiante(EstudianteBean objEstudianteBean) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("insert into estudiante(ID,APELLIDO,NOMBRE,"
                    + "GENERO,OCUPACION,CURRICULO,EDAD) VALUES(?,?,?,?,?,?,?);");
            pt.setInt(1, objEstudianteBean.getID());
            pt.setString(2, objEstudianteBean.getAPELLIDO());
            pt.setString(3, objEstudianteBean.getNOMBRE());
            pt.setString(4, objEstudianteBean.getGENERO());
            pt.setString(5, objEstudianteBean.getOCUPACION());
            pt.setString(6, objEstudianteBean.getCURRICULO());
            pt.setInt(7, objEstudianteBean.getEDAD());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }

    public int ModificarEstudiante(EstudianteBean objEstudianteBean) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("UPDATE estudiante set APELLIDO=?,NOMBRE=?,"
                    + "GENERO=?,OCUPACION=?,CURRICULO=?,EDAD=? WHERE ID=?;");
            pt.setString(1, objEstudianteBean.getAPELLIDO());
            pt.setString(2, objEstudianteBean.getNOMBRE());
            pt.setString(3, objEstudianteBean.getGENERO());
            pt.setString(4, objEstudianteBean.getOCUPACION());
            pt.setString(5, objEstudianteBean.getCURRICULO());
            pt.setInt(6, objEstudianteBean.getEDAD());
            pt.setInt(7, objEstudianteBean.getID());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }

    public int EliminarEstudiante(EstudianteBean objEstudianteBean) {
        int estado = 0;
        try {
            cn = ConexionBD.getConexionBD();
            pt = cn.prepareStatement("DELETE FROM estudiante WHERE ID=?;");
            pt.setInt(1, objEstudianteBean.getID());
            estado = pt.executeUpdate();
            pt.close();
            cn.close();
        } catch (Exception e) {
        }
        return estado;
    }
}
