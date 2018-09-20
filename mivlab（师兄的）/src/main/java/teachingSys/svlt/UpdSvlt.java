package teachingSys.svlt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;

import net.sf.json.JSONObject;
/**
 * Servlet implementation class UpdSvlt
 */
@WebServlet("/UpdSvlt")
public class UpdSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public UpdSvlt() {
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
				String id=request.getParameter("id");
				String uname=request.getParameter("uname");
				String upassword=request.getParameter("upassword");
				if(db.checkTrue("select id from admin where uname='"+uname+"' and id!="+id)){
					json.put("msg", "�˺��Ѵ���");
				}else{
					int bls=db.executeUpdate("update admin set uname='"+uname+"',upassword='"+upassword+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("classinfo".equals(tbname)){
				String id=request.getParameter("id");
				String classno=request.getParameter("classno");
				String classname=request.getParameter("classname");
				if(db.checkTrue("select id from classinfo where classno='"+classno+"' and id!="+id)){
					json.put("msg", "�༶����Ѵ���");
				}else{
					int bls=db.executeUpdate("update classinfo set classno='"+classno+"',classname='"+classname+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("course".equals(tbname)){
				String id=request.getParameter("id");
				String cno=request.getParameter("cno");
				String cname=request.getParameter("cname");
				if(db.checkTrue("select id from course where cno='"+cno+"' and id!="+id)){
					json.put("msg", "�γ̱���Ѵ���");
				}else{
					int bls=db.executeUpdate("update course set cno='"+cno+"',cname='"+cname+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("courseplan".equals(tbname)){
				String id=request.getParameter("id");
				String terms_id=request.getParameter("terms_id");
				String classinfo_id=request.getParameter("classinfo_id");
				String course_id=request.getParameter("course_id");
				String teacher_id=request.getParameter("teacher_id");
				if(db.checkTrue("select id from courseplan where terms_id="+terms_id+" and classinfo_id="+classinfo_id+" and course_id="+course_id+" and id!="+id)){
					json.put("msg", "�γ̰����Ѵ���");
				}else{
					int bls=db.executeUpdate("update courseplan set terms_id="+terms_id+",classinfo_id="+classinfo_id+",course_id="+course_id+",teacher_id="+teacher_id+" where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("otitle".equals(tbname)){
				String id=request.getParameter("id");
				String otname=request.getParameter("otname");
				if(db.checkTrue("select id from otitle where otname='"+otname+"' and id!="+id)){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("update otitle set otname='"+otname+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("score".equals(tbname)){
				String id=request.getParameter("id");
				String terms_id=request.getParameter("terms_id");
				String course_id=request.getParameter("course_id");
				String classinfo_id=request.getParameter("classinfo_id");
				String students_id=request.getParameter("students_id");
				Object courseplan_id=db.getOnlyOne("select id from courseplan where terms_id="+terms_id+" and teacher_id="+userid+" and course_id="+course_id+" and classinfo_id="+classinfo_id);
				String sval=request.getParameter("sval");
				if(courseplan_id==null){
					json.put("msg", "�ɼ���Ϣ������������");
				}else{
					if(db.checkTrue("select id from score where students_id="+students_id+" and courseplan_id="+courseplan_id+" and id!="+id)){
						json.put("msg", "�ɼ��Ѵ���");
					}else{
						int bls=db.executeUpdate("update score set courseplan_id="+courseplan_id+",students_id="+students_id+",sval="+sval+" where id="+id);
						if(bls>0){
							json.put("msg", "�޸ĳɹ�");
						}else{
							json.put("msg", "�޸�ʧ��");
						}
					}
				}
			}
			if("students".equals(tbname)){
				String id=request.getParameter("id");
				String sno=request.getParameter("sno");
				String sname=request.getParameter("sname");
				String sgender=request.getParameter("sgender");
				String classinfo_id=request.getParameter("classinfo_id");
				String sphone=request.getParameter("sphone");
				String spassword=request.getParameter("spassword");
				if(db.checkTrue("select id from students where sno='"+sno+"' and id!="+id)){
					json.put("msg", "ѧ���Ѵ���");
				}else{
					int bls=db.executeUpdate("update students set sno='"+sno+"',sname='"+sname+"',sgender='"+sgender+"',classinfo_id="+classinfo_id+",sphone='"+sphone+"',spassword='"+spassword+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("stuword".equals(tbname)){
				String id=request.getParameter("id");
				String zyinfo_id=request.getParameter("zyinfo_id");
				String students_id=request.getParameter("students_id");
				String stuzyword=request.getParameter("stuzyword");
				if(db.checkTrue("select id from stuword where xxx= and id!="+id)){
					json.put("msg", "��Ϣ�Ѵ���");
				}else{
					int bls=db.executeUpdate("update stuword set zyinfo_id="+zyinfo_id+",students_id="+students_id+",stuzyword='"+stuzyword+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("syinfo".equals(tbname)){
				String id=request.getParameter("id");
				String terms_id=request.getParameter("terms_id");
				String course_id=request.getParameter("course_id");
				String classinfo_id=request.getParameter("classinfo_id");
				Object courseplan_id=db.getOnlyOne("select id from courseplan where terms_id="+terms_id+" and teacher_id="+userid+" and course_id="+course_id+" and classinfo_id="+classinfo_id);
				String sytitle=request.getParameter("sytitle");
				String symark=request.getParameter("symark");
				if(courseplan_id==null){
					json.put("msg", "ʵ����Ϣ������������");
				}else{
					if(db.checkTrue("select id from score where sytitle='"+sytitle+"' and courseplan_id="+courseplan_id+" and id!="+id)){
						json.put("msg", "ʵ���Ѵ���");
					}else{
						int bls=db.executeUpdate("update syinfo set courseplan_id="+courseplan_id+",sytitle='"+sytitle+"',symark='"+symark+"' where id="+id);
						if(bls>0){
							json.put("msg", "�޸ĳɹ�");
						}else{
							json.put("msg", "�޸�ʧ��");
						}
					}
				}
			}
			if("teacher".equals(tbname)){
				String id=request.getParameter("id");
				String tno=request.getParameter("tno");
				String tname=request.getParameter("tname");
				String tgender=request.getParameter("tgender");
				String tphone=request.getParameter("tphone");
				String taddr=request.getParameter("taddr");
				String tpassword=request.getParameter("tpassword");
				if(db.checkTrue("select id from teacher where tno='"+tno+"' and id!="+id)){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("update teacher set tno='"+tno+"',tname='"+tname+"',tgender='"+tgender+"',tphone='"+tphone+"',taddr='"+taddr+"',tpassword='"+tpassword+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("terms".equals(tbname)){
				String id=request.getParameter("id");
				String termno=request.getParameter("termno");
				String termname=request.getParameter("termname");
				if(db.checkTrue("select id from terms where termno='"+termno+"' and id!="+id)){
					json.put("msg", "ѧ�ڱ���Ѵ���");
				}else{
					int bls=db.executeUpdate("update terms set termno='"+termno+"',termname='"+termname+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("ttitle".equals(tbname)){
				String id=request.getParameter("id");
				String ttname=request.getParameter("ttname");
				String ttmark=request.getParameter("ttmark");
				String otitle_id=request.getParameter("otitle_id");
				if(db.checkTrue("select id from ttitle where ttname='"+ttname+"' and id!="+id)){
					json.put("msg", "�����Ѵ���");
				}else{
					int bls=db.executeUpdate("update ttitle set ttname='"+ttname+"',ttmark='"+ttmark+"',otitle_id="+otitle_id+" where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
					}
				}
			}
			if("zyinfo".equals(tbname)){
				String id=request.getParameter("id");
				String syinfo_id=request.getParameter("syinfo_id");
				String zytitle=request.getParameter("zytitle");
				String zyword=request.getParameter("zyword");
				if(db.checkTrue("select id from zyinfo where xxx= and id!="+id)){
					json.put("msg", "��Ϣ�Ѵ���");
				}else{
					int bls=db.executeUpdate("update zyinfo set syinfo_id="+syinfo_id+",zytitle='"+zytitle+"',zyword='"+zyword+"' where id="+id);
					if(bls>0){
						json.put("msg", "�޸ĳɹ�");
					}else{
						json.put("msg", "�޸�ʧ��");
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
