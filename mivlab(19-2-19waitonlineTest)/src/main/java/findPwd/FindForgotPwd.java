package findPwd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

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
 * Servlet implementation class FindForgotPwd
 */
@WebServlet("/FindForgotPwd")
public class FindForgotPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindForgotPwd() {
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
				System.out.println("ִ��FindForgotPwd"); 
				
		       
		        //��ȡ�����еļ����ַ���  
		        String sid=request.getParameter("sid");
		        System.out.println("sid=."+sid); 
		        //��ȡ�����е��û���  
		        String id=request.getParameter("id");
		       //��ȡ����
		        String tbname=request.getParameter("tb");
		        //��ȡ����
		        String email=request.getParameter("em");
		        if(sid.equals(null) ||id.equals(null)){  
		            System.out.println("��������Ӳ���ȷ,�����²���.");  
		              
		            json.put("msg", "��������Ӳ���ȷ,�����²���.");
		        }
		        
		        //�ж��Ƿ�������û�����ȡ������û���������Ϣ
		        
		        //�������ݿ��������
				DbConn db=Dbhelper.getDb(); 
				
				
				if("adminInfo2".equals(tbname)) {
					user user=new user();
					List<user> list=GetList.getlist(user.class, db.executeQuery("select * from admin where id='"+id+"'"));
					if(list.size()>0) {
						user=list.get(0);
						System.out.println("��������û�");
					}
			        if(user!=null){  
			            //��ȡ��ǰ�û������һ�����Ĺ���ʱ��  
			            //�һ����������Ѿ�����  
			        	 System.out.println("System.currentTimeMillis()="+System.currentTimeMillis()); 
			        	 Date outDate = new Date(System.currentTimeMillis());
			        	 long date = outDate.getTime() / 1000 * 1000;
			            if(Long.parseLong(user.getOutDate())<=date){  
			                System.out.println("�����Ѿ�����"); 
			                json.put("msg", "�����Ѿ�����");
			                
			            }  
			            //��ȡ��ǰ��½�˵ļ�����  
			            String key = user.getId()+"$"+user.getOutDate()+"$"+user.getValidataCode();//����ǩ��  
			            System.out.println("getUsernumber="+user.getId());  
			            System.out.println("stu.getOutDate()="+user.getOutDate()); 
			            System.out.println("stu.getValidataCode()="+user.getValidataCode());  
			            
			            String digitalSignature = MD5Util.MD5(key);// ����ǩ��  
			            System.out.println("digitalSignature=."+digitalSignature);    
			            if(!digitalSignature.equals(sid)){  
			                System.out.println("���Ӽ������벻��ȷ");  
			                 
			                json.put("msg", "���Ӽ������벻��ȷ");
			            }else{  
			            	
			                //��֤�ɹ�,���뵽�޸��������  
			                request.setAttribute("num", user.getId());
			                request.setAttribute("id", user.getId());
			                request.setAttribute("tbname", tbname);
			                request.setAttribute("name", user.getName());
			                request.setAttribute("email", email);
			                System.out.println("num="+ user.getId()); 
			                
			                request.getRequestDispatcher("./ResetPwd.jsp").forward(request,response);    
			                System.out.println("��ִ����ת"); 
			            }  
			        }else{  
			            System.out.println("�û���Ϣ������"); 
			            json.put("msg", "�û���Ϣ������");
			            
			        	} 			              
			        }
				if("students2".equals(tbname)) {
					Students user=new Students();
					List<Students> list=GetList.getlist(Students.class, db.executeQuery("select * from students where id='"+id+"'"));
					if(list.size()>0) {
						user=list.get(0);
						System.out.println("��������û�");
					}
			        if(user!=null){  
			            //��ȡ��ǰ�û������һ�����Ĺ���ʱ��  
			            //�һ����������Ѿ�����  
			        	 System.out.println("System.currentTimeMillis()="+System.currentTimeMillis()); 
			        	 Date outDate = new Date(System.currentTimeMillis());
			        	 long date = outDate.getTime() / 1000 * 1000;
			            if(Long.parseLong(user.getOutDate())<=date){  
			                System.out.println("�����Ѿ�����"); 
			                json.put("msg", "�����Ѿ�����");
			                
			            }  
			            //��ȡ��ǰ��½�˵ļ�����  
			            String key = user.getSno()+"$"+user.getOutDate()+"$"+user.getValidataCode();//����ǩ��  
			            System.out.println("getUsernumber="+user.getId());  
			            System.out.println("stu.getOutDate()="+user.getOutDate()); 
			            System.out.println("stu.getValidataCode()="+user.getValidataCode());  
			            
			            String digitalSignature = MD5Util.MD5(key);// ����ǩ��  
			            System.out.println("digitalSignature=."+digitalSignature);    
			            if(!digitalSignature.equals(sid)){  
			                System.out.println("���Ӽ������벻��ȷ");  
			                 
			                json.put("msg", "���Ӽ������벻��ȷ");
			            }else{  
			            	
			                //��֤�ɹ�,���뵽�޸��������  
			                request.setAttribute("num", user.getSno());
			                request.setAttribute("id", user.getId());
			                request.setAttribute("tbname", tbname);
			                request.setAttribute("name", user.getSname());
			                request.setAttribute("email", email);
			                System.out.println("num="+ user.getId()); 
			                
			                request.getRequestDispatcher("./ResetPwd.jsp").forward(request,response);    
			                System.out.println("��ִ����ת"); 
			            }  
			        }else{  
			            System.out.println("�û���Ϣ������"); 
			            json.put("msg", "�û���Ϣ������");
			            
			        	} 			              
			        }
				if("teacher2".equals(tbname)) {
					Teacher user=new Teacher();
					List<Teacher> list=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id='"+id+"'"));
					if(list.size()>0) {
						user=list.get(0);
						System.out.println("��������û�");
					}
			        if(user!=null){  
			            //��ȡ��ǰ�û������һ�����Ĺ���ʱ��  
			            //�һ����������Ѿ�����  
			        	 System.out.println("System.currentTimeMillis()="+System.currentTimeMillis()); 
			        	 Date outDate = new Date(System.currentTimeMillis());
			        	 long date = outDate.getTime() / 1000 * 1000;
			            if(Long.parseLong(user.getOutDate())<=date){  
			                System.out.println("�����Ѿ�����"); 
			                json.put("msg", "�����Ѿ�����");
			                
			            }  
			            //��ȡ��ǰ��½�˵ļ�����  
			            String key = user.gettNo()+"$"+user.getOutDate()+"$"+user.getValidataCode();//����ǩ��  
			            System.out.println("getUsernumber="+user.getId());  
			            System.out.println("stu.getOutDate()="+user.getOutDate()); 
			            System.out.println("stu.getValidataCode()="+user.getValidataCode());  
			            
			            String digitalSignature = MD5Util.MD5(key);// ����ǩ��  
			            System.out.println("digitalSignature=."+digitalSignature);    
			            if(!digitalSignature.equals(sid)){  
			                System.out.println("���Ӽ������벻��ȷ");  
			                 
			                json.put("msg", "���Ӽ������벻��ȷ");
			            }else{  
			            	
			                //��֤�ɹ�,���뵽�޸��������  
			                request.setAttribute("num", user.gettNo());
			                request.setAttribute("id", user.getId());
			                request.setAttribute("tbname", tbname);
			                request.setAttribute("name", user.gettName());
			                request.setAttribute("email", email);
			                System.out.println("num="+ user.getId()); 
			                
			                request.getRequestDispatcher("./ResetPwd.jsp").forward(request,response);  
			                System.out.println("��ִ����ת"); 
			            }  
			        }else{  
			            System.out.println("�û���Ϣ������"); 
			            json.put("msg", "�û���Ϣ������");
			            
			        	} 			              
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

		}
