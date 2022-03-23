/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static dao.DAO.con;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import models.Supplier;
import models.User;

/**
 *
 * @author HieuTT
 */
public class SupplierDAO implements Serializable{
    
    public Supplier checkSupplier(String NameOS) throws SQLException{
        Supplier listSup= new Supplier();
       String sql = "select * from tblvendor where name = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,NameOS);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
                    if(rs.wasNull()){
                        return new Supplier(0,"","");
                    }else{
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String des = rs.getString("desciption");
                        return new Supplier(id,name,des);
                    }
                        
		}
		return listSup;
    }
    
   
    
}
