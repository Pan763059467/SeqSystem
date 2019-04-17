package dao;

import entity.IterationEntity;

import java.util.List;

public interface IterationDao {
    List<IterationEntity> getFunctionList(int id_project, int version);
    IterationEntity getOne(int catalog);
    boolean edit_w(int hours,int id_catalog,String user_name);

}
