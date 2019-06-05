package dao;

import entity.FunctionEntity;

import java.util.List;

public interface FunctionDao {
    boolean add(String person, int id_catalog, String filed, String content);
    List<FunctionEntity> getList(int id_catalog);
}
