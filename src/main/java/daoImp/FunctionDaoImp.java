package daoImp;

import dao.DAO;
import dao.FunctionDao;
import entity.FunctionEntity;

import java.util.List;

public class FunctionDaoImp extends DAO<FunctionEntity> implements FunctionDao {
    @Override
    public boolean add(String person, int id_catalog, String filed, String content) {
        String sql1 = "select ID_ITER2 from iteration_2 where ID_CATALOG = ?";
        String sql2 = "insert into function(ID_ITER2,FILED,PERSON,CONTENT) values(?,?,?,?)";
        int id_iter2 = Integer.valueOf(getForValue(sql1,id_catalog).toString());
        update(sql2,id_iter2,filed,person,content);
        return true;
    }

    @Override
    public List<FunctionEntity> getList(int id_catalog) {
        String sql1 = "select ID_ITER2 from iteration_2 where ID_CATALOG = ?";
        String sql2 = "select * from function where ID_ITER2 = ? order by ID_FUNCTION desc";
        int id_iter2 = Integer.valueOf(getForValue(sql1,id_catalog).toString());
        List<FunctionEntity> list = getForList(sql2,id_iter2);
        return list;
    }
}
