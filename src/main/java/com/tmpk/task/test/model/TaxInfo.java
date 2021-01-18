package com.tmpk.task.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(name = "tax_info")
public class TaxInfo {
    private long id;
    private double amount;
    private LocalDate date;
    private String tariff;
    private double cost;
    private LocalDate startDate;
    private LocalDate finishDate;
    private String contractId;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    @Column(name = "amount")
    public double getAmount() {
        return amount;
    }

    @Column(name = "date")
    public LocalDate getDate() {
        return date;
    }

    @Column(name = "tariff")
    public String getTariff() {
        return tariff;
    }

    @Column(name = "cost")
    public double getCost() {
        return cost;
    }

    @Column(name = "start")
    public LocalDate getStartDate() {
        return startDate;
    }

    @Column(name = "finish")
    public LocalDate getFinishDate() {
        return finishDate;
    }

    @Column(name = "contract_id")
    public String getContractId() {
        return contractId;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setTariff(String tariff) {
        this.tariff = tariff;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public void setFinishDate(LocalDate finishDate) {
        this.finishDate = finishDate;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }
}
