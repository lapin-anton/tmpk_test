package com.tmpk.task.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "main_contract_info")
public class MainContractInfo {
    private long id;
    private String contractId;
    private String fio;
    private String isCompany;
    private String status;
    private String city;
    private String street;
    private String building;
    private String apartment;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    @Column(name = "contract_id")
    public String getContractId() {
        return contractId;
    }

    @Column(name = "fio")
    public String getFio() {
        return fio;
    }

    @Column(name = "is_company")
    public String getIsCompany() {
        return isCompany;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    @Column(name = "city")
    public String getCity() {
        return city;
    }

    @Column(name = "street")
    public String getStreet() {
        return street;
    }

    @Column(name = "building")
    public String getBuilding() {
        return building;
    }

    @Column(name = "apartment")
    public String getApartment() {
        return apartment;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public void setIsCompany(String isCompany) {
        this.isCompany = isCompany;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }
}
