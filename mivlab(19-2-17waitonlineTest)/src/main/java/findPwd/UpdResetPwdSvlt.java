package findPwd;

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
import utils.Dbhelper;

/**
 * Servlet implementation class UpdResetPwdSvlt
 */
@WebServlet("/UpdResetPwdSvlt")
public class UpdResetPwdSvlt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdResetPwdSvlt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Object userid=session.getAttribute("userid");
		//����json����
		JSONObject json=new JSONObject();
		//�������ݿ��������
		DbConn db=Dbhelper.getDb();
		//��ȡ������ʶ
		String tbname=request.getParameter("tbname");
		System.out.print("ִ��UpdResetPwdSvlt");
		if("adminInfo2".equals(tbname)) {	//�״ε�¼�������������
			System.out.println("�޸Ĺ�������");
			String id=request.getParameter("id");
			String name=request.getParameter("name");
			String newpwd=request.getParameter("newpwd");	
			String email=request.getParameter("email");
			int bls=db.executeUpdate("update admin set password='"+newpwd+"',email='"+email+"' where id="+id);
			if(bls>0){
				json.put("msg", "�޸ĳɹ�");
			}else{
				json.put("msg", "�޸�ʧ��");
			}								
		}
		if("teacher2".equals(tbname)) {	//��ʦ�״ε�¼�������������
			System.out.println("��ʦ�״ε�¼�������������");
			String id=request.getParameter("id");
			
			String newpwd=request.getParameter("newpwd");	
			String email=request.getParameter("email");
			int bls=db.executeUpdate("update teacher set tPwd='"+newpwd+"',email='"+email+"' where id="+id);
			if(bls>0){
				json.put("msg", "�޸ĳɹ�");
			}else{
				json.put("msg", "�޸�ʧ��");
			}								
		}
		if("students2".equals(tbname)) {	//ѧ���״ε�¼�������������
			String id=request.getParameter("id");
			
			String newpwd=request.getParameter("newpwd");	
			String email=request.getParameter("email");
			int bls=db.executeUpdate("update students set spassword='"+newpwd+"',email='"+email+"' where id="+id);
			if(bls>0){
				json.put("msg", "�޸ĳɹ�");
			}else{
				json.put("msg", "�޸�ʧ��");
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
