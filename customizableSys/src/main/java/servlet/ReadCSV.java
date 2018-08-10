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
		//δ��װ��CSV�������ݿ⺯��
		//�������ݿ��������
		DbConn db=Dbhelper.getDb();
		long startTime = System.currentTimeMillis();
		File file = new File("E:/installBlock/eclipseEE/eclipse-jee-oxygen-2-win32-x86_64/eclipse/src/json/result.csv");
 
		Scanner in = new Scanner(file);
 		
		System.out.println("���ݿ����ӳɹ�");
		//�жϱ��Ƿ���ڣ��������򴴽���
		String tablename="hzu131001";
		
		dao.CreateTable.main(tablename);
		//¼������
		in.next();
		while (in.hasNext())
		{
			String temp1 = in.nextLine();		//���Ե�һ��
			String[] temp = temp1.split(",");
			String reposname="ZHU";
			//System.out.println("temp="+temp);
			if (temp.length < 14)
				continue;
 
			if (temp.length == 14)
			{	
				boolean bl=db.checkTrue("select id from "+tablename+" where Num='"+temp[1]+"'");
				if(bl){
					System.out.print("�ļ�¼�Ѵ��ڣ�ִ�и��²���");
					System.out.println();
					int bls=db.executeUpdate("update "+ tablename+" set Login='"+temp[0]+"',IssueNumber='"+temp[2]+"',IssueCount='"+temp[3]+"',IssueLabels='"+temp[4]+"',Events='"+temp[5]+"',FirstTime='"+temp[6]+"',Pulls="+temp[7]+",Commits="+temp[8]+",Additions="+temp[9]+",Deletions="+temp[10]+",ChangedFiles="+temp[11]+",Comments="+temp[12]+",ReviewComments="+temp[13]+" where Num='"+temp[1]+"'");
					if(!(bls>0)){
						System.out.print("����ʧ��");
						System.out.println();
					}
				}else {
					System.out.print("ִ�в������ݲ���");
					System.out.println();
					int bls=db.executeUpdate("insert into "+tablename+" (Login,Num,IssueNumber,IssueCount,IssueLabels,Events,FirstTime,Pulls,Commits,Additions,Deletions,ChangedFiles,Comments,ReviewComments,reposname) values('"+temp[0]+"','"+temp[1]+"','"+temp[2]+"','"+temp[3]+"','"+temp[4]+"','"+temp[5]+"','"+temp[6]+"','"+temp[7]+"','"+temp[8]+"','"+temp[9]+"','"+temp[10]+"','"+temp[11]+"','"+temp[12]+"',"+temp[13]+",'"+reposname+"')");
					if(!(bls>0)){
						System.out.print("��������ʧ��");
						System.out.println();
					}
				}
			}
		}
			

 
		long EndTime = System.currentTimeMillis();
		long time = (EndTime - startTime) / 1000;
 
		System.out.println("�������ݹ���ʱ��" + time);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
