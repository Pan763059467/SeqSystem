package daoImp;

import dao.DAO;
import dao.Iteration_2Dao;
import entity.Iteration_2Entity;

import java.util.List;

public class Iteration_2DaoImp extends DAO<Iteration_2Entity> implements Iteration_2Dao {
    @Override
    public List<Iteration_2Entity> getList(int id_project, int version) {
        String sql1 = "select * from iteration where ID_DOCUMENT = ?";
        String sql2 = "select ID_DOCUMENT from document where ID_PROJECT = ? and VERSION = ? and TYPE = 3";
        int id_document = 0;
        List<Iteration_2Entity> list = null;
        try {
            id_document = getForValue(sql2,id_project,version);
        }catch (Exception e){
            return list;
        }
        if (id_document != 0){
            list = getForList(sql1,id_document);
        }
        return list;
    }
}
