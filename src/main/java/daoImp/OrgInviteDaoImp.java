package daoImp;

import dao.DAO;
import dao.OrgInviteDao;
import entity.OrgInviteEntity;
import entity.UserEntity;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class OrgInviteDaoImp extends DAO<OrgInviteEntity> implements OrgInviteDao {
    @Override
    public boolean inviteUser(String content,OrgInviteEntity a,UserEntity b) {
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int id_org = getForValue(sql1,a.getORG_NAME());
        String sql2 = "select ID_USER from USER where NAME = ? and ID_USER not in (select ID_USER from ORG_MEMBER where ID_ORGANIZATION=?)";
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        try {
            int id_user = getForValue(sql2,a.getUSER_NAME(),id_org);
            String sql3 = "insert into ORG_USER_APPLY (ID_ORGANIZATION,ID_USER,DATE,MESSAGE) value(?,?,?,?)";
            update(sql3,id_org,id_user,date,content);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public  boolean AlreadyInvite(OrgInviteEntity a){
        String sql1 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        String sql2 = "select ID_USER from user where NAME=?";
        int id_org = getForValue(sql1,a.getORG_NAME());
        int id_user = getForValue(sql2,a.getUSER_NAME());
        String sql3 = "select count(*) from ORG_USER_APPLY where ID_USER = ? and ID_ORGANIZATION = ? and STATE = 0";
        int count = Integer.valueOf(getForValue(sql3,id_user,id_org).toString());
        if(count >= 1){
            return true;
        }
        return false;
    }

    @Override
    public boolean reInviteUser(OrgInviteEntity a) {
        String sql1 = "select ID_USER from USER where NAME = ?";
        int id_user = getForValue(sql1,a.getUSER_NAME());
        String sql2 = "select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int id_org = getForValue(sql2,a.getORG_NAME());
        Timestamp date = new Timestamp(new java.util.Date().getTime());
        String sql3 = "update ORG_USER_APPLY set STATE = 0,DATE=? where ID_USER=? and ID_ORGANIZATION=? and STATE=-1";
        update(sql3,date,id_user,id_org);
        return true;
    }

    @Override
    public List<OrgInviteEntity> getlist(String name) {
        String sql1="select * from view_showorginvite where ORG_NAME=?";
        List<OrgInviteEntity> list=getForList(sql1,name);
        return list;
    }

    @Override
    public boolean grantOrg(int advance_id, int current_id , String org_name) {
        String sql1="update ORGANIZATION set ID_USER=? where NAME=? and ID_USER = ?";
        update(sql1,current_id,org_name,advance_id);
        return true;
    }

    @Override
    public boolean deleteUser(int user_id, String org_name) {
        String sql1="select ID_ORGANIZATION from ORGANIZATION where NAME=?";
        int org_id = getForValue(sql1,org_name);
        String sql2="delete from ORG_MEMBER where ID_USER=? and ID_ORGANIZATION=?";
        update(sql2,user_id,org_id);
        return true;
    }
}
