package teachingSys.svlt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import teachingSys.been.Students;
import teachingSys.utils.Dbhelper;
import net.sf.json.JSONObject;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;
/**
 * Servlet implementation class GetstuSvlt
 */
@WebServlet("/GetstuSvlt")
public class GetstuSvlt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetstuSvlt() {
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

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		String id=request.getParameter("classid");
		Object userid=session.getAttribute("userid");
		DbConn db=Dbhelper.getDb();
		List<Students> clist=GetList.getlist(Students.class, db.executeQuery("select * from students where classinfo_id="+id));
		PrintWriter out=response.getWriter();
		JSONObject json =new JSONObject();
		json.put("clist", clist);
		out.print(json.toString());
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
