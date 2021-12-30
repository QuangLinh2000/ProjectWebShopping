package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.QuangCao;

import java.util.List;

public interface IHomeService {
    List<BoSuaTap> getAllBS();
    List<QuangCao> getAllQC();
}
