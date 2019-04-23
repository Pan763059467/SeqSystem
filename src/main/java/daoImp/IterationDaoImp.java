package daoImp;

import dao.DAO;
import dao.IterationDao;
import entity.IterationEntity;

import javax.xml.crypto.Data;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class IterationDaoImp extends DAO<IterationEntity> implements IterationDao {
    @Override
    public List<IterationEntity> getFunctionList(int id_project, int version) {
        String sql1 = "select * from view_iteration where ID_TEMPLATE = 3 and ID_DOCUMENT = ?";
        String sql2 = "select ID_DOCUMENT from document where ID_PROJECT = ? and VERSION = ?";
        int id_doument = getForValue(sql2,id_project,version);
        List<IterationEntity> list = getForList(sql1,id_doument);
        return list;
    }

    @Override
    public IterationEntity getOne(int catalog) {
        String sql1 = "select * from view_iteration where ID_CATALOG = ?";
        IterationEntity iter = get(sql1,catalog);
        return iter;
    }

    @Override
    public boolean edit_w(int hours, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set W_HOURS = ? where id_catalog = ?";
        String sql2 = "select W_HOURS from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before = getForValue(sql2,id_catalog).toString();
        update(sql1,hours,id_catalog);
        String after = getForValue(sql2,id_catalog).toString();
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "预估工时";
        update(sql3,id_catalog,user_name,date,where,before,after);
        return true;
    }

    @Override
    public List<IterationEntity> getFunctionList2(int id_project, int version, String iter) {
        String sql1 = "select * from view_iteration where ID_TEMPLATE = 3 and ID_DOCUMENT = ? and ID_ITER = ?";
        String sql2 = "select ID_DOCUMENT from document where ID_PROJECT = ? and VERSION = ?";
        String sql3 = "select ID_ITER from iteration where ITER_NAME = ? and ID_PROJECT = ?";
        int id_iter = getForValue(sql3,iter,id_project);
        int id_doument = getForValue(sql2,id_project,version);
        List<IterationEntity> list = getForList(sql1,id_doument,id_iter);
        return list;
    }
}
