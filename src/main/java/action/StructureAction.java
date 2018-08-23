package action;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LibrarydiscussDao;
import dao.StructureDao;
import dao.LibraryDao;
import daoImp.LibraryDaoImp;
import daoImp.LibrarydiscussDaoImp;
import daoImp.StructureDaoImp;
import entity.*;
import org.apache.struts2.components.If;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import util.Json;
import com.google.gson.Gson;

import java.util.*;

public class StructureAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<StructureEntity>, Preparable {
    private StructureDao structureDao;
    private LibrarydiscussDao librarydiscussDao;
    private LibraryDao libraryDao;
    private LibraryEntity library;
    private LibrarydiscussEntity librarydiscuss;
    private StructureEntity structure;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int id_template;
    private int page;
    private int pagedis;


    public String get()
    {
        structureDao = new StructureDaoImp();
        librarydiscussDao = new LibrarydiscussDaoImp();
        libraryDao=new LibraryDaoImp();

        List<LibrarydiscussEntity> discussAll=librarydiscussDao.getAll(structure.getId_library(),(pagedis-1)*4,(pagedis-1)*0+4);
        //拿构件库评论
        List<LiDicussE> ldList=new LinkedList<>();
        for (int i = 0; i < discussAll.size(); i++) {
            Date a=new Date();
            ldList.add(new LiDicussE(discussAll.get(i),a.getTime()-discussAll.get(i).getTime().getTime()));
        }
        ActionContext.getContext().getValueStack().set("listdis",ldList);

        int discussnum=librarydiscussDao.getcount(structure.getId_library());

        if(discussnum%4==0&&discussnum!=0) {
            int numdis = discussnum / 4;
            request.put("numdis", numdis);
        }
        else if(discussnum%4!=0)
        {
            int numdis = discussnum / 4 +1;
            request.put("numdis",numdis);
        }

        else if(discussnum==0)
        {
            int numdis = 1;
            request.put("numdis", numdis);
        }
        //评论翻页

        request.put("pagedis",pagedis);
        request.put("dn",discussnum);


        library=libraryDao.getOne(structure.getId_library());
        request.put("library",library);//拿该构件库实体

        Gson gson = new Gson();

        List<StructureEntity> structureAll;
        if(id_template==1){
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*9,(page-1)*0+9);
            int count=structureDao.count(structure.getId_library());
            if(count%9==0&&count!=0) {
                int num = count / 9;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num = 1;
                request.put("num", num);
            }
            else if(count%9!=0)
            {
                int num = count / 9 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List csList=new LinkedList<>();
            List csieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   CommonStructureEntity cs = gson.fromJson(structureAll.get(i).getContent(), CommonStructureEntity.class);
                csList.add(cs);
            }
            for(int i=0;i<structureAll.size();i++)
            {   CommonStructureIdEntity csie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", CommonStructureIdEntity.class);
                csieList.add(csie);
            }
            ActionContext.getContext().getValueStack().set("list1",csList);
            ActionContext.getContext().getValueStack().set("list2",csieList);
        }
        else if(id_template==2) {
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*4,(page-1)*0+4);
            int count=structureDao.count(structure.getId_library());
            if(count%4==0&&count!=0) {
                int num = count / 4;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%4!=0)
            {
                int num = count / 4 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_structure", structure.getId_structure());
            request.put("id_template",id_template);
            List usList=new LinkedList<>();
            List usieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureEntity us = gson.fromJson(structureAll.get(i).getContent(), UserStructureEntity.class);
                usList.add(us);
            }
            for(int i=0;i<structureAll.size();i++)
            {   UserStructureIdEntity usie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", UserStructureIdEntity.class);
                System.out.println(usie);
                usieList.add(usie);
            }
            System.out.println(structureAll);
            ActionContext.getContext().getValueStack().set("list2",usieList);
        }
        else if(id_template==3) {
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*2,(page-1)*0+2);
            int count=structureDao.count(structure.getId_library());
            if(count%2==0&&count!=0) {
                int num = count / 2;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%2!=0)
            {
                int num = count / 2 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List funList=new LinkedList<>();
            List fsieList = new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   FunStructureEntity funs = gson.fromJson(structureAll.get(i).getContent(), FunStructureEntity.class);
                funList.add(funs);
            }
            for(int i=0;i<structureAll.size();i++)
            {   FunStructureIdEntity fsie = gson.fromJson((structureAll.get(i).getContent()).substring(0, structureAll.get(i).getContent().length() - 1) + ",id_structure:" + String.valueOf(structureAll.get(i).getId_structure()) + "}", FunStructureIdEntity.class);
                fsieList.add(fsie);
            }
            ActionContext.getContext().getValueStack().set("list3",fsieList);
        }
        else if(id_template==4)
        {
            structureAll=structureDao.getAll(structure.getId_library(),(page-1)*4,(page-1)*0+4);
            int count=structureDao.count(structure.getId_library());
            if(count%4==0&&count!=0) {
                int num = count / 4;
                request.put("num", num);
            }
            else if(count==0)
            {
                int num=1;
                request.put("num", num);
            }
            else if(count%4!=0)
            {
                int num = count / 4 +1;
                request.put("num", num);
            }
            request.put("page",page);
            request.put("id_library",structure.getId_library());
            request.put("id_template",id_template);
            List psList=new LinkedList<>();
            for(int i=0;i<structureAll.size();i++)
            {   PictureStructureEntity ps = gson.fromJson(structureAll.get(i).getContent(), PictureStructureEntity.class);
                psList.add(ps);
            }
            ActionContext.getContext().getValueStack().set("list4",psList);
        }//拿构件出来

        return "get";
    }

    public String create(){
        dataMap = new HashMap<>();
        structureDao = new StructureDaoImp();
        boolean res = structureDao.create(structure.getId_library(),structure.getContent());
        dataMap.put("res",res);
        return "RES";
    }

    @Override
    public StructureEntity getModel() {
        return structure;
    }

    @Override
    public void prepare() throws Exception {
        structure = new StructureEntity();
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void setRequest(Map<String, Object> request) {
        this.request = request;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public void setId_template(int id_template) {
        this.id_template = id_template;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public void setPagedis(int pagedis) {
        this.pagedis = pagedis;
    }
}
