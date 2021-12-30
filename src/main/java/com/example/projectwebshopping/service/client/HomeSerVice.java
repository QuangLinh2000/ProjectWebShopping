package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.dao.client.QuangCaoAndBoSTDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.QuangCao;

import java.util.List;

public class HomeSerVice implements IHomeService{
    @Override
    public List<BoSuaTap> getAllBS() {
        return QuangCaoAndBoSTDao.getInstance().getAllBS();
    }

    @Override
    public List<QuangCao> getAllQC() {
        return QuangCaoAndBoSTDao.getInstance().getAllQC();
    }
}
