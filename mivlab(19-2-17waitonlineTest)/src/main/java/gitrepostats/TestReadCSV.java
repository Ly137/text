package gitrepostats;

import java.io.File;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.wm.utils.DbConn;

import utils.Dbhelper;

public class TestReadCSV {
	 public static void main(int tid,String org,String proj,int course_id,int terms_id,String rootpath){
			//δ��װ��CSV�������ݿ⺯��
					//�������ݿ��������
					DbConn db=Dbhelper.getDb();
					long startTime = System.currentTimeMillis();
					
					org="hzuapps";
					proj="java-web";
					 /*File file = new File("./");
					 File rFile = new File(file.getAbsolutePath()+"/src/json/result.csv");
					System.out.print(rFile);*/
					//File file = new File("E:/eclipseWorkspace/.metadata/allProjUpload/customizableSys/git/src/json/result.csv");
					File file = new File(rootpath+"/github/"+org+"/"+proj+"/src/json/result.csv");
					System.out.print(file);
					try {
					Scanner in = new Scanner(file);
			 		
					System.out.println("���ݿ����ӳɹ�");
					//�жϱ��Ƿ���ڣ��������򴴽���,ÿ����ʦһ����
					String tablename="reposdate";
					
					
					//¼������
					String regEx="[^0-9]";	//������ʽ,ȥ���ļ�ǰ׺������ѧ��
					in.next();
					while (in.hasNext())
					{
						String temp1 = in.nextLine();		//���Ե�һ��
						String[] temp = temp1.split(",");
						
						//System.out.println("temp="+temp);
						if (temp.length < 14)
							continue;
			 
						if (temp.length == 14)
						{	
							//ɸѡ����ѧ�ŵ��ֶ�
							String str="";
							int begin=temp[1].indexOf("1"),end=temp[1].indexOf('/',begin+1);
							str=temp[1].substring(begin, end);
							if(str.length()!=0) {
								System.out.println(str);
								System.out.println(str.length());
							}
							
							//��ɸѡ�������ַ��ٽ���ѧ�ŵ�ɸѡ
							/**
							 * 
							 
							Pattern p= Pattern.compile(regEx);
							Matcher m=p.matcher(temp[1]);
							String strNum=m.replaceAll("").trim();	*/
							//System.out.println(strNum);
						}
					}
						

			 
					long EndTime = System.currentTimeMillis();
					long time = (EndTime - startTime) / 1000;
			 
					System.out.println("�������ݹ���ʱ��" + time);
					in.close();
				 }catch (Exception ex) {			 
					      System.out.print("��ȡ���ݳ���");
				 }
					 
			        
			 }
}
