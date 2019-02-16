package findPwd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.Students;
import bean.Teacher;

import bean.user;
import net.sf.json.JSONObject;
import utils.Dbhelper;
import utils.MD5Util;

/**
 * Servlet implementation class FindPwdByEmailSvlt
 */
@WebServlet("/FindPwdByEmailSvlt")
public class FindPwdByEmailSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdByEmailSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//���ô������ݱ��뷽ʽ
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html");
				//����json����
				JSONObject json=new JSONObject();
				//�������ݿ��������
			  	DbConn db=Dbhelper.getDb();
			  	System.out.println("ִ��FindPwdByEmailSvlt");
				 try {  
					 
						String email=request.getParameter("email");  //�ռ��˵�email
						String utype=request.getParameter("utype");//��ȡ�û�����
						
						String num=request.getParameter("num");   //Num
					
					 	//��������
					 	String path=request.getContextPath();  		      
					 	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
					 	
					 	
					 	//��������
				        System.out.println("email="+email+",utype="+utype+",num="+num); 
				        Properties prop = new Properties();  
				        prop.setProperty("mail.transport.protocol", "smtp");  
				        prop.put("mail.smtp.port","465"); 
				        prop.setProperty("mail.smtp.host", "smtp.qq.com");
				        prop.setProperty("mail.smtp.auth", "true");
				        prop.setProperty("mail.smtp.ssl.enable","true");
				        //���ز����õķ�������˿ں�
				        //prop.setProperty("mail.smtp.host", "smtp.qq.com");
				        //prop.put("mail.smtp.port","25");  
				        //prop.setProperty("mail.debug", "true");  
				        System.out.println("������������");
				        Session session = Session.getInstance(prop,
								new Authenticator(){
								@Override
								protected PasswordAuthentication getPasswordAuthentication() {
									//���ط������˺���������Ϣ
									return new PasswordAuthentication("1370763849@qq.com","xxx");
								}
							}
						);
				        System.out.println("׼�������ʼ�");	
				        //��д�ŷ�д��  
				        Message msg = new MimeMessage(session);  
				        //���÷��ʼ���ԭ��ַ  
				        msg.setFrom(new InternetAddress("1370763849@qq.com"));  
				        //���ý�����  
				        msg.setRecipient(RecipientType.TO, new InternetAddress(email));
				        //����
				        msg.setSubject("�һ�����!");  
				        //����
				        String content="error,�����²���";
				        //�ж���ʲô���͵��û�
				        //1.admin
				        System.out.println("ִ���ж��û�����");
				        if("admin".equals(utype)) {
				        	List<user> other=GetList.getlist(user.class, db.executeQuery("select * from admin where id="+num));
							//��������
				        	user u=new user();
							//ȡ��ѯ���������
							if(other.size()>0){
								u=other.get(0);
							}
							if(u.getEmail().equals(email)) {
								String tbname="adminInfo2";
					        	 content=createLink( String.valueOf(u.getId()),String.valueOf(u.getId()),"admin",tbname,email, basePath);
							}
				        	
				        }
				        if("stu".equals(utype)) {
				        	List<Students> other=GetList.getlist(Students.class, db.executeQuery("select * from students where sno="+num));
							//��������
				        	Students u=new Students();
							//ȡ��ѯ���������
							if(other.size()>0){
								u=other.get(0);
							}
							if(u.getEmail().equals(email)) {
								String tbname="students2";
					        	 content=createLink( String.valueOf(u.getId()),u.getSno(),"students",tbname,email, basePath);
							}
				        }
				        if("tea".equals(utype)) {
				        	List<Teacher> other=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where tNo="+num));
							//��������
				        	Teacher u=new Teacher();
							//ȡ��ѯ���������
							if(other.size()>0){
								u=other.get(0);
							}
							if(u.getEmail().equals(email)) {
								String tbname="teacher2";
					        	 content=createLink( String.valueOf(u.getId()),u.gettNo(),"teacher",tbname,email, basePath);
							}
				        }
				        
				        msg.setContent("<font color=\"red\">"+content+"</font>", "text/html;charset=gbk");
		 		       		        
				        System.out.println("�ʼ���ʼ���ͣ�");
				        
						Transport.send(msg);
				     
						System.out.println("�ʼ����ͳɹ���");
						json.put("msg", 1);  
				             
				       }catch(Exception e){  
				        e.printStackTrace();
				        json.put("msg", "����ʧ��");
				       } 
				PrintWriter out=response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
			}

			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
			}
			public String createLink(String id,String name,String utype,String tbname,String email, String basePath){  
			      
			    //������Կ  
			    String secretKey=UUID.randomUUID().toString();  
			    //���ù���ʱ��  
			    Date outDate = new Date(System.currentTimeMillis() + 30 * 60 * 1000);// 30���Ӻ����  
			    System.out.println("System.currentTimeMillis()="+System.currentTimeMillis());  
			    long date = outDate.getTime() / 1000 * 1000;// ���Ժ�����  mySql ȡ��ʱ���Ǻ��Ժ�������  
			    System.out.println("date="+date);
			    String date2=String.valueOf(date);
			    System.out.println("date2="+date2);
			    //�˴�Ӧ�ø���StuinfoTest���еĹ���ʱ�䡢��Կ��Ϣ  
			    
			  //�������ݿ��������
			  	DbConn db=Dbhelper.getDb();
			    int bls=db.executeUpdate("update "+utype+" set outDate='"+date2+"',validataCode='"+secretKey+"' where id='"+id+"'");
				System.out.print(bls);
				if(bls==1){
					System.out.println("�û���Ϣ�޸ĳɹ�");
					//���û���������ʱ�䡢��Կ����������Կ  
				    String key =name + "$" + date2 + "$" + secretKey;  
				    System.out.println("getUsernumber="+name);  
		            System.out.println("date2="+date2); 
		            System.out.println("secretKey="+secretKey);    
				    String digitalSignature = MD5Util.MD5(key);// ����ǩ��  
				      
				    
				      
				    String resetPassHref = basePath + "/FindForgotPwd?sid="+ digitalSignature+"&tb="+tbname+"&em="+email +"&id="+id;  
				      
				    String emailContent = "����ظ����ʼ�.������������,��������,���ʼ�����30����,���ӽ���ʧЧ����Ҫ���������һ�����." + resetPassHref;  
				      
				    return emailContent;
				}else{
					
					return "error";
				}
			      
			}
			
			

		}
