package teachingSys.svlt;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import teachingSys.utils.Dbhelper;

import com.wm.utils.DbConn;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddzySvlt
 */
@WebServlet("/AddzySvlt")
public class AddzySvlt extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public AddzySvlt() {
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
		//����json����
		JSONObject json=new JSONObject();
		// �ļ��ϴ�֮����ļ�����·��
		String filepath = getServletContext().getRealPath("")+java.io.File.separator+"stufile";
		File saveDir = new File(filepath);
		if(!saveDir.exists()){
			saveDir.mkdir();
		}
		filepath+=java.io.File.separator;
		//�����ļ������ļ����ͱ���
		String filename = "";
		String type="";
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8");
		//�ɽ����ļ��Ĵ�С
		sfu.setFileSizeMax(10240*10240*20);
		sfu.setSizeMax(10240*10240*21);
		//ǰ̨��������
		List<FileItem> itemList;
		//�����ļ�����
		File file=null;
		//������
		String syinfo_id="";
		String zytitle="";
		//����������ļ�������
		String fffname=String.valueOf(System.currentTimeMillis());
		try {
			itemList = sfu.parseRequest(request);
			for (FileItem fileItem : itemList) {
				if(fileItem.isFormField()){
					String value = fileItem.getString();
					value = new String(value.getBytes("ISO-8859-1"),"UTF-8");	
					if("syinfo_id".equals(fileItem.getFieldName())){
						syinfo_id=value;
					}
					if("zytitle".equals(fileItem.getFieldName())){
						zytitle=value;
					}
				}else{
					String name = fileItem.getName();
					int p=name.lastIndexOf(".");
					type=name.substring(p);
					filename=fffname+type;
					file = new File(filepath,filename);
					fileItem.write(file);
					fileItem.getOutputStream().flush();
					fileItem.getOutputStream().close();
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		if(file!=null){
			//�������ݿ��������
			DbConn db=Dbhelper.getDb();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String sql="insert into zyinfo(syinfo_id,zytitle,zyword) values("+syinfo_id+",'"+zytitle+"','"+filename+"')";
			if(db.executeUpdate(sql)>0){
				json.put("msg", "�����ɹ�");
			}else{
				json.put("msg", "����ʧ��");
			}
		}else{
			json.put("msg", "�ļ���ȡʧ��.");
		}
		//======================
		PrintWriter out=response.getWriter();
		out.print(json.toString());
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