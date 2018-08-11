package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.GitDate;
import bean.ScoreProportion;
import bean.Teacher;
import bean.Terms;
import net.sf.json.JSONObject;
import utils.Dbhelper;
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
		//设置传输数据编码方式
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//创建json对象
		JSONObject json=new JSONObject();
		//创建数据库操作对象
		DbConn db=Dbhelper.getDb();
		//获取session对象
		HttpSession session=request.getSession();
		//获取当前登录用户信息
		Teacher userinfo=(Teacher)session.getAttribute("userinfo");
		String GitUsername=userinfo.getGitUsername();
		String TOKEN=userinfo.getTOKEN();
		String CLIENT_ID=userinfo.getCLIENT_ID();
		String CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		System.out.print("gitname="+GitUsername);
		
		//获取用户指定的实验库信息
		String org=request.getParameter("org");
		String proj=request.getParameter("proj");
		//初始化连接数据
		
	    gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj);
	    //将数据写到数据库
	    int tid=userinfo.getId();
	    int terms_id=Integer.parseInt(request.getParameter("cktermsid"));
		int course_id=Integer.parseInt(request.getParameter("ccoursesid"));
	    gitrepostats.ReadCSV.main(tid,org,proj,terms_id,course_id);
	    
	    
/*	    //API
	    String[] a= {};
	    gitrepostats.App.main(a);*/
	    
	    //统计成绩
	    //pull占比，满分次数
	    String pulls=request.getParameter("pulls");
		String pullsFull=request.getParameter("pullsFull");
		//commits占比，满分次数
	    String commits=request.getParameter("commits");
		String commitsFull=request.getParameter("commitsFull");			
		//pull占比，满分次数
	    String files=request.getParameter("files");
		String filesFull=request.getParameter("filesFull");			
		//pull占比，满分次数
	    String comments=request.getParameter("comments");
		String commentsFull=request.getParameter("commentsFull");
	    PrintWriter out=response.getWriter();
		
	    //实例化分值比例
	   
	    ScoreProportion sp=new ScoreProportion();
	    sp.setPulls(Double.parseDouble(pulls));
	    sp.setCommits(Double.parseDouble(commits));
	    sp.setComments(Double.parseDouble(comments));
	    sp.setFile(Double.parseDouble(files));
	    sp.setPullsFull(Integer.parseInt(pullsFull));
	    sp.setCommitsFull(Integer.parseInt(commitsFull));
	    sp.setFileFull(Integer.parseInt(filesFull));
	    sp.setCommentsFull(Integer.parseInt(commentsFull));
	    
	    //读取查询库的实验数据，实例化
	    String tablename="repos"+userinfo.getId();
	    String sql="select id,Pulls,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"'";
	    List<GitDate> gitdatelist=GetList.getlist(GitDate.class, db.executeQuery(sql));

	    int flag=0;  //所以成绩都更新完毕
	    for(int i=0;i<gitdatelist.size();i++) {
	    	double sum=0;
	    	int p=gitdatelist.get(i).getPulls();
	    	int co=gitdatelist.get(i).getComments();
	    	int ci=gitdatelist.get(i).getCommits();
	    	int f=gitdatelist.get(i).getChangedFiles();
	    	
	    	//满分次数
	    	int pf=sp.getPullsFull();
	    	int cif=sp.getCommitsFull();
	    	int cof=sp.getCommentsFull();
	    	int ff=sp.getFileFull();
	    	
	    	//分值比例
	    	double pull2=sp.getPulls();
	    	double commit2=sp.getCommits();
	    	double file2=sp.getFile();
	    	double comment2=sp.getComments();
	    	
	    	DecimalFormat df=new DecimalFormat("0.");
	    	if(p>=pf) {
	    		sum=pull2;	    		
	    	}else {	    		
	    		sum=sum+pull2*p/pf;
	    	}
	    	if(ci>=cif) {
	    		sum=sum+commit2;
	    	}else {
	    		sum=sum+commit2*ci/cif;
	    	}
	    	if(f>=ff) {
	    		sum=sum+file2;
	    	}else {
	    		sum=sum+file2*f/ff;
	    	}
	    	if(co>=cof) {
	    		sum=sum+comment2;
	    	}else {
	    		sum=sum+comment2*co/cof;	    		
	    	}
	    	sum=sum*100;
	    	String temp=df.format(sum);
	    	float score=Float.parseFloat(temp);	    	 	    	
	    	int bls=db.executeUpdate("update  "+tablename+" set score="+score+" where id="+gitdatelist.get(i).getId());
	    	if(bls<=0){
				flag=1;
			}		    	
	    }
    	
		if(flag==1) {
			json.put("msg", "有数据未更新，请重新操作");
		}else{
			json.put("msg", "所有数据更新完毕");
		}
				
		
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
