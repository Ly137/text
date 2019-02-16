package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.wm.utils.DbConn;

import bean.Students;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class ImportExcel
 */
@WebServlet("/ImportExcel")
public class ImportExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 // �ϴ��ļ��洢Ŀ¼
     private static final String UPLOAD_DIRECTORY = "ImportExcel";
     // �ϴ�����
     private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
     private static final int MAX_FILE_SIZE      = 1024 * 1024 * 4; // 40MB
     private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 5; // 50MB
  
     
     /**
      * �ϴ����ݼ������ļ�
      */
     protected void doPost(HttpServletRequest request,
         HttpServletResponse response) throws ServletException, IOException {
     	response.setCharacterEncoding("utf-8");
 		response.setContentType("text/html");
 		
 		
 	 	//����json����
 		JSONObject json=new JSONObject();
 		//�������ݿ��������
 		DbConn db=Dbhelper.getDb();
 		HttpSession session=request.getSession();    	
         // ����Ƿ�Ϊ��ý���ϴ�
         if (!ServletFileUpload.isMultipartContent(request)) {
             // ���������ֹͣ
            PrintWriter writer = response.getWriter();
             writer.println("Error: ��������� enctype=multipart/form-data");
             writer.flush();
             return;
         	
         }
         
         // �����ϴ�����
         DiskFileItemFactory factory = new DiskFileItemFactory();
         // �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
         factory.setSizeThreshold(MEMORY_THRESHOLD);
         // ������ʱ�洢Ŀ¼
         factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
  
         ServletFileUpload upload = new ServletFileUpload(factory);
          
         // ��������ļ��ϴ�ֵ
         upload.setFileSizeMax(MAX_FILE_SIZE);
          
         // �����������ֵ (�����ļ��ͱ�����)
         upload.setSizeMax(MAX_REQUEST_SIZE);

         // ���Ĵ���
         upload.setHeaderEncoding("UTF-8"); 

         // ������ʱ·�����洢�ϴ����ļ�
         // ���·����Ե�ǰӦ�õ�Ŀ¼
         String basePath=request.getServletContext().getRealPath("./") + File.separator;       
         String uploadPath = basePath+UPLOAD_DIRECTORY;
             		   		  	     
         // ���Ŀ¼�������򴴽�
         File uploadDir = new File(uploadPath);
         if (!uploadDir.exists()) {
             uploadDir.mkdir();
         }
         Object cid=session.getAttribute("cid");
         int classid=Integer.parseInt(cid.toString());
        
         try {
             // ���������������ȡ�ļ�����
             //@SuppressWarnings("unchecked")
             List<FileItem> formItems = upload.parseRequest(request);
                         
             if (formItems != null && formItems.size() > 0) {            
                 // ����������
                 for (FileItem item : formItems) {
                     // �����ڱ��е��ֶ�
                	 System.out.print("item.getName()="+item.getName());
                     if (!item.isFormField()) {
                     String fileName = new File(item.getName()).getName();                       
                 	System.out.print("fileName="+fileName);
                 	                  		
                         String filePath = uploadPath + File.separator + fileName;                        
                         File storeFile = new File(filePath);
                         // �ڿ���̨����ļ����ϴ�·��                      
                         System.out.println(";filePath="+filePath);                       
                        
                         // �����ļ���Ӳ��
                         item.write(storeFile); 
                         //���Զ�ȡExcel�ļ��е�����
                        try{
                        	File excel = new File(filePath);
                            if (excel.isFile() && excel.exists()) {   //�ж��ļ��Ƿ����
                            	String[] split = excel.getName().split("\\.");  //.�������ַ�����Ҫת��
                            	Workbook wb;
                                //�����ļ���׺��xls/xlsx�������ж�
                            	if ( "xls".equals(split[1])){
                                    FileInputStream fis = new FileInputStream(excel);   //�ļ�������
                                    wb = new HSSFWorkbook(fis);
                                }else if ("xlsx".equals(split[1])){
                                    wb = new XSSFWorkbook(excel);
                                }else {
                                    System.out.println("�ļ����ʹ���!");
                                    return;
                                }
                            	//����students����
                            	
                            	List<Students> stuList = new ArrayList();
                            	
                            	//��ʼ����
                            	Sheet sheet=wb.getSheetAt(0);	//��ȡsheet 0
                            	int firstRowIndex = sheet.getFirstRowNum()+1;	//��һ����title������+1
                            	int lastRowIndex =sheet.getLastRowNum();
                            	System.out.println("firstRowIndex:"+firstRowIndex);
                            	System.out.println("lastRowIndex:"+lastRowIndex);
                            	for(int rowIndex =firstRowIndex;rowIndex<=lastRowIndex;rowIndex++) {
                            		System.out.println("rowIndex="+rowIndex);
                            		Row row=sheet.getRow(rowIndex);
                            		if(row !=null) {
                            			int firstCellIndex=row.getFirstCellNum();
                            			int lastCellIndex=row.getLastCellNum();
                            			Students stu=new Students();
                            			for (int cellIndex=firstCellIndex;cellIndex<lastCellIndex;cellIndex++) {
                            				Cell cell=row.getCell(cellIndex);                            				
                        					//�˴����ǹ̶�ģ���Excel�ļ�����ʽΪ    ��ѧ�ţ��������Ա��ֻ��ţ����롱                       				                        					
                        					if(cellIndex==0 && cell!=null) {                        						
                        						stu.setSno(cell.toString());                        						
                        					}
                        					if(cellIndex==1 && cell!=null) {                        						
                        						stu.setSname(cell.toString());                        						
                        					}
                        					if(cellIndex==2 && cell!=null) {
                        						stu.setSgender(cell.toString());                        						
                        					}
                        					if(cellIndex==3 && cell!=null) {
                        						String phone=String.valueOf(cell.toString());
                        						stu.setSphone(phone);                        					                       						
                        					}
                        					if(cellIndex==4 && cell!=null) {                        						
                        						stu.setSpassword(cell.toString());                       						
                        					}
                        					
                        					stuList.add(stu);                            				
                            			}
                            		}
                            	}
                            	//����ȡ������д�����ݿ�
                            	int stuIsExist=0;	
                        		int insertFai=0;
                        		int inserSuc=0;
                            	for(int i=0;i<stuList.size();i++) {
                            		String sno,sname,sgender,phone,pwd;
                            		int class_id;
                            		sno=stuList.get(i).getSno();
                            		sname=stuList.get(i).getSname();
                            		sgender=stuList.get(i).getSgender();
                            		phone=stuList.get(i).getSphone();
                            		pwd=stuList.get(i).getSpassword();
                            		
                            		
                            		//�Ȳ�ѯ�ļ�¼�Ƿ���ڣ���������������ݿ�
                            		boolean bl=db.checkTrue("select id from students where sno='"+sno+"'");
                    				if(bl){
                    					
                    					int bls=db.executeUpdate("update students set sname='"+sname+"',sgender='"+sgender+"',classinfo_id="+classid+",sphone='"+phone+"',spassword='"+pwd+"' where sno="+sno);             							
                    				}else{
                    					int bls=db.executeUpdate("insert into students(sno,sname,sgender,classinfo_id,sphone,spassword) values('"+sno+"','"+sname+"','"+sgender+"',"+classid+",'"+phone+"','"+pwd+"')");
                    					if(bls>0){
                    						insertFai=1;
                    					}else{
                    						inserSuc=1;
                    					}
                    				}                    				                    				
                            	}
                            	if(stuIsExist==1) {
                					System.out.println("�������Ѵ���");
                				}else
                				if(insertFai==1) {
                					System.out.println("�����ݲ���ʧ��");
                				}else {
                					System.out.println("ȫ�������Ѹ��������ݿ�");
                				}
                            }else {
                            	System.out.println("�Ҳ���ָ���ļ�");
                            }
                        }catch(Exception e) {
                        	e.printStackTrace();
                        }
                        
                         json.put("msg", "1");
                         
                     }	
                     else {
                    	 System.out.println("����fieldName");
                     }
             }
             }
         } catch (Exception ex) {
         	json.put("msg", "������Ϣ:"+ex.getMessage());
                  	   
         }       
         PrintWriter out=response.getWriter();
 		out.print(json.toString());
 		System.out.print("YYY");   
 		out.flush();
 		out.close(); 
     }
}
