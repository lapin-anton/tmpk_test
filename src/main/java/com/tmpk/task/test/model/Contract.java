package com.tmpk.task.test.model;

public class Contract {
    private MainContractInfo mainContractInfo;
    private TaxInfo taxInfo;
    private String balance;

    public Contract() {
    }

    public Contract(MainContractInfo mainContractInfo, TaxInfo taxInfo, String balance) {
        this.mainContractInfo = mainContractInfo;
        this.taxInfo = taxInfo;
        this.balance = balance;
    }

    public MainContractInfo getMainContractInfo() {
        return mainContractInfo;
    }

    public void setMainContractInfo(MainContractInfo mainContractInfo) {
        this.mainContractInfo = mainContractInfo;
    }

    public TaxInfo getTaxInfo() {
        return taxInfo;
    }

    public void setTaxInfo(TaxInfo taxInfo) {
        this.taxInfo = taxInfo;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }
}
