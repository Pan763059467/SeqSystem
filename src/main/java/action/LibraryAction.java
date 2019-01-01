package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.LibraryDao;
import daoImp.LibraryDaoImp;
import entity.*;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class LibraryAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<LibraryEntity>, Preparable {
    private LibraryDao libraryDao;
    private LibraryEntity library;
    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private  int page;

    public String get() {
      /*  dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryAll;
        int page=1;
        libraryAll=libraryDao.getAll((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("list",libraryAll);
        int count=libraryDao.getAllcount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);*/
        return "getcommon";
    }

    public String getagain() {
        /*dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryAllagain;
        libraryAllagain=libraryDao.getAll((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("list",libraryAllagain);
        int count=libraryDao.getAllcount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);*/
        return "getcommon";
    }

    /*public String getcommon() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCommon;
        int page=1;
        int count=libraryDao.getCommoncount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        libraryCommon=libraryDao.getCommon((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcommon",libraryCommon);
        return "getcommon";
    }

    public  String getcommonagain()
    {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCommonagain;
        libraryCommonagain=libraryDao.getCommon((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcommon",libraryCommonagain);
        int count=libraryDao.getCommoncount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getcommon";
    }*/

    public String getuser() {
        /*dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryUser;
        int page=1;
        int count=libraryDao.getUsercount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        libraryUser=libraryDao.getUser((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listuser",libraryUser);*/
        return "getpersonalStructure";
    }

    public String getuseragain()
    {
        /*dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryUseragain;
        libraryUseragain=libraryDao.getUser((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listuser",libraryUseragain);
        int count=libraryDao.getUsercount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);*/
        return "getpersonalStructure";
    }

    public String getcase() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCase;
        int page=1;
        libraryCase=libraryDao.getCase((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcase",libraryCase);
        int count=libraryDao.getCasecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getcase";
    }

    public String getcaseagain(){
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryCaseagain;
        libraryCaseagain=libraryDao.getCase((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listcase",libraryCaseagain);
        int count=libraryDao.getCasecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getcase";
    }

    public String getpicture() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryPicture;
        int page=1;
        int count=libraryDao.getPicturecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        libraryPicture=libraryDao.getPicture((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listpicture",libraryPicture);
        return "getpicture";
    }

    public String getpictureagain()
    {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryPictureagain;
        libraryPictureagain=libraryDao.getPicture((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listpicture",libraryPictureagain);
        int count=libraryDao.getPicturecount();
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "getpicture";
    }

    public String Mycollect() {
        /*dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> librarycollectAll;
        int page=1;
        librarycollectAll=libraryDao.getMycollect((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        System.out.println(librarycollectAll);
        ActionContext.getContext().getValueStack().set("listmycollect",librarycollectAll);
        int count=libraryDao.getMycollectcount((((UserEntity)session.get("user")).getId_user()));
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);*/
        return "getMycollect";
    }

    public String Mycollectagain(){
       /* dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> librarycollectAllagain;
        librarycollectAllagain=libraryDao.getMycollect((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("listmycollect",librarycollectAllagain);
        int count=libraryDao.getMycollectcount((((UserEntity)session.get("user")).getId_user()));
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);*/
        return "getMycollect";
    }

    public String jmpUserLibrary(){
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryAll;
        int page=1;
        libraryAll=libraryDao.getUserAll((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("list",libraryAll);
        int count=libraryDao.getNowcount(((UserEntity) session.get("user")).getId_user());
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "userLibraryPage";
    }

    public String getUserAllAgain() {
        dataMap = new HashMap<String, Object>();
        libraryDao = new LibraryDaoImp();
        List<LibraryEntity> libraryAllagain;
        libraryAllagain=libraryDao.getUserAll((((UserEntity)session.get("user")).getId_user()),(page-1)*6,(page-1)*0+6);
        ActionContext.getContext().getValueStack().set("list",libraryAllagain);
        int count=libraryDao.getNowcount(((UserEntity) session.get("user")).getId_user());
        if(count%6==0) {
            int num = count / 6;
            request.put("num", num);
        }
        else if(count%6!=0)
        {
            int num = count / 6 +1;
            request.put("num", num);
        }
        request.put("page",page);
        return "userLibraryPage";
    }

    public String newLibrary(){
        /*dataMap = new HashMap<>();
        libraryDao = new LibraryDaoImp();
        UserEntity user = (UserEntity) session.get("user");
        boolean res = libraryDao.newLibrary(library.getName(),user.getId_user(),library.getId_template(),library.getMention());
        dataMap.put("res",res);*/
        return "getMyrelease";
    }

    public String deleteLibrary() {
        dataMap = new HashMap<>();
        libraryDao = new LibraryDaoImp();
        boolean res = libraryDao.deleteLibrary(library.getId_library());
        dataMap.put("res", res);
        return SUCCESS;
    }
    /*
    public String showStructure(){
        dataMap = new HashMap<String, Object>();
        LibraryDao = new LibraryDaoImp();
      //  StructureEntity user = (StructureEntity) ActionContext.getContext().getSession().get("user");
      //  int ID_user = user.getId_user();

        List<LibraryEntity> list = LibraryDao.getAll();
        Gson gson = new Gson();
        String json = gson.toJson(list);

        dataMap.put("res",json);
        return SUCCESS;
    }
*/
    @Override
    public LibraryEntity getModel() {
        return library;
    }

    @Override
    public void prepare() throws Exception {
        library = new LibraryEntity();
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

    public void setPage(int page) {
        this.page = page;
    }
}
