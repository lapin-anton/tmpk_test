package com.tmpk.task.test.service;

import com.tmpk.task.test.model.MainContractInfo;
import com.tmpk.task.test.model.TaxInfo;

import java.util.List;

public interface ContractService {
    List<MainContractInfo> getContractInfoById(String id);
    String getBalanceById(String id);
    TaxInfo getTariff(String id);
}
