package dao;

import entity.IterationEntity;

import java.util.Date;
import java.util.List;

public interface IterationDao {
    List<IterationEntity> getFunctionList(int id_project, int version);
    IterationEntity getOne(int catalog);
    boolean edit_time(Date start, Date end, int id_catalog, String user_name);
    boolean edit_pri(String pri_after,String pri_before,int id_catalog,String user_name);
    boolean edit_per(String person_name,int id_catalog,String user_name);
    boolean edit_iter(int id_iter,int id_catalog,String user_name);
    boolean edit_stage(int stage,int id_catalog,String user_name);
    boolean edit_w(int hours,int id_catalog,String user_name);
    boolean edit_f(int hours,int id_catalog,String user_name);
    boolean edit_s(int hours,int id_catalog,String user_name);
    boolean edit_b(int hours,int id_catalog,String user_name);
    List<IterationEntity> getFunctionList2(int id_project, int version, String id_iter);
}
