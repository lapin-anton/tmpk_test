package com.tmpk.task.test.dao;

import com.tmpk.task.test.model.IncomingInfo;
import com.tmpk.task.test.model.MainContractInfo;
import com.tmpk.task.test.model.TaxInfo;

import java.util.List;

public interface ContractDAO {
    List<MainContractInfo> getContractInfoById(String id);
    List<TaxInfo> getTaxInfoById(String id);
    List<IncomingInfo> getIncomingInfo(String id);
}
