package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import net.sf.json.JSONObject;
/**
 * Servlet implementation class testgitSlvt
 */
@WebServlet("/testgitSlvt")
public class testgitSlvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testgitSlvt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//����json����
		JSONObject json=new JSONObject();
		//��ȡsession����
		HttpSession session=request.getSession();
		//��ȡ��ǰ��¼�û���Ϣ
		Teacher userinfo=(Teacher)session.getAttribute("userinfo");
		String GitUsername=userinfo.getGitUsername();
		String TOKEN=userinfo.getTOKEN();
		String CLIENT_ID=userinfo.getCLIENT_ID();
		String CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		System.out.print("gitname="+GitUsername);
		
		//��ȡ�û�ָ����ʵ�����Ϣ
		String org=request.getParameter("org");
		String porj=request.getParameter("proj");
		//��ʼ����������
	    gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,porj);
	    gitrepostats.ReadCSV.main();
	    
	    
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
