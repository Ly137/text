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
import com.wm.utils.HandlePage;

import bean.Snav;
import bean.navList;
import net.sf.json.JSONObject;
import bean.Course;
import bean.CoursePlan;
import bean.GitDate;
import bean.Students;
import bean.Stutask;
import bean.TeaTask;
import bean.Classinfo;
import bean.Terms;
import bean.Teacher;
import utils.Dbhelper;

/**
 * Servlet implementation class getDataSvlt
 */
@WebServlet("/GetDataSvlt")
public class GetDataSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDataSvlt() {
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
		//设置传输数据编码方式
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//创建json对象
		JSONObject json=new JSONObject();
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		String id=request.getParameter("id");
		//获取操作标识
		String tbname=request.getParameter("tbname");
		//获取session对象
		HttpSession session=request.getSession();
		if("fnav".equals(tbname)){		//一级导航栏
			//查询数据库获取想要的信息
			List<navList> alist=GetList.getlist(navList.class, db.executeQuery("select * from fnav where id="+id));
			//创建对象
			navList a=new navList();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		if("snav".equals(tbname)){		//二级导航栏--更新使用数据
			//查询数据库获取想要的信息
			List<Snav> alist=GetList.getlist(Snav.class, db.executeQuery("select * from snav where id="+id));
			//创建对象
			Snav a=new Snav();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			request.setAttribute("ob", a);			
			String remark=a.getRemark();
			List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
			request.setAttribute("otitlelist", otitlelist);
			request.getRequestDispatcher("/admin/s_navUpdate.jsp?remark="+remark).forward(request, response);
			return ;
		}
		if("snav_add".equals(tbname)){		//二级导航栏--更新使用数据
			List<navList> otitlelist=GetList.getlist(navList.class, db.executeQuery("select * from fnav"));
			request.setAttribute("otitlelist", otitlelist);
			request.getRequestDispatcher("/admin/s_navAdd.jsp?").forward(request, response);
			return ;
		}
		if("teacher".equals(tbname)){		//教师信息
			//查询数据库获取想要的信息
			List<Teacher> alist=GetList.getlist(Teacher.class, db.executeQuery("select * from teacher where id="+id));
			//创建对象
			Teacher a=new Teacher();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		if("terms".equals(tbname)){	//学期信息
			//查询数据库获取想要的信息
			List<Terms> alist=GetList.getlist(Terms.class, db.executeQuery("select * from terms where id="+id));
			//创建对象
			Terms a=new Terms();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		if("classinfo".equals(tbname)){	//班级信息
			//查询数据库获取想要的信息
			List<Classinfo> alist=GetList.getlist(Classinfo.class, db.executeQuery("select * from classinfo where id="+id));
			//创建对象
			Classinfo a=new Classinfo();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		if("students".equals(tbname)){	//学生信息
			//查询数据库获取想要的信息
			List<Students> alist=GetList.getlist(Students.class, db.executeQuery("select * from students where id="+id ));
			//创建对象
			Students a=new Students();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		if("course".equals(tbname)){	//课程信息
			//查询数据库获取想要的信息
			List<Course> alist=GetList.getlist(Course.class, db.executeQuery("select * from course where id="+id));
			//创建对象
			Course a=new Course();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		if("courseplan".equals(tbname)){	//课程安排
			//查询数据库获取想要的信息
			List<CoursePlan> alist=GetList.getlist(CoursePlan.class, db.executeQuery("select * from courseplan where id="+id));
			//创建对象
			CoursePlan a=new CoursePlan();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//把信息写入json
			json.put("ob", a);
		}
		
		/*
		 * 教师功能操作
		 */
		if("teacourse".equals(tbname)){	//教师获取教师发布实验的课程信息
			
			//获取当前登录用户信息
			Object userid=session.getAttribute("userid");
			int planid=Integer.parseInt(request.getParameter("planid"));
			session.setAttribute("sql", "select termname,classno,classname,cno,cname,tNo,tName,sex, courseplan.* from terms,classinfo,course,teacher, courseplan where 1=1  and terms.id=terms_id and classinfo.id=classinfo_id and course.id=course_id and teacher.id=courseplan.teacher_id and teacher.id="+userid+" and courseplan.id="+planid);
			
			//查询结果集转化成链表
			List<CoursePlan> alist=GetList.getlist(CoursePlan.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
			//创建对象
			CoursePlan a=new CoursePlan();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//查询结果传到前台
			request.setAttribute("a", a);
			
			request.getRequestDispatcher("/teacher/releaseTask.jsp").forward(request, response);
			return;
		}
		
		if("TteaTask".equals(tbname)){	//获取教师发布实验的信息
			
			//获取当前登录用户信息
			Object userid=session.getAttribute("userid");
			int taskid=Integer.parseInt(request.getParameter("id"));
			session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teaTask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id="+taskid+" group by id");
			
			//查询结果集转化成链表
			List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
			//创建对象
			TeaTask a=new TeaTask();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//查询结果传到前台
			request.setAttribute("a", a);
			
			request.getRequestDispatcher("/teacher/Taskinfo.jsp").forward(request, response);
			return;
		}
		
		if("Tscore".equals(tbname)){	//获取学生提交的实验信息
			
			//获取当前登录用户信息
			Object userid=session.getAttribute("userid");
			int taskid=Integer.parseInt(request.getParameter("id"));
			session.setAttribute("sql", "select teatask.title,teatask.remark,teatask.time,teatask.deadline,stutask.*,termname,classname,cname,tName from stutask,courseplan,teaTask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id=teatask_id and stutask.id="+taskid+" and classinfo.id in (select classinfo_id from students where id="+userid+") group by id");
			
			//查询结果集转化成链表
			List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
			//创建对象
			Stutask a=new Stutask();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//查询结果传到前台
			request.setAttribute("a", a);
			
			request.getRequestDispatcher("/teacher/TaskHistoryinfo.jsp").forward(request, response);
			return;
		}
		if("tGitDate".equals(tbname)){	//获取新导入的GitHub实验信息
			
			//获取当前登录用户信息
			Object userid=session.getAttribute("userid");
			String org=request.getParameter("org");
			String proj=request.getParameter("proj");
			
			String tablename="reposdate";   
			session.setAttribute("sql", "select "+tablename+".*,students.sname, terms.termname,course.cname from "+tablename+",students,course,terms where  students.sno=Num and course_id=course.id and "+tablename+".terms_id=terms.id and org='"+org+"' and proj='"+proj+"'");
			
			//查询结果集转化成链表
			List<GitDate> alist=GetList.getlist(GitDate.class, HandlePage.Sy(db, "100", session,"sql","mysql"));
			System.out.print("size="+alist.size());
			//查询结果传到前台
			request.setAttribute("alist", alist);
			List<Terms> termslist=GetList.getlist(Terms.class, db.executeQuery("select * from terms"));
			request.setAttribute("termslist", termslist);
			
			List<Course> courselist=GetList.getlist(Course.class, db.executeQuery("select * from course"));
			request.setAttribute("courselist", courselist);
			request.getRequestDispatcher("/teacher/GitDate.jsp").forward(request, response);
			return;
		}
		
		
		/**
		 * 
		 * 学生功能相关操作
		 */
			if("teaTask".equals(tbname)){	//学生获取教师发布实验的信息
			
			//获取当前登录用户信息
			Object userid=session.getAttribute("userid");
			int taskid=Integer.parseInt(request.getParameter("id"));
			session.setAttribute("sql", "select teatask.*,termname,classname,cname,tName from courseplan,teaTask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id="+taskid+" and classinfo.id in (select classinfo_id from students where id="+userid+") group by id");
			
			//查询结果集转化成链表
			List<TeaTask> alist=GetList.getlist(TeaTask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
			//创建对象
			TeaTask a=new TeaTask();
			//取查询结果给对象
			if(alist.size()>0){
				a=alist.get(0);
			}
			//查询结果传到前台
			request.setAttribute("a", a);
			
			request.getRequestDispatcher("/student/Taskinfo.jsp").forward(request, response);
			return;
		}
			
			if("stuTask".equals(tbname)){	//学生获取自己的实验提交记录
				
				//获取当前登录用户信息
				Object userid=session.getAttribute("userid");
				int taskid=Integer.parseInt(request.getParameter("id"));
				session.setAttribute("sql", "select teatask.title,teatask.remark,teatask.time,teatask.deadline,stutask.*,termname,classname,cname,tName from stutask,courseplan,teaTask,classinfo,course,teacher,terms where classinfo.id=teatask.classinfo_id and teatask.terms_id=terms.id and teatask.teacher_id=teacher.id and  course.id=teatask.course_id and teatask.id=teatask_id and stutask.id="+taskid+" and classinfo.id in (select classinfo_id from students where id="+userid+") group by id");
				
				//查询结果集转化成链表
				List<Stutask> alist=GetList.getlist(Stutask.class, HandlePage.Sy(db, "10", session,"sql","mysql"));
				//创建对象
				Stutask a=new Stutask();
				//取查询结果给对象
				if(alist.size()>0){
					a=alist.get(0);
				}
				//查询结果传到前台
				request.setAttribute("a", a);
				
				request.getRequestDispatcher("/student/TaskHistoryinfo.jsp").forward(request, response);
				return;
			}
			
			
		PrintWriter out=response.getWriter();
		out.print(json.toString());
		out.flush();
		out.close();
	}

}
