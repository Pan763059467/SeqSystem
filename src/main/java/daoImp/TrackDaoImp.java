package daoImp;

import dao.DAO;
import dao.TrackDao;
import entity.TrackEntity;

import java.util.List;

public class TrackDaoImp extends DAO<TrackEntity> implements TrackDao {
    @Override
    public List<TrackEntity> getTrack(int id_catalog) {
        String sql1 = "select * from track where ID_CATALOG = ? order by ID_TRACK desc";
        List<TrackEntity> list = getForList(sql1,id_catalog);
        return list;
    }
}
