package dao;

import entity.IterationEntity;

import java.util.List;

public interface IterationDao {
    List<IterationEntity> getFunctionList(int id_project, int version);
    IterationEntity getOne(int catalog);
    boolean edit_stage(int stage,int id_catalog,String user_name);
    boolean edit_w(int hours,int id_catalog,String user_name);
    boolean edit_f(int hours,int id_catalog,String user_name);
    boolean edit_s(int hours,int id_catalog,String user_name);
    boolean edit_b(int hours,int id_catalog,String user_name);
    List<IterationEntity> getFunctionList2(int id_project, int version, String id_iter);
}
