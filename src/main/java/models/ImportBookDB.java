/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.Date;

/**
 *
 * @author HieuTT
 */
public class ImportBookDB {
    private int idBook,idSupplier,quantity;
    private String title;
    private double total;
    private Date importDate;

    public ImportBookDB() {
    }

    public ImportBookDB(int idBook, int idSupplier, int quantity, String title, double total, Date importDate) {
        this.idBook = idBook;
        this.idSupplier = idSupplier;
        this.quantity = quantity;
        this.title = title;
        this.total = total;
        this.importDate = importDate;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public int getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(int idSupplier) {
        this.idSupplier = idSupplier;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }
    
}
