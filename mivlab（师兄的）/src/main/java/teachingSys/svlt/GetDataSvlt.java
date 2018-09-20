package teachingSys.svlt;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;

import java.util.List;

import com.wm.utils.GetList;

import teachingSys.been.Admin;
import teachingSys.been.Classinfo;
import teachingSys.been.Course;
import teachingSys.been.Courseplan;
import teachingSys.been.Otitle;
import teachingSys.been.Score;
import teachingSys.been.Students;
import teachingSys.been.Stuword;
import teachingSys.been.Syinfo;
import teachingSys.been.Teacher;
import teachingSys.been.Terms;
import teachingSys.been.Ttitle;
import teachingSys.been.Zyinfo;
import teachingSys.utils.Dbhelper;
/**
 * Servlet implementation class GetDataSvlt
 */
@WebServlet("/GetDataSvlt")
public class GetDataSvlt extends HttpServlet {
	public GetDataSvlt() {
		super();
	}
	/**
	* Destruction of the servlet. <br>
	*/
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	/**
	* The doGet method of the servlet. <br>
	*
	* This method is called when a form has its tag value method equals to get.
	* 
	* @param request the request send by the client to the server
	* @param response the response send by the server to the client
	* @throws ServletException if an error occurred
	* @throws IOException if an error occurred
	*/
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		this.doPost(request, response);
	}
	/**
	* The doPost method of the servlet. <br>
	*
	* This method is called when a form has its tag value method equals to post.
	* 
	* @param request the request send by the client to the server
	* @param response the response send by the server to the client
	* @throws ServletException if an error occurred
	* @throws IOException if an error occurred
	*/
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//���ô������ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//����json����
		JSONObject json=new JSONObject();
		//�������ݿ��������
		DbConn db=Dbhelper.getDb();
		String id=request.getParameter("id");
			//��ȡ������ʶ
			String tbname=request.getParameter("tbname");
			if("admin".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Admin> alist=GetList.getlist(Admin.class, db.executeQuery("select * from admin where id="+id));
			//��������
			Admin a=new Admin();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("classinfo".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Classinfo> alist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo where id="+id));
			//��������
			Classinfo a=new Classinfo();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("course".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Course> alist=GetList.getlist(Course.class, db.executeQuery("select * from course where id="+id));
			//��������
			Course a=new Course();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("courseplan".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Courseplan> alist=GetList.getlist(Courseplan.class, db.executeQuery("select * from courseplan where id="+id));
			//��������
			Courseplan a=new Courseplan();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("otitle".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Otitle> alist=GetList.getlist(Otitle.class, db.executeQuery("select * from otitle where id="+id));
			//��������
			Otitle a=new Otitle();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("score".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Score> alist=GetList.getlist(Score.class, db.executeQuery("select * from score where id="+id));
			//��������
			Score a=new Score();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("students".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select * from students where id="+id));
			//��������
			Students a=new Students();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("stuword".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Stuword> alist=GetList.getlist(Stuword.class, db.executeQuery("select * from stuword where id="+id));
			//��������
			Stuword a=new Stuword();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("syinfo".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Syinfo> alist=GetList.getlist(Syinfo.class, db.executeQuery("select syinfo.*,terms_id,classinfo_id,course_id,teacher_id from syinfo,courseplan where courseplan.id=courseplan_id and syinfo.id="+id));
			//��������
			Syinfo a=new Syinfo();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("teacher".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
			//��������
			Teacher a=new Teacher();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("terms".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Terms> alist=GetList.getlist(Terms.class, db.executeQuery("select * from terms where id="+id));
			//��������
			Terms a=new Terms();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("ttitle".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Ttitle> alist=GetList.getlist(Ttitle.class, db.executeQuery("select * from ttitle where id="+id));
			//��������
			Ttitle a=new Ttitle();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
			if("zyinfo".equals(tbname)){
			//��ѯ���ݿ��ȡ��Ҫ����Ϣ
			List<Zyinfo> alist=GetList.getlist(Zyinfo.class, db.executeQuery("select zyinfo.*,terms_id,classinfo_id,teacher_id,course_id from zyinfo,courseplan,syinfo where syinfo_id=syinfo.id and courseplan.id=courseplan_id and zyinfo.id="+id));
			//��������
			Zyinfo a=new Zyinfo();
			//ȡ��ѯ���������
			if(alist.size()>0){
				a=alist.get(0);
			}
			//����Ϣд��json
			json.put("ob", a);
		}
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}
	/**
	* Initialization of the servlet. <br>
	*
	* @throws ServletException if an error occurs
	*/
	public void init() throws ServletException {
			// Put your code here
		}
	}
