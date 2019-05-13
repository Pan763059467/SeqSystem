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
    public boolean task_per(String person_name, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set PERSON = ? where id_catalog = ?";
        String sql2 = "select PERSON from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before;
        try {
            before = "未分配";
            before = getForValue(sql2,id_catalog);
        } catch (Exception e) {
            e.printStackTrace();
            before = "未分配";
        }
        if (before.equals(person_name)){
            return false;
        }
        update(sql1,person_name,id_catalog);
        String after = person_name;
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "责任人";
        update(sql3,id_catalog,user_name,date,where,before,after);
        return true;
    }

    @Override
    public List<IterationEntity> getFunctionTask(int id_project, int version) {
        String sql1 = "select * from view_iteration where ID_DOCUMENT = ? and PERSON is not null";
        String sql2 = "select ID_DOCUMENT from document where ID_PROJECT = ? and VERSION = ?";
        int id_doument = getForValue(sql2,id_project,version);
        List<IterationEntity> list = getForList(sql1,id_doument);
        return list;
    }

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
    public boolean edit_time(Date start, Date end, int id_catalog, String user_name) {
        String sql1 = "update iteration_2 set DATA_1 = ? where id_catalog = ?";
        String sql2 = "update iteration_2 set DATA_2 = ? where id_catalog = ?";
        String sql3 = "select DATA_1 from iteration_2 where id_catalog = ?";
        String sql4 = "select DATA_2 from iteration_2 where id_catalog = ?";
        String sql5 ="insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before1 = "未设置";
        try {
            before1 = getForValue(sql3,id_catalog).toString();
        } catch (Exception e) {
            e.printStackTrace();
            before1 = "未设置";
        }
        String before2 = "未设置";
        try {
            before2 = getForValue(sql4,id_catalog).toString();
        } catch (Exception e) {
            e.printStackTrace();
            before2 = "未设置";
        }
        update(sql1,start,id_catalog);
        update(sql2,end,id_catalog);
        String after1 = start.toString();
        String after2 = end.toString();
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where1 = "开始时间";
        update(sql5,id_catalog,user_name,date,where1,before1,after1);
        String where2 = "截至时间";
        update(sql5,id_catalog,user_name,date,where2,before2,after2);
        return true;
    }

    @Override
    public boolean edit_pri(String pri_after, String pri_before, int id_catalog,String user_name) {
        String sql1 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "优先级";
        update(sql1,id_catalog,user_name,date,where,pri_before,pri_after);
        return true;
    }

    @Override
    public boolean edit_per(String person_name, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set PERSON = ? where id_catalog = ?";
        String sql2 = "select PERSON from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before = "未分配";
        try {
            before = getForValue(sql2,id_catalog);
        } catch (Exception e) {
            e.printStackTrace();
            before = "未分配";
        }
        update(sql1,person_name,id_catalog);
        String after = person_name;
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "责任人";
        update(sql3,id_catalog,user_name,date,where,before,after);
        return true;
    }

    @Override
    public boolean edit_iter(int id_iter, int id_catalog, String user_name) {
        String sql1 = "update iteration_2 set ID_ITER = ? where id_catalog = ?";
        String sql2 = "select ITER_NAME from view_iteration where ID_CATALOG = ?";
        String sql3 = "select ITER_NAME from iteration where ID_ITER = ?";
        String sql4 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before = "未分配";
        try {
            before = getForValue(sql2,id_catalog);
        } catch (Exception e) {
            e.printStackTrace();
            before = "未分配";
        }
        update(sql1,id_iter,id_catalog);
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "迭代";
        String after = getForValue(sql3,id_iter);
        update(sql4,id_catalog,user_name,date,where,before,after);
        return true;
    }


    @Override
    public boolean edit_stage(int stage, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set Stage = ? where id_catalog = ?";
        String sql2 = "select Stage from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        int before_tmp = getForValue(sql2,id_catalog);
        String before = "未开始";
        if(before_tmp == 1){
            before = "开发中";
        }else if(before_tmp == 2){
            before = "测试中";
        }else if(before_tmp == 3){
            before = "bug修复中";
        }else if(before_tmp == 4){
            before = "已完成";
        }
        update(sql1,stage,id_catalog);
        String after = "未开始";
        if(stage == 1){
            after = "开发中";
        }else if(stage == 2){
            after = "测试中";
        }else if(stage == 3){
            after = "bug修复中";
        }else if(stage == 4){
            after = "已完成";
        }
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "当前阶段";
        update(sql3,id_catalog,user_name,date,where,before,after);
        return true;
    }

    @Override
    public boolean edit_w(int hours, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set W_HOURS = ? where id_catalog = ?";
        String sql2 = "select W_HOURS from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String sql4 = "select F_HOURS from iteration_2 where id_catalog = ?";
        String sql5 = "update iteration_2 set S_HOURS = ? where id_catalog = ?";
        String sql6 = "update iteration_2 set B_HOURS = ? where id_catalog = ?";
        String before = getForValue(sql2,id_catalog).toString();
        update(sql1,hours,id_catalog);
        String after = getForValue(sql2,id_catalog).toString();
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "预估工时";
        update(sql3,id_catalog,user_name,date,where,before,after);
        int f_hours = Integer.valueOf(getForValue(sql4, id_catalog).toString());
        int s_hours = 0;
        int b_hours = 0;
        if(f_hours > hours){
            b_hours = f_hours - hours;
        }else{
            s_hours = hours - f_hours;
        }
        update(sql5,s_hours,id_catalog);
        update(sql6,b_hours,id_catalog);
        return true;
    }

    @Override
    public boolean edit_f(int hours, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set F_HOURS = ? where id_catalog = ?";
        String sql2 = "select F_HOURS from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String sql4 = "select W_HOURS from iteration_2 where id_catalog = ?";
        String sql5 = "update iteration_2 set S_HOURS = ? where id_catalog = ?";
        String sql6 = "update iteration_2 set B_HOURS = ? where id_catalog = ?";
        String before = getForValue(sql2,id_catalog).toString();
        update(sql1,hours,id_catalog);
        String after = getForValue(sql2,id_catalog).toString();
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "完成工时";
        update(sql3,id_catalog,user_name,date,where,before,after);
        int w_hours = Integer.valueOf(getForValue(sql4, id_catalog).toString());
        int s_hours = 0;
        int b_hours = 0;
        if(w_hours > hours){
            s_hours = w_hours - hours;
        }else{
            b_hours = hours - w_hours;
        }
        update(sql5,s_hours,id_catalog);
        update(sql6,b_hours,id_catalog);
        return true;
    }

    @Override
    public boolean edit_s(int hours, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set S_HOURS = ? where id_catalog = ?";
        String sql2 = "select S_HOURS from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before = getForValue(sql2,id_catalog).toString();
        update(sql1,hours,id_catalog);
        String after = getForValue(sql2,id_catalog).toString();
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "剩余工时";
        update(sql3,id_catalog,user_name,date,where,before,after);
        return true;
    }

    @Override
    public boolean edit_b(int hours, int id_catalog,String user_name) {
        String sql1 = "update iteration_2 set B_HOURS = ? where id_catalog = ?";
        String sql2 = "select B_HOURS from iteration_2 where id_catalog = ?";
        String sql3 = "insert into track(ID_CATALOG,USER_NAME,DATE,WHERE1,BEFORE1,AFTER1) values(?,?,?,?,?,?)";
        String before = getForValue(sql2,id_catalog).toString();
        update(sql1,hours,id_catalog);
        String after = getForValue(sql2,id_catalog).toString();
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String where = "超出工时";
        update(sql3,id_catalog,user_name,date,where,before,after);
        return true;
    }

    @Override
    public List<IterationEntity> getFunctionList2(int id_iter){
        String sql1 = "select * from view_iteration where ID_ITER = ?";
        List<IterationEntity> list = getForList(sql1,id_iter);
        return list;
    }
}
