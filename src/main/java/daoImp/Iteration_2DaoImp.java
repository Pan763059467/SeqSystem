package daoImp;

import dao.DAO;
import dao.Iteration_2Dao;
import entity.Iteration_2Entity;

import java.util.List;

public class Iteration_2DaoImp extends DAO<Iteration_2Entity> implements Iteration_2Dao {
    @Override
    public List<Iteration_2Entity> getList(int id_project, int version) {
        String sql1 = "select * from iteration where ID_DOCUMENT = ?";
        String sql2 = "select ID_DOCUMENT from document where ID_PROJECT = ? and VERSION = ?";
        int id_doument = getForValue(sql2,id_project,version);
        List<Iteration_2Entity> list = getForList(sql1,id_doument);
        return list;
    }
}
