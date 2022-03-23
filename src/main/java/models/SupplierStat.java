/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;

/**
 *
 * @author HieuTT
 */
public class SupplierStat implements Serializable{
    private int ImportedTime,IDSupplier;
    private String NOSupplier;

    public SupplierStat() {
    }

    public SupplierStat(int ImportedTime, int IDSupplier, String NOSupplier) {
        this.ImportedTime = ImportedTime;
        this.IDSupplier = IDSupplier;
        this.NOSupplier = NOSupplier;
    }

    public int getImportedTime() {
        return ImportedTime;
    }

    public void setImportedTime(int ImportedTime) {
        this.ImportedTime = ImportedTime;
    }

    public int getIDSupplier() {
        return IDSupplier;
    }

    public void setIDSupplier(int IDSupplier) {
        this.IDSupplier = IDSupplier;
    }

    public String getNOSupplier() {
        return NOSupplier;
    }

    public void setNOSupplier(String NOSupplier) {
        this.NOSupplier = NOSupplier;
    }

    
   
    
}
