package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.GitDate;
import utils.Dbhelper;

/**
 * Servlet implementation class luruxuehao
 */
@WebServlet("/luruxuehao")
public class luruxuehao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public luruxuehao() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//创建数据库操作对象
				DbConn db=Dbhelper.getDb();
		String sql="select Num from repos1 ";
	    List<GitDate> gitdatelist=GetList.getlist(GitDate.class, db.executeQuery(sql));
	    for(int i=0;i<gitdatelist.size();i++) {
	    	db.executeUpdate("insert into  students (sno) values ('"+gitdatelist.get(i).getNum()+"')");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
