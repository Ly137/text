package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wm.utils.DbConn;

import utils.Dbhelper;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
/**
 * Servlet implementation class ReadCSV
 */
@WebServlet("/ReadCSV")
public class ReadCSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadCSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//未封装的CSV存入数据库函数
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		long startTime = System.currentTimeMillis();
		File file = new File("E:/installBlock/eclipseEE/eclipse-jee-oxygen-2-win32-x86_64/eclipse/src/json/result.csv");
 
		Scanner in = new Scanner(file);
 		
		System.out.println("数据库连接成功");
		in.next();
		while (in.hasNext())
		{
			String temp1 = in.nextLine();
			String[] temp = temp1.split(",");
			//System.out.println("temp="+temp);
			if (temp.length < 14)
				continue;
 
			if (temp.length == 14)
			{
				int bls=db.executeUpdate("insert into githubShiyanDate(Login,Number,IssueNumber,IssueCount,IssueLabels,Events,FirstTime,Pulls,Commits,Additions,Deletions,ChangedFiles,Comments,ReviewComments) values('"+temp[0]+"','"+temp[1]+"','"+temp[2]+"','"+temp[3]+"','"+temp[4]+"','"+temp[5]+"','"+temp[6]+"','"+temp[7]+"','"+temp[8]+"','"+temp[9]+"','"+temp[10]+"','"+temp[11]+"','"+temp[12]+"',"+temp[13]+")");
				
			}
		}
			

 
		long EndTime = System.currentTimeMillis();
		long time = (EndTime - startTime) / 1000;
 
		System.out.println("导入数据共用时：" + time);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
