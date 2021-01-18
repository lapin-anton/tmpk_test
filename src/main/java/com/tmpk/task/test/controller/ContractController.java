package com.tmpk.task.test.controller;

import com.tmpk.task.test.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContractController {
    private ContractService service;

    @Autowired
    public void setService(ContractService service) {
        this.service = service;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView allContracts() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ModelAndView getContractInfo(@ModelAttribute("contract_id") String id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("contract_info", service.getContractInfoById(id));
        modelAndView.addObject("tariff", service.getTariff(id));
        modelAndView.addObject("balance", service.getBalanceById(id));
        return modelAndView;
    }
}
