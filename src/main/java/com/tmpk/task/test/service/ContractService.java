package com.tmpk.task.test.service;

import com.tmpk.task.test.model.Contract;

public interface ContractService {
    Contract getContractById(String id) throws Exception;
}
