package com.tmpk.task.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(name = "incoming_info")
public class IncomingInfo {
    private long id;
    private double amount;
    private LocalDate date;
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

    @Column(name = "contract")
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

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }
}
