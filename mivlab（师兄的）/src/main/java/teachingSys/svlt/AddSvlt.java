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

import teachingSys.utils.Dbhelper;
import net.sf.json.JSONObject;
/**
 * Servlet implementation class AddSvlt
 */
@WebServlet("/AddSvlt")
public class AddSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public AddSvlt() {
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
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Object userid=session.getAttribute("userid");
		//����json����
		JSONObject json=new JSONObject();
		if(userid==null){
			PrintWriter out=response.getWriter();
			out.print("�����µ�¼");
			out.flush();
			out.close();
			return;
		}else{
			//�������ݿ��������
			DbConn db=Dbhelper.getDb();
			//��ȡ������ʶ
			String tbname=request.getParameter("tbname");
			if("admin".equals(tbname)){
				String uname=request.getParameter("uname");
				String upassword=request.getParameter("upassword");
				boolean bl=db.checkTrue("select id from admin where uname='"+uname+"'");
				if(bl){
					json.put("msg", "�˺��Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into admin(uname,upassword) values('"+uname+"','"+upassword+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("classinfo".equals(tbname)){
				String classno=request.getParameter("classno");
				String classname=request.getParameter("classname");
				boolean bl=db.checkTrue("select id from classinfo where classno='"+classno+"'");
				if(bl){
					json.put("msg", "�༶����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into classinfo(classno,classname) values('"+classno+"','"+classname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("course".equals(tbname)){
				String cno=request.getParameter("cno");
				String cname=request.getParameter("cname");
				boolean bl=db.checkTrue("select id from course where cno='"+cno+"'");
				if(bl){
					json.put("msg", "�γ̱���Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into course(cno,cname) values('"+cno+"','"+cname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("courseplan".equals(tbname)){
				String terms_id=request.getParameter("terms_id");
				String classinfo_id=request.getParameter("classinfo_id");
				String course_id=request.getParameter("course_id");
				String teacher_id=request.getParameter("teacher_id");
				boolean bl=db.checkTrue("select id from courseplan where terms_id="+terms_id+" and classinfo_id="+classinfo_id+" and course_id="+course_id);
				if(bl){
					json.put("msg", "�γ̰����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into courseplan(terms_id,classinfo_id,course_id,teacher_id) values("+terms_id+","+classinfo_id+","+course_id+","+teacher_id+")");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("otitle".equals(tbname)){
				String otname=request.getParameter("otname");
				boolean bl=db.checkTrue("select id from otitle where otname='"+otname+"'");
				if(bl){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into otitle(otname) values('"+otname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("score".equals(tbname)){
				String terms_id=request.getParameter("terms_id");
				String course_id=request.getParameter("course_id");
				String classinfo_id=request.getParameter("classinfo_id");
				String students_id=request.getParameter("students_id");
				Object courseplan_id=db.getOnlyOne("select id from courseplan where terms_id="+terms_id+" and teacher_id="+userid+" and course_id="+course_id+" and classinfo_id="+classinfo_id);
				String sval=request.getParameter("sval");
				if(courseplan_id==null){
					json.put("msg", "�ɼ���Ϣ��������");
				}else{
					boolean bl=db.checkTrue("select id from score where courseplan_id="+courseplan_id+" and students_id="+students_id);
					if(bl){
						json.put("msg", "�ɼ��Ѵ���");
					}else{
						int bls=db.executeUpdate("insert into score(courseplan_id,students_id,sval) values("+courseplan_id+","+students_id+","+sval+")");
						if(bls>0){
							json.put("msg", "��ӳɹ�");
						}else{
							json.put("msg", "���ʧ��");
						}
					}
				}
			}
			if("students".equals(tbname)){
				String sno=request.getParameter("sno");
				String sname=request.getParameter("sname");
				String sgender=request.getParameter("sgender");
				String classinfo_id=request.getParameter("classinfo_id");
				String sphone=request.getParameter("sphone");
				String spassword=request.getParameter("spassword");
				boolean bl=db.checkTrue("select id from students where sno='"+sno+"'");
				if(bl){
					json.put("msg", "ѧ���Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into students(sno,sname,sgender,classinfo_id,sphone,spassword) values('"+sno+"','"+sname+"','"+sgender+"',"+classinfo_id+",'"+sphone+"','"+spassword+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("stuword".equals(tbname)){
				String zyinfo_id=request.getParameter("zyinfo_id");
				String students_id=request.getParameter("students_id");
				String stuzyword=request.getParameter("stuzyword");
				boolean bl=db.checkTrue("select id from stuword where id=''");
				if(bl){
					json.put("msg", "��Ϣ�Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into stuword(zyinfo_id,students_id,stuzyword) values("+zyinfo_id+","+students_id+",'"+stuzyword+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("syinfo".equals(tbname)){
				String terms_id=request.getParameter("terms_id");
				String course_id=request.getParameter("course_id");
				String classinfo_id=request.getParameter("classinfo_id");
				Object courseplan_id=db.getOnlyOne("select id from courseplan where terms_id="+terms_id+" and teacher_id="+userid+" and course_id="+course_id+" and classinfo_id="+classinfo_id);
				String sytitle=request.getParameter("sytitle");
				String symark=request.getParameter("symark");
				if(courseplan_id==null){
					json.put("msg", "ʵ����Ϣ��������");
				}else{
					boolean bl=db.checkTrue("select id from syinfo where courseplan_id="+courseplan_id+" and sytitle='"+sytitle+"'");
					if(bl){
						json.put("msg", "ʵ���Ѵ���");
					}else{
						int bls=db.executeUpdate("insert into syinfo(courseplan_id,sytitle,symark) values("+courseplan_id+",'"+sytitle+"','"+symark+"')");
						if(bls>0){
							json.put("msg", "��ӳɹ�");
						}else{
							json.put("msg", "���ʧ��");
						}
					}
				}
			}
			if("teacher".equals(tbname)){
				String tno=request.getParameter("tno");
				String tname=request.getParameter("tname");
				String tgender=request.getParameter("tgender");
				String tphone=request.getParameter("tphone");
				String taddr=request.getParameter("taddr");
				String tpassword=request.getParameter("tpassword");
				boolean bl=db.checkTrue("select id from teacher where tno='"+tno+"'");
				if(bl){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into teacher(tno,tname,tgender,tphone,taddr,tpassword) values('"+tno+"','"+tname+"','"+tgender+"','"+tphone+"','"+taddr+"','"+tpassword+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("terms".equals(tbname)){
				String termno=request.getParameter("termno");
				String termname=request.getParameter("termname");
				boolean bl=db.checkTrue("select id from terms where termno='"+termno+"'");
				if(bl){
					json.put("msg", "ѧ�ڱ���Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into terms(termno,termname) values('"+termno+"','"+termname+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("ttitle".equals(tbname)){
				String ttname=request.getParameter("ttname");
				String ttmark=request.getParameter("ttmark");
				String otitle_id=request.getParameter("otitle_id");
				boolean bl=db.checkTrue("select id from ttitle where ttname='"+ttname+"'");
				if(bl){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into ttitle(ttname,ttmark,otitle_id) values('"+ttname+"','"+ttmark+"',"+otitle_id+")");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
			if("zyinfo".equals(tbname)){
				String syinfo_id=request.getParameter("syinfo_id");
				String zytitle=request.getParameter("zytitle");
				String zyword=request.getParameter("zyword");
				boolean bl=db.checkTrue("select id from zyinfo where id=''");
				if(bl){
					json.put("msg", "��Ϣ�Ѵ���");
				}else{
					int bls=db.executeUpdate("insert into zyinfo(syinfo_id,zytitle,zyword) values("+syinfo_id+",'"+zytitle+"','"+zyword+"')");
					if(bls>0){
						json.put("msg", "��ӳɹ�");
					}else{
						json.put("msg", "���ʧ��");
					}
				}
			}
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
