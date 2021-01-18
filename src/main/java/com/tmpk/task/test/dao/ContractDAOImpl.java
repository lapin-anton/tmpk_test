package com.tmpk.task.test.dao;

import com.tmpk.task.test.model.IncomingInfo;
import com.tmpk.task.test.model.MainContractInfo;
import com.tmpk.task.test.model.TaxInfo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;
@Repository
@Transactional(readOnly = true, propagation = Propagation.REQUIRED, rollbackFor = {java.lang.Exception.class})
public class ContractDAOImpl implements ContractDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<MainContractInfo> getContractInfoById(String id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = String.format("from MainContractInfo where contractId='%s'", id);
        Query query = session.createQuery(hql);
        List<MainContractInfo> list = query.list();
        return list;
    }

    @Override
    public List<TaxInfo> getTaxInfoById(String id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = String.format("from TaxInfo where contractId='%s'", id);
        Query query = session.createQuery(hql);
        List<TaxInfo> list = query.list();
        return list;
    }

    @Override
    public List<IncomingInfo> getIncomingInfo(String id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = String.format("from IncomingInfo where contractId='%s'", id);
        Query query = session.createQuery(hql);
        List<IncomingInfo> list = query.list();
        return list;
    }
}
