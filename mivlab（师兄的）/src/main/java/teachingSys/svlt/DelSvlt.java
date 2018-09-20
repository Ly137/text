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
 * Servlet implementation class DelSvlt
 */
@WebServlet("/DelSvlt")
public class DelSvlt extends HttpServlet {
	/**
	* Constructor of the object.
	*/
	public DelSvlt() {
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
			//��ȡ��Ϣid����
			String ids=request.getParameter("ids");
			int i=0;
			json.put("msg", 0);
			//������Ҫɾ����id�ַ���
			if(ids.endsWith(",")){
				ids=ids.substring(0, ids.length()-1);
			}
			if("admin".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from admin where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("classinfo".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from classinfo where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("course".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from course where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("courseplan".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from courseplan where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("otitle".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from otitle where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("score".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from score where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("students".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from students where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("stuword".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from stuword where students_id="+userid+" and zyinfo_id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("stuword".equals(tbname)){
				if(ids.length()>0){
					String zyid=ids.substring(ids.lastIndexOf(",")+1);
					ids=ids.substring(0,ids.lastIndexOf(","));
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from stuword where zyinfo_id="+zyid+" and students_id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("syinfo".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from syinfo where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("teacher".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from teacher where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("terms".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from terms where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("ttitle".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from ttitle where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
				}
			}
			if("zyinfo".equals(tbname)){
				if(ids.length()>0){
					//ɾ����Ҫɾ������Ϣ���
					String sql="delete from zyinfo where id in("+ids+")";
					//ɾ������
					i=db.executeUpdate(sql);
				}
				//���i>0 ˵��ɾ��������Ҫɾ��������
				if(i>0){
					json.put("msg", "ɾ���ɹ�");
				}else{
					json.put("msg", "ɾ��ʧ��");
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
