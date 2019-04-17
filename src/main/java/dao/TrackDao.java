package dao;

import entity.TrackEntity;

import java.util.List;

public interface TrackDao {
    List<TrackEntity> getTrack(int id_catalog);
}
