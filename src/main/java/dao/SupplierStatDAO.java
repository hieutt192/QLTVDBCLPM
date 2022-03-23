/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import models.SupplierDetail;
import models.SupplierStat;

/**
 *
 * @author HieuTT
 */
public class SupplierStatDAO extends DAO{
        
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public SupplierStatDAO() {
        super();
    }
    
    public List<SupplierStat> getSupplierStatistic(String startDate, String endDate) throws ParseException, SQLException{
        java.util.Date sDate = sdf.parse(startDate);
	java.util.Date eDate = sdf.parse(endDate);
        List<SupplierStat> res = new ArrayList<SupplierStat>();
        String sql = "SELECT tblvendor.id as vendorId,tblvendor.name as VendorName, COUNT(tblvendor.id) as \"importedTime\" from tblvendor \n" +
                        "INNER JOIN tblbill on tblvendor.id = tblbill.vendorId \n" +
                        "where tblbill.importingDate >= ? and tblbill.importingDate <= ? \n" +
                            "group by tblvendor.id;";
        
        PreparedStatement st = con.prepareStatement(sql);
        st.setDate(1,new Date(sDate.getTime()));
	st.setDate(2,new Date(eDate.getTime()));
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            String NOSupplier = rs.getString("VendorName");
            int SupplierId = rs.getInt("vendorId");
            int ImportedTime = rs.getInt("importedTime");
            res.add(new SupplierStat(ImportedTime,SupplierId,NOSupplier));
        }
        return res;
        
       
    }
   
    public List<SupplierDetail> getSupplierDetail(String startDate, String endDate, int SupplierID) throws SQLException, ParseException {
		List<SupplierDetail> supplierDetail = new ArrayList<SupplierDetail>();
		String sql = "SELECT tblvendor.name as nameSup,tblbill.importingDate,tblbookbill.amount,tblbookbill.totalCost FROM tblvendor INNER JOIN ( tblbookbill INNER JOIN tblbill on tblbookbill.bookId = tblbill.id) on tblvendor.id = tblbill.vendorId "
                        + "WHERE tblvendor.id=? AND tblbill.importingDate >= ? and tblbill.importingDate <= ?\r\n;";
                
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, SupplierID);
		st.setDate(2, new Date(sdf.parse(startDate).getTime()));
		st.setDate(3, new Date(sdf.parse(endDate).getTime()));
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			String NameOSup = rs.getString("nameSup");
			String ImportingDate = sdf.format(rs.getDate("importingDate"));			
			int amount = rs.getInt("amount");
			double totalCost = rs.getDouble("totalCost");
			supplierDetail.add(new SupplierDetail(NameOSup, ImportingDate, amount, totalCost));
		}
		return supplierDetail;
	}
    
}
