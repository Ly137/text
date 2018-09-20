package teachingSys.svlt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import teachingSys.been.Otitle;
import teachingSys.been.Ttitle;
import teachingSys.utils.Dbhelper;
/**
 * Servlet implementation class SyInitSvlt
 */
@WebServlet("/SyInitSvlt")
public class SyInitSvlt extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public SyInitSvlt() {
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
		//���ñ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//��ȡ���ݿ��������
		DbConn db=Dbhelper.getDb();
		//��ȡ���˵�
		List<Otitle> olist=GetList.getlist(Otitle.class, db.executeQuery("select * from otitle order by id asc"));
		//�������˵�
		Iterator<Otitle> it=olist.iterator();
		//�������˵�����
		List<Otitle> alist=new ArrayList();
		while(it.hasNext()){
			//��ȡ���˵�����
			Otitle ot=it.next();
			//��ȡ�����˵�
			List<Ttitle> ttlist=GetList.getlist(Ttitle.class, db.executeQuery("select * from ttitle where otitle_id="+ot.getId()+" order by id asc"));
			//Ϊ���˵���ֵ�����˵�
			ot.setTtlist(ttlist);
			alist.add(ot);
		}
		//�����˵��Ž�request����
		request.setAttribute("alist", alist);
		//��ת����ҳ
		request.getRequestDispatcher("/index.jsp").forward(request, response);
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
