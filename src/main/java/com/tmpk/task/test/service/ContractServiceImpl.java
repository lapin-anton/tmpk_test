package com.tmpk.task.test.service;

import com.tmpk.task.test.dao.ContractDAO;
import com.tmpk.task.test.model.IncomingInfo;
import com.tmpk.task.test.model.MainContractInfo;
import com.tmpk.task.test.model.TaxInfo;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {

    private ContractDAO contractDAO;

    @Autowired
    public void setContractDAO(ContractDAO contractDAO) {
        this.contractDAO = contractDAO;
    }

    @Override
    public List<MainContractInfo> getContractInfoById(String id) {
        return contractDAO.getContractInfoById(id);
    }

    @Override
    public String getBalanceById(String id) {
        double tax = 0;
        double incoming = 0;
        List<TaxInfo> taxList = contractDAO.getTaxInfoById(id);
        List<IncomingInfo> inList = contractDAO.getIncomingInfo(id);
        for (TaxInfo t: taxList) {
            tax += t.getAmount();
        }
        for (IncomingInfo in: inList) {
            incoming += in.getAmount();
        }
        double result = incoming - tax;
        return String.format("%.2f р.", result);
    }

    @Override
    public TaxInfo getTariff(String id) {
        List<TaxInfo> taxInfoList = contractDAO.getTaxInfoById(id);
        TaxInfo result = null;
        if(taxInfoList.size() > 0) {
            result = taxInfoList.get(taxInfoList.size() - 1);
        }
        return result;
    }
}
