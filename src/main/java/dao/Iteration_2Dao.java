package dao;

import entity.Iteration_2Entity;

import java.util.List;

public interface Iteration_2Dao {
    List<Iteration_2Entity> getList(int id_project, int version);
}
