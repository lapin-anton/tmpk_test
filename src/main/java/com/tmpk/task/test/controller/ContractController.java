package com.tmpk.task.test.controller;

import com.tmpk.task.test.model.Contract;
import com.tmpk.task.test.service.ContractService;
import com.tmpk.task.test.util.ContractForm;
import com.tmpk.task.test.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

@Controller
public class ContractController {
    private ContractService service;

    @Autowired
    public void setService(ContractService service) {
        this.service = service;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showForm(HttpServletRequest hsr, HttpServletResponse hsr1) {
        ModelAndView result = new ModelAndView("index");
        result.addObject("contractForm", new ContractForm());
        return result;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    protected ModelAndView getContractInfo(ContractForm contractForm) throws UnsupportedEncodingException {
        ModelAndView result = new ModelAndView("index");
        Contract contract = null;
        String id = contractForm.getContractId();
        if (id.matches("^[a-z]{2}\\/\\d{4}-\\d{2}$")) {
            try {
                contract = service.getContractById(contractForm.getContractId());
            } catch (Exception e) {
                Message message = new Message("error",
                            String.format("Документ с номером %s не найден.", contractForm.getContractId()));
                result.addObject("message", message);
                return result;
            }
            result.addObject("contract", contract);
        } else {
            result.addObject("message", new Message("error",
                    "Неверный формат введенных данных."));
        }
        return result;
    }
}
