package com.tmpk.task.test.service;

import com.tmpk.task.test.dao.ContractDAO;
import com.tmpk.task.test.exceptions.ContractNotFoundException;
import com.tmpk.task.test.exceptions.TaxInfoNotFoundException;
import com.tmpk.task.test.model.Contract;
import com.tmpk.task.test.model.IncomingInfo;
import com.tmpk.task.test.model.MainContractInfo;
import com.tmpk.task.test.model.TaxInfo;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDate;
import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {

    private static final String UNKNOWN = "Данные отсутствуют";

    private ContractDAO contractDAO;

    @Autowired
    public void setContractDAO(ContractDAO contractDAO) {
        this.contractDAO = contractDAO;
    }


    public List<MainContractInfo> getContractInfoById(String id) throws ContractNotFoundException {
        List<MainContractInfo> result = contractDAO.getContractInfoById(id);
        if(result.isEmpty() || result == null) {
            throw new ContractNotFoundException();
        }
        return contractDAO.getContractInfoById(id);
    }

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

    public List<TaxInfo> getTaxInfo(String id) throws TaxInfoNotFoundException {
        List<TaxInfo> taxInfoList = contractDAO.getTaxInfoById(id);
        if(taxInfoList.isEmpty()) {
            throw new TaxInfoNotFoundException();
        }
        return taxInfoList;
    }

    @Override
    public Contract getContractById(String id) throws Exception {
        List<MainContractInfo> mainContractInfoList = getContractInfoById(id);
        List<TaxInfo> taxInfo = getTaxInfo(id);
        String balance = getBalanceById(id);
        return new Contract(mainContractInfoList.get(0), taxInfo.get(0), balance);
    }
}
