package servlet;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wm.utils.DbConn;
import com.wm.utils.GetList;

import bean.Com;
import bean.GitDate;
import bean.ScoreProportion;
import bean.Teacher;
import bean.Terms;
import bean.user;
import net.sf.json.JSONObject;
import utils.Dbhelper;

/**
 * Servlet implementation class GitSlvt
 */
@WebServlet("/GitSlvt")
public class GitSlvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GitSlvt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//���ô������ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		//����json����
		JSONObject json=new JSONObject();
		//�������ݿ��������
		DbConn db=Dbhelper.getDb();
		//��ȡsession����
		HttpSession session=request.getSession();
				
		//��ȡ��ǰ��¼�û���Ϣ
		Object useridd=session.getAttribute("userid");
		
		if(useridd==null){
			request.getRequestDispatcher("index.jsp").forward(request, response);
			/**
			PrintWriter out=response.getWriter();
			out.print("�����µ�¼");
			out.flush();
			out.close();
			**/
			return;
		}else {
			
		//�ж��û�����
			String GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET;
		String uType=request.getParameter("uType");
		if(uType.equals("admin")) {
			user userinfo=(user)session.getAttribute("userinfo");
			 GitUsername=userinfo.getGitUsername();
			 TOKEN=userinfo.getTOKEN();
			 CLIENT_ID=userinfo.getCLIENT_ID();
			 CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		}else {
			//��ȡ��ǰ��¼�û���Ϣ
			Teacher userinfo=(Teacher)session.getAttribute("userinfo");
			 GitUsername=userinfo.getGitUsername();
			 TOKEN=userinfo.getTOKEN();
			 CLIENT_ID=userinfo.getCLIENT_ID();
			 CLIENT_SECRET=userinfo.getCLIENT_SECRET();
		}
		
		System.out.print("gitname="+GitUsername);
		
		//��ȡ�û�ָ����ʵ�����Ϣ
		String org=request.getParameter("org");
		String proj=request.getParameter("proj");
		//��ʼ����������
			    //API
	   /* String[] a= {};
	    gitrepostats.App.main(a);
	    System.out.print("ִ��APP");*/
		int flagg;
	    //flagg=gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj);
		String rootpath=getServletContext().getRealPath("/");//��Ŀ����·��
		flagg=gitrepostats.App3.main2(GitUsername,TOKEN,CLIENT_ID,CLIENT_SECRET,org,proj,rootpath);
	    if(flagg==404) {
	    	json.put("msg", "�����ʵ���Դ�����ڣ�����GitHub��Ϣ����֯����Ϣ��ʵ�����Ϣ�Ƿ���ȷ");
	    }else if(flagg>=500 & flagg<=600) {
	    	json.put("msg","����������������");
	    }else {
	    	json.put("msg","��������������");
	    }
	    
	    //������д�����ݿ�
	    
	    int tid=Integer.parseInt(String.valueOf(useridd));
	    int terms_id=Integer.parseInt(request.getParameter("cktermsid"));
		int course_id=Integer.parseInt(request.getParameter("ccoursesid"));
	    gitrepostats.ReadCSV.main(tid,org,proj,course_id,terms_id,rootpath,GitUsername);
	    
	    

	    
	    //ͳ�Ƴɼ�
	    //pullռ�ȣ����ִ���
	    String pulls=request.getParameter("pulls");
		String pullsFull=request.getParameter("pullsFull");
		//commitsռ�ȣ����ִ���
	    String commits=request.getParameter("commits");
		String commitsFull=request.getParameter("commitsFull");			
		//changefilesռ�ȣ����ִ���
	    String files=request.getParameter("files");
		String filesFull=request.getParameter("filesFull");			
		//Commentռ�ȣ����ִ���
	    String comments=request.getParameter("comments");
		String commentsFull=request.getParameter("commentsFull");
		//pullDoneռ�ȣ����ִ���
	    String pullDone=request.getParameter("pullDone");
		//pullGoodռ�ȣ����ִ���
	    String pullGood=request.getParameter("pullGood");
		//pullLateռ�ȣ����ִ���
	    String pullLate=request.getParameter("pullLate");
		//pullCopyռ�ȣ����ִ���
	    String pullCopy=request.getParameter("pullCopy");
		//pullBadռ�ȣ����ִ���
	    String pullBad=request.getParameter("pullBad");
		//pullBugռ�ȣ����ִ���
	    String pullBug=request.getParameter("pullBug");
		//pullDemoռ�ȣ����ִ���
	    String pullDemo=request.getParameter("pullDemo");
		//pullInterestingռ�ȣ����ִ���
	    String pullInteresting=request.getParameter("pullInteresting");
		
	    PrintWriter out=response.getWriter();
		
	    //ʵ������ֵ����
	   
	    ScoreProportion sp=new ScoreProportion();
	    sp.setPulls(Double.parseDouble(pulls));
	    sp.setCommits(Double.parseDouble(commits));
	    sp.setComments(Double.parseDouble(comments));
	    sp.setFile(Double.parseDouble(files));
	    sp.setPullsFull(Integer.parseInt(pullsFull));
	    sp.setCommitsFull(Integer.parseInt(commitsFull));
	    sp.setFileFull(Integer.parseInt(filesFull));
	    sp.setCommentsFull(Integer.parseInt(commentsFull));
	    
	    sp.setPullDone(Double.parseDouble(pullDone));
	    sp.setPullGood(Double.parseDouble(pullGood));
	    sp.setPullLate(Double.parseDouble(pullLate));
	    sp.setPullCopy(Double.parseDouble(pullCopy));
	    sp.setPullBad(Integer.parseInt(pullBad));
	    sp.setPullBug(Integer.parseInt(pullBug));
	    sp.setPullDemo(Integer.parseInt(pullDemo));
	    sp.setPullInteresting(Integer.parseInt(pullInteresting));
	    

	    
	    //��ȡ��ѯ���ʵ�����ݣ�ʵ����
	    String tablename="reposdate";
	    String sql="select id,Pulls,PullDone,PullGood,PullLate,PullCopy,PullBad,PullBug,PullDemo,PullInteresting,Commits,ChangedFiles,Comments from "+tablename+" where org='"+org+"' and proj='"+proj+"' and terms_id="+terms_id+" and course_id="+course_id;
	    List<GitDate> gitdatelist=GetList.getlist(GitDate.class, db.executeQuery(sql));
	    System.out.print("��ѯ���="+sql);
	    System.out.println();
	    System.out.print("���ݳ���"+gitdatelist.size());
	    int flag=0;  //���Գɼ����������
	    for(int i=0;i<gitdatelist.size();i++) {
	    	double sum=0;
	    	int p=gitdatelist.get(i).getPulls();
	    	int co=gitdatelist.get(i).getComments();
	    	int ci=gitdatelist.get(i).getCommits();
	    	int f=gitdatelist.get(i).getChangedFiles();
	    	
	    	int pDone=gitdatelist.get(i).getPullDone();
	    	int pGood=gitdatelist.get(i).getPullGood();
	    	int pLate=gitdatelist.get(i).getPullLate();
	    	int pCopy=gitdatelist.get(i).getPullCopy();
	    	int pBad=gitdatelist.get(i).getPullBad();
	    	int pBug=gitdatelist.get(i).getPullBug();
	    	int pDemo=gitdatelist.get(i).getPullDemo();
	    	int pInteresting=gitdatelist.get(i).getPullInteresting();
	    	//���ִ���
	    	int pf=sp.getPullsFull();
	    	int cif=sp.getCommitsFull();
	    	int cof=sp.getCommentsFull();
	    	int ff=sp.getFileFull();
	    	
	    	
	    	
	    	//��ֵ����
	    	double pull2=sp.getPulls();
	    	double commit2=sp.getCommits();
	    	double file2=sp.getFile();
	    	double comment2=sp.getComments();
	    	
	    	double pullDone2=sp.getPullDone();
	    	double pullGood2=sp.getPullGood();
	    	double pullLate2=sp.getPullLate();
	    	double pullCopy2=sp.getPullCopy();
	    	double pullBad2=sp.getPullBad();
	    	double pullBug2=sp.getPullBug();
	    	double pullDemo2=sp.getPullDemo();
	    	double pullInteresting2=sp.getPullInteresting();
	    		    	
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
	    	//�ӷ���
	    	sum=sum+pullDone2*pDone+pullGood2*pGood+pullDemo2*pDemo+pullInteresting2*pInteresting;
	    	//������
	    	sum=sum-pullLate2*pLate-pullCopy2*pCopy-pullBad2*pBad-pullBug2*pBug;
	    	System.out.print((int)sum);
	    	System.out.println();
	    	int bls=db.executeUpdate("update  "+tablename+" set score="+(int)sum+" where id="+gitdatelist.get(i).getId());
	    	if(bls<=0){
				flag=1;
			}		    	
	    }
	    
	    //String filepath="E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/" ;
	    /*	File file = new File("./");
		 file.getCanonicalPath();
		 String filepath= file.getCanonicalPath();
		 filepath=filepath+"/src/json/";*/
	    /**
	     * ���ɼ�result��ŵ�����������·���������ݿ⣬�ɹ���ʦ�鿴ԭʼ����
	     */
	    String resultFile=rootpath+"/github/"+GitUsername+"/"+org+"/"+proj+"/src/json/result.csv";
	    File newpath1= new File(rootpath+"/resultList/"+GitUsername+"/"+org+"/"+proj+"/");
	    System.out.println("newpath1="+newpath1);
	    if(!newpath1.exists()) {
	    	String folderName = newpath1.getParent();
	    	System.out.println("folderName="+folderName);
			File folder = new File(folderName);
			if (!folder.exists()) {
				folder.mkdirs();
			}
	    	
	    	//�����ļ���
	    	System.out.println("�����ļ��д洢ԭʼ�ɼ�����");
	    	
	    }
		String newpath=rootpath+"/resultList/"+GitUsername+"/"+org+"/"+org+"-"+proj+"Result.csv";
		 utils.CopyFileUtils.copyFile(resultFile,newpath);
		 
	        String onlinepath = "resultList/"+GitUsername+"/"+org+"/"+org+"-"+proj+"Result.csv";
		
		 //���洢ԭʼ�ɼ������ݵ�·���������ݿ�
		 boolean bl=db.checkTrue("select id from gitRawData where tid='"+useridd+"' and filepath='" +onlinepath+"'");
			if(bl){
				System.out.print("��¼�Ѵ��ڣ�ִ�и��²���");
				System.out.println();
				List<Com> list=GetList.getlist(Com.class, db.executeQuery("select id from gitRawData where tid='"+useridd+"' and filepath='" +onlinepath+"'"));
				if(list.size()>0) {
					int id=list.get(0).getId();
					int bls=db.executeUpdate("update  gitRawData  set filepath='"+onlinepath+"'where id="+id);
					if(!(bls>0)){
						System.out.print("����ʧ��");
						//System.out.println();
					}
				}
				
			}else {
				//System.out.print("ִ�в������ݲ���");
				//System.out.println();
				int bls=db.executeUpdate("insert into gitRawData  (tid,filepath) values('"+useridd+"','"+onlinepath+"')");
				if(!(bls>0)){
					//System.out.print("��������ʧ��");
					//System.out.println();
				}
			}
	    /**
	     * �ڷ�������ʱ��ץȡ���ݺ����ɳɼ���Ӧ������ɾ��
	     */
	   	
	    String filepath=rootpath+"/github/"+GitUsername+"/"+org+"/"+proj;
	    if( gitrepostats.DelDirfile.delAllFile(filepath)) {
	    	System.out.print("ɾ���ļ��ɹ���");
	    	if(flag==1) {
				json.put("msg", "������δ���£������²���");
			}else{
				json.put("msg", "�������ݸ������");
			}
	    }	   	
	  				
		out.print(json.toString());
		out.flush();
		out.close();
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
