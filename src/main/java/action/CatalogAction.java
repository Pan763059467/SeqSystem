package action;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import dao.CatalogDao;
import dao.TemplateDao;
import dao.UsableDao;
import dao.securityDao;
import daoImp.CatalogDaoImp;
import daoImp.TemplateDaoImp;
import daoImp.UsableDaoImp;
import daoImp.securityDaoImp;
import entity.*;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import util.Template2Pdf;
import util.Template2rtf;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by DELL on 2017/12/12.
 *
 * @author MJY
 */
public class CatalogAction extends ActionSupport implements RequestAware, SessionAware, ModelDriven<CatalogEntity>, Preparable {

    private Map<String,Object> request;
    private Map<String,Object> session;
    private Map<String, Object> dataMap;
    private int documentId;
    private CatalogEntity catalogEntity;

    private String catalogIndex;
    private int place;
    private String title;
    private String content;
    private int id_lib;
    private int  id_catalog;
    private String describe;
    private String permissions;
    private  int projectId;
    private int state;
    private int rank;
    private int index;
    private int layer;
    private String funName;
    private int priority;
    private String inDiv;
    private String outDiv;
    private String basic;
    private String alternative;
    private String funRoleList;
    private String funUsableList;
    private InputStream pdfStream;
    private InputStream rtfStream;
    private String appname;
    private String apptype;
    private String appaddress;
    private String appusage;
    private String communname;
    private String communabb;
    private String communtype;
    private String commundescribe;
    private String datatype;
    private String dataempty;
    private String dataconstraint;
    private String dataexplain;
    private String dataname;
    private String  environmenttype;
    private String  environmentconfigure;
    private String maindatabase;
    private String databasetype;
    private String databaseedition;
    private String databasesummary;
    private String systemname;
    private String systemtype;
    private String systemedition;
    private String systemframework;
    private String systemsummary;
    private String hardwarename;
    private String hardwaretype;
    private String hardwarefun;
    private String hardwarescene;
    private String webmain;
    private String webedition;
    private String websummary;
    private File file;
    private String fileFileName;


    public String doc_image()
    {
        HttpServletRequest request2 = (HttpServletRequest)ActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);

        dataMap = new HashMap<String, Object>();
        if (file!=null) {
            String savePath = ServletActionContext.getServletContext().getRealPath("docImage");

            SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
            String ymd=sdf.format(new Date());
            savePath+="/"+ymd+"/";
            File dirFile=new File(savePath);
            if(!dirFile.exists()){
                dirFile.mkdir();
            }
            String fileExt=fileFileName.substring(fileFileName.lastIndexOf(".")+1).trim().toLowerCase();
            SimpleDateFormat sdfForFileName=new SimpleDateFormat("yyyyMMddHHmmss");
            String newName=sdfForFileName.format(new Date())+"_"+new Random().nextInt(1000)+"."+fileExt;
            File destFile=new File(dirFile,newName);

            try {
                System.out.println("Src File name: " + file);
                System.out.println("Dst File name: " + fileFileName);
//                    File destFile = new File(savePath, MyFileFileName.get(i));
                FileUtils.copyFile(file, destFile);

            } catch (IOException e) {
                e.printStackTrace();
            }
            String path=request2.getContextPath()+"/"+"docImage/"+ymd+"/"+newName;
            dataMap.put("path",path);
        }
        return "RES";
    }


    public String getIndex(){
        dataMap = new HashMap<String, Object>();
        CatalogDao catalogDao=new CatalogDaoImp();
        List<CatalogEntity> catalogEntityList=catalogDao.getAllIndex(documentId);
        dataMap.put("catalogList",catalogEntityList);
        return "Re";
    }

    public String jmpTemplate(){
        request.put("documentId",documentId);
        request.put("projectId",projectId);
        session.put("projectId",projectId);
        request.put("state",state);
        request.put("rank",rank);
        return "document";
    }

    public String jmpOrgTemplate(){
        request.put("documentId",documentId);
        request.put("projectId",projectId);
        request.put("state",state);
        request.put("rank",rank);
        return "orgTemplatePage";
    }
    public String addState1(){//下一级别，需要新增ul
        String[] tempList=catalogIndex.split(" ");
        dataMap=new HashMap<>();
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        if(second==0&&third==0&&fourth==0)second++;
        else if(third==0&&fourth==0)third++;
        else if(fourth==0)fourth++;
        String spanText=first+" "+second+" "+third+" "+fourth;
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.insert(catalogEntity.getId_template(),catalogEntity.getId_document(),catalogEntity.getTitle(),first,second,third,fourth);
        dataMap.put("spanText",spanText);
        return "Re";
    }
    public String addState2(){//不需要新增，传最后一个元素的位置
        String[] tempList=catalogIndex.split(" ");
        dataMap=new HashMap<>();
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        if(second==0&&third==0&&fourth==0)first++;
        else if(third==0&&fourth==0)second++;
        else if(fourth==0)third++;
        else fourth++;
        String spanText=first+" "+second+" "+third+" "+fourth;
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.insert(catalogEntity.getId_template(),catalogEntity.getId_document(),catalogEntity.getTitle(),first,second,third,fourth);
        dataMap.put("spanText",spanText);
        return "Re";
    }
    public String delete(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        if (second==0&&third==0&&fourth==0)catalogDao.update(documentId,first);
        else if(third==0&&fourth==0)catalogDao.update(documentId,first,second);
        else if(fourth==0)catalogDao.update(documentId,first,second,third);
        else catalogDao.update(documentId,first,second,third,fourth);
        return "Re";
    }

    public String up(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        if (second==0&&third==0&&fourth==0)catalogDao.up(documentId,first);
        else if(third==0&&fourth==0)catalogDao.up(documentId,first,second);
        else if(fourth==0)catalogDao.up(documentId,first,second,third);
        else catalogDao.up(documentId,first,second,third,fourth);
        return "Re";
    }

    public String down(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        if (second==0&&third==0&&fourth==0)catalogDao.down(documentId,first);
        else if(third==0&&fourth==0)catalogDao.down(documentId,first,second);
        else if(fourth==0)catalogDao.down(documentId,first,second,third);
        else catalogDao.down(documentId,first,second,third,fourth);
        return "Re";
    }
    public String  newCatalog(){
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.newCatalog(catalogEntity.getId_document(),catalogEntity.getTitle(),catalogEntity.getId_template());
        return "Re";
    }
    public String getCatalog() {
        String[] tempList = catalogIndex.split(" ");
        int first = Integer.valueOf(tempList[0]);
        int second = Integer.valueOf(tempList[1]);
        int third = Integer.valueOf(tempList[2]);
        int fourth = Integer.valueOf(tempList[3]);
        CatalogDao catalogDao = new CatalogDaoImp();
        CatalogEntity catalogEntity = catalogDao.getOne(documentId, first, second, third, fourth);
        TemplateDao templateDao = new TemplateDaoImp();
        TemplateEntity templateEntity = templateDao.getTemplate(catalogEntity.getId_template());
        Gson gson = new Gson();
        dataMap = new HashMap<>();
//        session.put("LibType",catalogEntity.getId_template());
//        int q = (int) session.get("LibType");
//        System.out.println(q+"@");
        if (catalogEntity.getId_template() == 1) {//通用
            CommonStructureEntity entity = gson.fromJson(catalogEntity.getContent(), CommonStructureEntity.class);
            dataMap.put("entity", entity);
        } else if (catalogEntity.getId_template() == 2) {
            UserStructureEntity entity = gson.fromJson(catalogEntity.getContent(), UserStructureEntity.class);
            dataMap.put("entity", entity);
        } else if (catalogEntity.getId_template() == 3) {
            //获取角色列表
            List<CatalogEntity> catalogEntityList = catalogDao.getAllRole(documentId);
            List<UserStructureEntity> roleList = new ArrayList<>();
            for (int i = 0; i < catalogEntityList.size(); i++) {
                UserStructureEntity userStructureEntity=gson.fromJson(catalogEntityList.get(i).getContent(), UserStructureEntity.class);
                if(userStructureEntity!=null&&userStructureEntity.getRoleName()!=null)
                roleList.add(userStructureEntity);  }
                //获取当前catalog内容
                FunStructureEntity entity = gson.fromJson(catalogEntity.getContent(), FunStructureEntity.class);
            //这个是内容类
                dataMap.put("entity", entity);
                dataMap.put("roleList", roleList);
        }
        else if(catalogEntity.getId_template() == 4){
            appEntity entity = gson.fromJson(catalogEntity.getContent(), appEntity.class);
            dataMap.put("entity", entity);
        }

        else if(catalogEntity.getId_template() == 5){
            communEntity entity = gson.fromJson(catalogEntity.getContent(), communEntity.class);
            dataMap.put("entity", entity);
        }

        else if(catalogEntity.getId_template() == 6){
            dataEntity entity = gson.fromJson(catalogEntity.getContent(), dataEntity.class);
            dataMap.put("entity", entity);
        }
        else if(catalogEntity.getId_template() == 7){
            environmentEntity entity = gson.fromJson(catalogEntity.getContent(), environmentEntity.class);
            dataMap.put("entity", entity);
        }
        else if(catalogEntity.getId_template() == 8){
            databaseEntity entity = gson.fromJson(catalogEntity.getContent(), databaseEntity.class);
            dataMap.put("entity", entity);
        }
        else if(catalogEntity.getId_template() == 9){
            systemEntity entity = gson.fromJson(catalogEntity.getContent(), systemEntity.class);
            dataMap.put("entity", entity);
        }
        else if(catalogEntity.getId_template() == 10){
            hardwareEntity entity = gson.fromJson(catalogEntity.getContent(), hardwareEntity.class);
            dataMap.put("entity", entity);
        }
        else if(catalogEntity.getId_template() == 11){
            webmainEntity entity = gson.fromJson(catalogEntity.getContent(), webmainEntity.class);
            dataMap.put("entity", entity);
        }
            dataMap.put("template", templateEntity);
            //这个包括目录
            dataMap.put("catalogEntity", catalogEntity);
        UserEntity seesionUser=(UserEntity)session.get("user");
//        List<LibraryEntity> list = libraryDao.getTypeOfOneLib(seesionUser.getId_user(),catalogEntity.getId_template());
//        ActionContext.getContext().getValueStack().set("libList",list);
//        System.out.println(list);
        return "Re";
    }


    public String rename(){
        String[] tempList=catalogIndex.split(" ");
        int first=Integer.valueOf(tempList[0]);
        int second=Integer.valueOf(tempList[1]);
        int third=Integer.valueOf(tempList[2]);
        int fourth=Integer.valueOf(tempList[3]);
        CatalogDao catalogDao=new CatalogDaoImp();
        catalogDao.rename(title,documentId,first,second,third,fourth);
        return "Re";
    }
    public  String getRoleCount(){
        CatalogDao catalogDao=new CatalogDaoImp();
        dataMap=new HashMap<>();
        dataMap.put("roleCount",catalogDao.getRoleCount(documentId));
        return "Re";
    }

    public String saveTemplateOne(){
        CatalogDao catalogDao=new CatalogDaoImp();
        CommonStructureEntity structureEntity=new CommonStructureEntity(content);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public String saveLibOne(){
        CatalogDao catalogDao=new CatalogDaoImp();
        CommonStructureEntity structureEntity=new CommonStructureEntity(content);
        Gson gson = new Gson();
        int id_template=1;
        catalogDao.saveLib(id_template,content,gson.toJson(structureEntity));
        System.out.println(id_template);
        return "Re";
    }


    public  String saveTemplateTwo(){
        CatalogDao catalogDao=new CatalogDaoImp();
        UserStructureEntity structureEntity=new UserStructureEntity(content,describe,permissions);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveLibTwo(){
        CatalogDao catalogDao=new CatalogDaoImp();
        UserStructureEntity structureEntity=new UserStructureEntity(content,describe,permissions);
        Gson gson = new Gson();
        System.out.println(content);
        int id_template=2;
        catalogDao.saveLib(id_template,content,gson.toJson(structureEntity));
        return "Re";
    }

    public String saveTemplateThree(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type = new TypeToken<ArrayList<FunUsable>>() {}.getType();
        List<FunUsable> funUsables;
        funUsables=gson.fromJson(funUsableList,type);
        type= new TypeToken<ArrayList<FunRole>>() {}.getType();
        List<FunRole> funRoles;
        funRoles=gson.fromJson(funRoleList,type);
        FunStructureEntity funStructureEntity=new FunStructureEntity(funName,priority,content,funRoles,funUsables,inDiv,outDiv,basic,alternative);
        catalogDao.saveContent(id_catalog,gson.toJson(funStructureEntity));
        return "Re";
    }

    public String saveLibThree(){
        Gson gson=new Gson();
        CatalogDao catalogDao=new CatalogDaoImp();
        Type type = new TypeToken<ArrayList<FunUsable>>() {}.getType();
        List<FunUsable> funUsables;
        funUsables=gson.fromJson(funUsableList,type);
        type= new TypeToken<ArrayList<FunRole>>() {}.getType();
        List<FunRole> funRoles;
        funRoles=gson.fromJson(funRoleList,type);
        FunStructureEntity funStructureEntity=new FunStructureEntity(funName,priority,content,funRoles,funUsables,inDiv,outDiv,basic,alternative);
        int id_template=3;
        catalogDao.saveLib(id_template,funName,gson.toJson(funStructureEntity));
        return "Re";
    }

    public String saveTemplateFour(){
        CatalogDao catalogDao=new CatalogDaoImp();
        appEntity structureEntity=new appEntity(appname,apptype,appaddress,appusage);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public String saveTemplateFive(){
        CatalogDao catalogDao=new CatalogDaoImp();

        communEntity structureEntity=new communEntity(communname,communabb,communtype,commundescribe);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateSix(){
        CatalogDao catalogDao=new CatalogDaoImp();
        dataEntity structureEntity=new dataEntity(dataname,datatype,dataempty,dataconstraint,dataexplain);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateSeven(){
        CatalogDao catalogDao=new CatalogDaoImp();
        environmentEntity structureEntity=new environmentEntity(environmenttype,environmentconfigure);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateEight(){
        CatalogDao catalogDao=new CatalogDaoImp();
        databaseEntity structureEntity=new databaseEntity(maindatabase,databasetype,databaseedition,databasesummary);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateNine(){
        CatalogDao catalogDao=new CatalogDaoImp();
        systemEntity structureEntity=new systemEntity(systemname,systemtype,systemedition,systemframework,systemsummary);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateTen(){
        CatalogDao catalogDao=new CatalogDaoImp();
        hardwareEntity structureEntity=new hardwareEntity(hardwarename,hardwaretype,hardwarefun,hardwarescene);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }

    public  String saveTemplateEleven(){
        CatalogDao catalogDao=new CatalogDaoImp();
        webmainEntity structureEntity=new webmainEntity(webmain,webedition,websummary);
        Gson gson = new Gson();
        catalogDao.saveContent(id_catalog,gson.toJson(structureEntity));
        return "Re";
    }
    public String getUsable(){
        UsableDao usableDao=new UsableDaoImp();
        List<UsableEntity> usableEntityList=usableDao.getUsable();
        dataMap=new HashMap<>();
        dataMap.put("usableList",usableEntityList);
        return "Re";
    }


    public String getSecurity(){
        securityDao securityDao=new securityDaoImp();
        List<SecurityEntity> securityList=securityDao.getSecurity();
        dataMap=new HashMap<>();
        dataMap.put("securityList",securityList);
        System.out.println(securityList);
        return "Re";
    }
    public String generateContract() {
        try {
             Template2Pdf template2Pdf = new Template2Pdf();
             pdfStream= template2Pdf.createPdf(documentId);
             pdfStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        catch (com.lowagie.text.DocumentException e){
            e.printStackTrace();
        }
//        catch (DocumentException e){
//            e.printStackTrace();
//        }
        return "pdf";
    }

    public String generateContractRtf() {
        try {
            Template2rtf template2rtf = new Template2rtf();
            rtfStream=template2rtf.createRtf(documentId);
            rtfStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (com.lowagie.text.DocumentException e) {
            e.printStackTrace();
        }
        return "rtf";
    }
//    public String getTitle(){
//        CatalogDao catalogDao=new CatalogDaoImp();
//        dataMap=new HashMap<>();
//        String maptitle = catalogDao.getCatalogTitle(documentId,index,layer);
//        System.out.println(maptitle);
//        session.put("MapTitle",maptitle);
//        dataMap.put("MapTitle",maptitle);
//        return "Re";
//    }

    public void prepareNewCatalog(){
        catalogEntity=new CatalogEntity();
    }

    public void prepareAddState1(){
        catalogEntity=new CatalogEntity();
    }

    public void prepareAddState2(){
        catalogEntity=new CatalogEntity();
    }

    @Override
    public CatalogEntity getModel() {
        return catalogEntity;
    }


    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
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

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public void setCatalogIndex(String catalogIndex) {
        this.catalogIndex = catalogIndex;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setId_lib(int id_lib) {
        this.id_lib = id_lib;
    }

    public void setId_catalog(int id_catalog) {
        this.id_catalog = id_catalog;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public void setPermissions(String permissions) {
        this.permissions = permissions;
    }

    public void setFunName(String funName) {
        this.funName = funName;
    }


    public void setInDiv(String inDiv) {
        this.inDiv = inDiv;
    }

    public void setOutDiv(String outDiv) {
        this.outDiv = outDiv;
    }

    public void setBasic(String basic) {
        this.basic = basic;
    }

    public void setAlternative(String alternative) {
        this.alternative = alternative;
    }

    public void setFunRoleList(String funRoleList) {
        this.funRoleList = funRoleList;
    }

    public void setFunUsableList(String funUsableList) {
        this.funUsableList = funUsableList;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public InputStream getPdfStream() {
        return pdfStream;
    }

    public void setPdfStream(InputStream pdfStream) {
        this.pdfStream = pdfStream;
    }

    public InputStream getRtfStream() {
        return rtfStream;
    }

    public void setRtfStream(InputStream rtfStream) {
        this.rtfStream = rtfStream;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public void setLayer(int layer) {
        this.layer = layer;
    }

    public void setAppname(String appname) {
        this.appname = appname;
    }

    public void setApptype(String apptype) {
        this.apptype = apptype;
    }

    public void setAppaddress(String appaddress) {
        this.appaddress = appaddress;
    }

    public void setAppusage(String appusage) {
        this.appusage = appusage;
    }

    public void setCommunname(String communname) {
        this.communname = communname;
    }
    public void setCommunabb(String communabb) {
        this.communabb = communabb;
    }

    public void setCommuntype(String communtype) {
        this.communtype = communtype;
    }

    public void setCommundescribe(String commundescribe) {
        this.commundescribe = commundescribe;
    }

    public void setDataname(String dataname) {
        this.dataname = dataname;
    }

    public void setDatatype(String datatype) {
        this.datatype = datatype;
    }

    public void setDataempty(String dataempty) {
        this.dataempty = dataempty;
    }

    public void setDataconstraint(String dataconstraint) {
        this.dataconstraint = dataconstraint;
    }

    public void setDataexplain(String dataexplain) {
        this.dataexplain = dataexplain;
    }
    public void setEnvironmenttype(String environmenttype) {
        this.environmenttype = environmenttype;
    }
    public void setEnvironmentconfigure(String environmentconfigure) {
        this.environmentconfigure = environmentconfigure;
    }

    public void setMaindatabase(String maindatabase) {
        this.maindatabase = maindatabase;
    }

    public void setDatabasetype(String databasetype) {
        this.databasetype = databasetype;
    }

    public void setDatabaseedition(String databaseedition) {
        this.databaseedition = databaseedition;
    }

    public void setDatabasesummary(String databasesummary) {
        this.databasesummary = databasesummary;
    }

    public void setSystemname(String systemname) {
        this.systemname = systemname;
    }

    public void setSystemtype(String systemtype) {
        this.systemtype = systemtype;
    }

    public void setSystemedition(String systemedition) {
        this.systemedition = systemedition;
    }

    public void setSystemframework(String systemframework) {
        this.systemframework = systemframework;
    }

    public void setSystemsummary(String systemsummary) {
        this.systemsummary = systemsummary;
    }

    public void setHardwarename(String hardwarename) {
        this.hardwarename = hardwarename;
    }
    public void setHardwaretype(String hardwaretype) {
        this.hardwaretype = hardwaretype;
    }
    public void setHardwarefun(String hardwarefun) {
        this.hardwarefun = hardwarefun;
    }

    public void setHardwarescene(String hardwarescene) {
        this.hardwarescene = hardwarescene;
    }

    public void setWebmain(String webmain) {
        this.webmain = webmain;
    }

    public void setWebedition(String webedition) {
        this.webedition = webedition;
    }

    public void setWebsummary(String websummary) {
        this.websummary = websummary;
    }
    @Override
    public void prepare() throws Exception {

    }
}
