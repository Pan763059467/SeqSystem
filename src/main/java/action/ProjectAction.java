package action;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.*;

import daoImp.*;


import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProjectAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<ProjectEntity>, Preparable {

    private ProjectDao projectDao;
    private ProDiscussDao proDiscussDao;
    private OrganizationDao organizationDao;
    private IterationDao iterationDao;
    private ProjectEntity project;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int documentId;
    private UserDao userDao;
    private UserEntity user;
    private String iter_name;
    private int version;
    private int catalog;
    private int hours;
    private int id_catalog;
    private String user_name;
    private String person_name;
    private int stage;
    private int id_iter;
    private String pri_after;
    private String pri_before;

    public String edit_pri(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        IterationEntity iter;
        iter = iterationDao.getOne(id_catalog);
        String content = iter.getContent();
        String content2 = content.substring(content.indexOf("\",\"priority\":")+13,content.indexOf(",\"describe\":\""));
        switch (content2) {
            case "1":
                pri_before = "高";
                break;
            case "2":
                pri_before = "中";
                break;
            default:
                pri_before = "低";
                break;
        }
        switch (pri_after) {
            case "高":
                content = content.replaceAll(",\"priority\":2,\"describe\":\"",",\"priority\":1,\"describe\":\"");
                content = content.replaceAll(",\"priority\":3,\"describe\":\"",",\"priority\":1,\"describe\":\"");
                break;
            case "中":
                content = content.replaceAll(",\"priority\":1,\"describe\":\"",",\"priority\":2,\"describe\":\"");
                content = content.replaceAll(",\"priority\":3,\"describe\":\"",",\"priority\":2,\"describe\":\"");
                break;
            default:
                content = content.replaceAll(",\"priority\":2,\"describe\":\"",",\"priority\":3,\"describe\":\"");
                content = content.replaceAll(",\"priority\":1,\"describe\":\"",",\"priority\":3,\"describe\":\"");
                break;
        }
        System.out.println(content + "zzzz");
        CatalogDao catalogDao = new CatalogDaoImp();
        boolean edit_content = catalogDao.updateContent(content,id_catalog);
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_pri(pri_after,pri_before,id_catalog,user_name);
        if(res && edit_content){
            IterationEntity iter2;
            iter2 = iterationDao.getOne(catalog);
            session.put("iter",iter2);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }

    public String edit_per(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_per(person_name,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }

    public String edit_iter(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_iter(id_iter,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }

    public String edit_stage(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_stage(stage,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }


    public String edit_w_hours(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_w(hours,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }

    public String edit_f_hours(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_f(hours,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }

    public String edit_s_hours(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_s(hours,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }

    public String edit_b_hours(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        boolean res = iterationDao.edit_b(hours,id_catalog,user_name);
        if(res){
            IterationEntity iter;
            iter = iterationDao.getOne(catalog);
            session.put("iter",iter);
        }
        dataMap.put("res",res);
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(id_catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        return SUCCESS;
    }


    public String getFunctionInfo(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        IterationEntity iter;
        iter = iterationDao.getOne(catalog);
        session.put("iter",iter);
        return SUCCESS;
    }

    public String getFunctionList(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        List<IterationEntity> list = iterationDao.getFunctionList(project.getId_Project(),version);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("FunctionList",json);
        return SUCCESS;
    }

    public String displayIteration(){
        dataMap = new HashMap<>();
        iterationDao = new IterationDaoImp();
        version = (int) session.get("version_temp");
        List<IterationEntity> list = iterationDao.getFunctionList2(project.getId_Project(),version,iter_name);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("FunctionList",json);
        return SUCCESS;
    }

    public String getFunctionTrack(){
        dataMap = new HashMap<>();
        TrackDao trackDao = new TrackDaoImp();
        List<TrackEntity> list = trackDao.getTrack(catalog);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("TrackList",json);
        System.out.println(list);
        return SUCCESS;
    }

    public String newIteration(){
        dataMap = new HashMap<>();
        projectDao = new ProjectDaoImp();
        boolean res = projectDao.newIter(project.getId_Project(),iter_name,version);
        dataMap.put("res",res);
        return SUCCESS;
    }

    public String create_test() throws ParseException {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        userDao = new UserDaoImp();
        OrganizationDao organizationDao = new OrganizationDaoImp();
        System.out.println(project.getName()+" "+project.getDocument_Name());
        System.out.println(project.getId_Organization());
        UserEntity sessionUser=(UserEntity)session.get("user");
        String orgName = organizationDao.getOrgName(project.getId_Organization());
        int points = sessionUser.getPoints();
        int Npoints = (Integer)session.get("Mpoint5");
        dataMap.put("points",points);
        if(points >= Npoints) {
          if (project.getId_Organization() != 0) {
              int flag = organizationDao.usable(project.getId_Organization());
              boolean res = projectDao.save(project);
              dataMap.put("res", res);
              boolean exist = projectDao.exist(orgName);
              boolean belong = projectDao.belong(orgName,sessionUser.getId_user());
              System.out.println(belong+"dd");
              dataMap.put("belong", belong);
              dataMap.put("exist", exist);
              dataMap.put("flag", flag);
//                }
           } else {
              dataMap.put("flag", 0);
              dataMap.put("exist", true);
              dataMap.put("belong", true);
          }
        }
        user = userDao.getOne(sessionUser.getName());
        session.put("user",user);
        return SUCCESS;
    }

    public String create() {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        boolean res = projectDao.save(project);
        dataMap.put("res", res);
        return SUCCESS;
    }

    public String createDoc() {
        dataMap = new HashMap<String, Object>();
        int Id_Project = (Integer)request.get("id_Project");
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_User = user.getId_user();
        Timestamp time = new Timestamp(new java.util.Date().getTime());
        DocumentDao documentDao = new DocumentDaoImp();
        int version = documentDao.getVersion(Id_Project)+1;
        int id_document=documentDao.getDocumentId(Id_Project);
        int new_idDocument = documentDao.create(Id_Project,version,time,ID_User);
        if (id_document != -1){
            projectDao = new ProjectDaoImp();
            projectDao.copyAll(id_document,new_idDocument,version);
        }
        dataMap.put("id",new_idDocument);
        return SUCCESS;
    }

    public String chooseOrg() throws Exception {
        dataMap = new HashMap<String, Object>();
        OrganizationDao organizationDao = new OrganizationDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_User = user.getId_user();
        List<OrganizationEntity> list = organizationDao.getMatched(ID_User,project.getOrgName());
        Gson gson = new Gson();
        String jsonString = gson.toJson(list);
        dataMap.put("res",jsonString);
        return SUCCESS;
    }

    public String showOrg(){
        dataMap = new HashMap<>();
        OrganizationDao organizationDao = new OrganizationDaoImp();
        UserEntity sessionUser=(UserEntity)session.get("user");
        int ID_User = sessionUser.getId_user();
        List<OrganizationEntity> list = organizationDao.getMyOrg(ID_User);
        dataMap.put("orgList",list);
        return "success";
    }

    public String showCurrentList() {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        UserEntity user = (UserEntity) ActionContext.getContext().getSession().get("user");
        int ID_user = user.getId_user();

        List<ProjectEntity> list = projectDao.getAll(1,ID_user);
        Gson gson = new Gson();
        String json = gson.toJson(list);

        dataMap.put("res",json);
        return SUCCESS;
    }

    public String showCompletedList() {
        dataMap = new HashMap<String, Object>();
        projectDao = new ProjectDaoImp();
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");
        int ID_user = user.getId_user();
        List<ProjectEntity> list = projectDao.getAll(0,ID_user);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("res",json);
        return SUCCESS;
    }

    public String modified(){
        System.out.println(project.getFlag());
        dataMap = new HashMap<>();
        projectDao = new ProjectDaoImp();
        boolean res = projectDao.modified(project.getFlag(),project.getId_Project());
        if(res){
            project = projectDao.getOne(project.getId_Project());
        }
        session.put("project",project);
        dataMap.put("res",res);
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        dataMap = new HashMap<String, Object>();

        return null;
    }

    public String jmpProjectMember() {
        return "projectMember";
    }

    public String jmpProjectInfo() {
        Iteration_2Dao iteration2Dao = new Iteration_2DaoImp();
        DocumentDao documentDao = new DocumentDaoImp();
        ProjectEntity pro = (ProjectEntity) session.get("project");
        int version2 = documentDao.getVersion(pro.getId_Project());
        List<Iteration_2Entity> list2 = iteration2Dao.getList(pro.getId_Project(),version2);
        ActionContext.getContext().getValueStack().set("list2",list2);
        List<DocumentEntity> list3 = documentDao.getAll2(pro.getId_Project(),version2);
        ActionContext.getContext().getValueStack().set("list3",list3);
        return "projectInformation";

    }

    public String showVersion(){
        dataMap = new HashMap<>();
        Iteration_2Dao iteration2Dao = new Iteration_2DaoImp();
        List<Iteration_2Entity> iter = iteration2Dao.getList(project.getId_Project(),version);
        dataMap.put("iter_list",iter);
        dataMap.put("version_temp",version);
        iterationDao = new IterationDaoImp();
        List<IterationEntity> list = iterationDao.getFunctionList(project.getId_Project(),version);
        Gson gson = new Gson();
        String json = gson.toJson(list);
        dataMap.put("FunctionList",json);
        session.put("version_temp",version);
        return SUCCESS;
    }
    public String jmpDocument() {
        return "projectDocument";
    }
    public String jmpFunctionInfo() {
        int version = (int) session.get("version");
        int version_temp = (int) session.get("version_temp");
        System.out.println(version + " " + version_temp);
        if(version != version_temp){
            return "projectFunctionInfo2";
        }
        Iteration_2Dao iteration2Dao = new Iteration_2DaoImp();
        ProjectEntity pro = (ProjectEntity) session.get("project");
        List<Iteration_2Entity> iterations = iteration2Dao.getList(pro.getId_Project(),(int)session.get("version"));
        ActionContext.getContext().getValueStack().set("list_iter",iterations);
        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(pro.getId_Project());
        List<UserEntity> members = projectDao.getMember(project);
        ActionContext.getContext().getValueStack().set("list_members",members);
        return "projectFunctionInfo";
    }

    public String getContent(){
        iterationDao = new IterationDaoImp();
        IterationEntity iter;
        iter = iterationDao.getOne(catalog);
        Gson gson = new Gson();
        String json = gson.toJson(iter);
        dataMap = new HashMap<>();
        dataMap.put("res",json);
        return SUCCESS;
    }
    public String getProjectInfo() throws ParseException {
        dataMap = new HashMap<>();
        int id_Project = project.getId_Project();
        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);

        UserEntity pm = projectDao.getPM(project);
        UserEntity user = (UserEntity)ActionContext.getContext().getSession().get("user");

        int rank = projectDao.getRank(id_Project,user.getId_user());
        DocumentDao documentDao = new DocumentDaoImp();
        int version = documentDao.getVersion(id_Project);
        session.put("version",version);
        session.put("version_temp",version);
        session.put("rank",rank);
        session.put("PM",pm);
        session.put("project",project);
        session.put("project_date",String.valueOf(project.getDate()));
//        OrganizationDao organizationDao = new OrganizationDaoImp();
//        if (project.getOrgName() != null){
//            int days = organizationDao.days(project.getOrgName());
//            dataMap.put("days",days);
//        }else{
//            dataMap.put("days",0);
//        }
        dataMap.put("version",(int)version);
        return SUCCESS;
    }
    public String getProjectMember(){
        dataMap = new HashMap<String, Object>();
        int id_Project = project.getId_Project();

//        System.out.println(id_Project);
        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);

        List<UserEntity> members = projectDao.getMember(project);
        Gson gson = new Gson();
        String json = gson.toJson(members);

        dataMap.put("res",json);
        return SUCCESS;
    }

    public String getDocument(){
        dataMap = new HashMap<String, Object>();
        DocumentDao documentDao = new DocumentDaoImp();

        try {
            List<DocumentEntity> list = documentDao.getAll(project.getId_Project());
            int addOrNot=1;//1为可编辑，0为不可编辑
            if(list.size()!=0&&list.get(0).getState()==0)//有未发布文档，不可编辑
            {
//                System.out.println(list.get(list.size()-1).getState()+"  "+list.size());
                addOrNot=0;
            }
            Gson gson = new Gson();
            String jsonString = gson.toJson(list);
            dataMap.put("addOrNot",addOrNot);
            dataMap.put("res", jsonString);
        }catch (Exception e){
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String alterPM() throws ParseException {
        dataMap = new HashMap<String, Object>();
        String username = project.getUsername();
        UserDao userDao = new UserDaoImp();
        UserEntity user = userDao.getOne(username);

//        System.out.println(username);

        int id_Project = project.getId_Project();

//        System.out.println(id_Project);

        projectDao = new ProjectDaoImp();
        boolean res = projectDao.alterPM(user.getId_user(),id_Project);

        project = projectDao.getOne(id_Project);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String content = "你已成为"+project.getName()+"的组长";
        informationDao.toMember(id_Project,user.getId_user(),content);
        dataMap.put("res",res);

        return SUCCESS;
    }
    public String setVPM(){

        int id_User = project.getId_User();
        int id_Project = project.getId_Project();

        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);
        projectDao = new ProjectDaoImp();
        projectDao.setVPM(id_User,id_Project);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String Name = projectDao.findAdminName(id_Project);
        String content = "你已被"+Name+"任命为"+project.getName()+"的副组长";
        informationDao.toMember(id_Project,id_User,content);

        return SUCCESS;
    }

    public String dismissVPM(){
        int id_User = project.getId_User();
        int id_Project = project.getId_Project();

        projectDao = new ProjectDaoImp();
        project = projectDao.getOne(id_Project);

        projectDao = new ProjectDaoImp();
        projectDao.dismissVPM(id_User,id_Project);

//        发送消息
        InformationDao informationDao = new InformationDaoImp();
        String Name = projectDao.findAdminName(id_Project);
        String content = "你已被"+Name+"撤除"+project.getName()+"的副组长职位";
        informationDao.toMember(id_Project,id_User,content);

        return SUCCESS;
    }

    public String deleteMember(){
        int id_User = project.getId_User();
        int id_Project = project.getId_Project();

        projectDao = new ProjectDaoImp();

        project = projectDao.getOne(id_Project);

        projectDao.deleteMember(id_User,id_Project);

//      发送消息
        InformationDao informationDao = new InformationDaoImp();
        String Name = projectDao.findAdminName(id_Project);
        String content = "你已被"+Name+"从"+project.getName()+"中移除";
        informationDao.toMember(id_Project,id_User,content);
        return SUCCESS;
    }

    public String inviteMember() throws ParseException {
        dataMap = new HashMap<String, Object>();

        String username = project.getUsername();

        int id_Project = project.getId_Project();

//        System.out.println(username);
//        System.out.println(id_Project);

        UserDao userDao = new UserDaoImp();
        UserEntity user = userDao.getOne(username);
        if(user == null){
            boolean res = false;
            dataMap.put("One",0);
            dataMap.put("res",res);
        }
        else {
            projectDao = new ProjectDaoImp();
            organizationDao = new OrganizationDaoImp();
            project = projectDao.getOne(id_Project);
            System.out.println(project.getId_Organization());
            boolean isIn = false;
            OrganizationEntity organizationEntity = new OrganizationEntity();
            if(project.getId_Organization()!=0){
                isIn = organizationDao.isIn(user.getId_user(),project.getId_Organization());
                organizationEntity = organizationDao.getOne(project.getId_Organization());
            }
            if(isIn || project.getId_Organization() == 0){
                UserEntity pm = projectDao.getPM(project);
                String content = pm.getName() + "邀请你加入" + project.getName();
                boolean res = projectDao.inviteMember(user.getId_user(), id_Project, content);
                int One = userDao.JudgmentOne(username);
                dataMap.put("One",One);
                dataMap.put("res",res);
            }
            else{
                dataMap.put("res",false);
                dataMap.put("One",0);
                dataMap.put("isIn",isIn);
                dataMap.put("orgName",organizationEntity.getNAME());
            }
        }
        return SUCCESS;
    }

    public String deploy() {
        DocumentDao documentDao = new DocumentDaoImp();
        documentDao.deploy(documentId);
        return "deploy";
    }

    public String end(){
        int id_Project = (Integer)request.get("id_Project");
//        System.out.println(id_Project);
        projectDao = new ProjectDaoImp();
        projectDao.end(id_Project);
        return "end";
    }
    public String delete(){
        DocumentDao documentDao = new DocumentDaoImp();
//        System.out.println(documentId);
        documentDao.delete(documentId);
        return "projectInformation";
    }

    @Override
    public void prepare() throws Exception {
        project = new ProjectEntity();
    }

    public String getPri_after() {
        return pri_after;
    }

    public void setPri_after(String pri_after) {
        this.pri_after = pri_after;
    }

    public String getPri_before() {
        return pri_before;
    }

    public void setPri_before(String pri_before) {
        this.pri_before = pri_before;
    }

    public String getPerson_name() {
        return person_name;
    }

    public void setPerson_name(String person_name) {
        this.person_name = person_name;
    }

    public int getId_iter() {
        return id_iter;
    }

    public void setId_iter(int id_iter) {
        this.id_iter = id_iter;
    }

    public int getStage() {
        return stage;
    }

    public void setStage(int stage) {
        this.stage = stage;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getId_catalog() {
        return id_catalog;
    }

    public void setId_catalog(int id_catalog) {
        this.id_catalog = id_catalog;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getCatalog() {
        return catalog;
    }

    public void setCatalog(int catalog) {
        this.catalog = catalog;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public int getDocumentId() {
        return documentId;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public String getIter_name() {
        return iter_name;
    }

    public void setIter_name(String iter_name) {
        this.iter_name = iter_name;
    }

    public Map<String, Object> getRequest() {
        return request;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    @Override
    public ProjectEntity getModel() {
        return project;
    }
}
