package findPwd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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

import net.sf.json.JSONObject;
import utils.Dbhelper;
import utils.MD5Util;

/**
 * Servlet implementation class ChangeEmailSvlt
 */
@WebServlet("/ChangeEmailSvlt")
public class ChangeEmailSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeEmailSvlt() {
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
				 try {  
					 
						String email=request.getParameter("email");  //�ռ��˵�email
						String utype=request.getParameter("tbname");//��ȡ�û����Ͷ�Ӧ�ı���
						String id=request.getParameter("id");		//id
						String name=request.getParameter("name");   //Num
						System.out.println("name="+name);
						System.out.println("id="+id);
					 	//��������
					 	String path=request.getContextPath();  		      
					 	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
					 	
					 	
					 	//��������
					 	 
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
				        Session session = Session.getInstance(prop,
								new Authenticator(){
								@Override
								protected PasswordAuthentication getPasswordAuthentication() {
									//���ط������˺���������Ϣ
									return new PasswordAuthentication("1370763849@qq.com","gjdavgrjavugbadh");//�û����Ϳ���
								}
							}
						);
							
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
				        if("admin".equals(utype)) {
				        	String tbname="adminEmail";
				        	 content=createLink( id,name,utype, tbname,email, basePath);
				        }
				        if("students".equals(utype)) {
				        	String tbname="stuEmail";
				        	 content=createLink( id,name,utype, tbname,email, basePath);
				        }
				        if("teacher".equals(utype)) {
				        	String tbname="teaEmail";
				        	 content=createLink( id,name,utype, tbname,email, basePath);
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
				      
				    
				      
				    String resetPassHref = basePath + "/ChangeEmailSvlt2?sid="+ digitalSignature+"&tb="+tbname+"&em="+email +"&id="+id;  
				      
				    String emailContent = "����ظ����ʼ�.������������,��������,���ʼ�����30����,���ӽ���ʧЧ����Ҫ����������������." + resetPassHref;  
				      
				    return emailContent;
				}else{
					
					return "error";
				}
			      
			}
			
			

		}
