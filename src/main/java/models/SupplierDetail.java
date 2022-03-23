/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author HieuTT
 */
public class SupplierDetail implements Serializable{
    private String NameSupplier;
    private String ImportDate;
    private int Amount;
    private double totalCost;

    public SupplierDetail() {
    }

    public SupplierDetail(String NameSupplier, String ImportDate, int Amount, double totalCost) {
        this.NameSupplier = NameSupplier;
        this.ImportDate = ImportDate;
        this.Amount = Amount;
        this.totalCost = totalCost;
    }

    public String getNameSupplier() {
        return NameSupplier;
    }

    public void setNameSupplier(String NameSupplier) {
        this.NameSupplier = NameSupplier;
    }

    public String getImportDate() {
        return ImportDate;
    }

    public void setImportDate(String ImportDate) {
        this.ImportDate = ImportDate;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }
    
    
}
