package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import net.sf.json.JSONObject;
import bean.Students;
import bean.TeaTask;
import bean.Teacher;
import bean.indexContent;
import bean.user;
import utils.Dbhelper;

/**
 * Servlet implementation class loginSvlt
 */
@WebServlet("/LoginSvlt")
public class LoginSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		//���ô������ݱ��뷽ʽ
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html");
				//��ȡsession����
				HttpSession session=request.getSession();
				//��ȡ�û���¼��Ϣ
				String uname=request.getParameter("username");
				String upassword=request.getParameter("password");
				String utype=request.getParameter("userType");
				//System.out.print("uname="+uname+";pwd="+upassword+";type="+utype);
				//����json����
				JSONObject json=new JSONObject();
				//�������ݿ��������
				DbConn db=Dbhelper.getDb();
				//�������ݿ�������
				String cksql="";
				//�ж��û����ȷ���������
				if("admin".equals(utype)){
					cksql="select name from admin where name='"+uname+"' and password='"+upassword+"'";
				}
				if("stu".equals(utype)){
					cksql="select id from students where sno='"+uname+"' and spassword='"+upassword+"'";
				}
				if("tea".equals(utype)){
					cksql="select id from teacher where tNo='"+uname+"' and tPwd='"+upassword+"'";
				}				
				
				if("".equals(cksql)){
					json.put("msg", "ϵͳ����");
				}else{
					//�ж��û����������Ƿ���ȷ
					if(db.checkTrue(cksql)){
						json.put("msg", 1);
						//��ȡ��¼�û�id
						Object id=db.getOnlyOne(cksql);
						System.out.print("id="+id);
						//���û���¼��Ϣд�뵽session����
						session.setAttribute("userid", id);
						session.setAttribute("utype", utype);
						if("admin".equals(utype)){
							user ad=new user();
							List<user> alist=GetList.getlist(user.class, db.executeQuery("select * from admin where name='"+id+"'"));
							if(alist.size()>0){
								ad=alist.get(0);								
							}							
							session.setAttribute("userinfo", ad);
						}
						if("stu".equals(utype)){
							Students ad=new Students();
							List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select students.*,classno,classname from students,classinfo where classinfo_id=classinfo.id and students.id="+id));
							if(alist.size()>0){
								ad=alist.get(0);
							}
							session.setAttribute("userinfo", ad);
							//�����������
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
					        //System.out.println(df.format(new Date()));// new Date()Ϊ��ȡ��ǰϵͳʱ��

							String nowtime=df.format(new Date());
							
							List<TeaTask> TaskTip=GetList.getlist(TeaTask.class, db.executeQuery("select teatask.*,termname,classname,cname,tName from courseplan,teaTask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and deadline > '"+nowtime+"' and classinfo.id in (select classinfo_id from students where id="+id+") group by id order by id desc"));
							System.out.println("��ֹ������ʾ="+TaskTip.size());
							session.setAttribute("TaskTipSize", TaskTip.size());
						}
						if("tea".equals(utype)){
							Teacher ad=new Teacher();
							List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
							if(alist.size()>0){
								ad=alist.get(0);
							}
							session.setAttribute("userinfo", ad);
						}
							//��ȡ���⼰��ע����Ϣ
							List<indexContent> other=GetList.getlist(indexContent.class, db.executeQuery("select * from indexShow where id=1"));
							//��������
							indexContent a=new indexContent();
							//ȡ��ѯ���������
							if(other.size()>0){
								a=other.get(0);
							}
							//����Ϣд��session
							session.setAttribute("other", a);						
						
					}else{
						json.put("msg", "�˺Ż��������");
					}
				}
				PrintWriter out=response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
	}

}
