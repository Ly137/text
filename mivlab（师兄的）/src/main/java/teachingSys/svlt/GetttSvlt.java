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

import net.sf.json.JSONObject;
import teachingSys.been.Otitle;
import teachingSys.been.Ttitle;
import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;
/**
 * Servlet implementation class GetttSvlt
 */
@WebServlet("/GetttSvlt")
public class GetttSvlt extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public GetttSvlt() {
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
		//����json����
		JSONObject json=new JSONObject();
		//��ȡǰ̨����
		String id=request.getParameter("id");
		//��ȡ���˵�
		List<Otitle> olist=GetList.getlist(Otitle.class, db.executeQuery("select * from otitle where id="+id));
		Otitle ot=olist.get(0);
		//��ȡ�����˵�
		List<Ttitle> ttlist=GetList.getlist(Ttitle.class, db.executeQuery("select * from ttitle where otitle_id="+ot.getId()+" order by id asc"));
		//Ϊ���˵���ֵ�����˵�
		ot.setTtlist(ttlist);		
		//�����˵��Ž�json����
		json.put("ot", ot);
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
