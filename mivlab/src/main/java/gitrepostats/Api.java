/**
 * ����GitHub��ʵ���ѧ���롣<br />
 * By ����ѧԺ ������
 */
package gitrepostats;



/**
 * GitHub Api·����
 * 
 * @author zengsn
 * @since 8.0
 */
public interface Api {
	
	
	public static final String HTTPS = "https://";
	public static final String GIT = "api.github.com";
	public static final String LOGIN = "https://api.github.com/user";
	public static final String REPO = "/repos";
	public static final String ORG = "/hzuapps";  //
	// public static final String PROJ = "/angular-erp-ui";
	// public static final String PROJ = "/android-labs";
	//public static final String PROJ = "/java-web";
	public static final String PROJ = "/android-labs-2017";
	//public static final String PROJ = "/wechat-miniprogram-hzc-2017";
	//public static final String PROJ = "/android-labs-2018";
	
	public static final String USERNAME = "zengsn"; //
	public static final String TOKEN = "88602906f4b5b5676495cf41929723d9228b2e6a";  //

	// ��GitHub�ϴ����ĸ���Ӧ��ID��ʹ��IDʱ������ȡ�������Ʒ������ϸ�
	public static final String CLIENT_ID = "client_id=b3149014960e48f42586";   //
	public static final String CLIENT_SECRET = "client_secret=bfc1cb8b1e206c21ab5c9556aaaf7866ef305875";  //
	public static final String CLIENT_ID_SECRET = CLIENT_ID + "&" + CLIENT_SECRET;

	public static final String CONTRIBUTORS = HTTPS //
			// + USERNAME + ":" //
			// + TOKEN + ":x-oauth-basic@" //
			+ GIT + REPO + ORG + PROJ + "/contributors";
	public static final String COMMITS = HTTPS //
			// + USERNAME + ":" //
			// + TOKEN + ":x-oauth-basic@" //
			+ GIT + REPO + ORG + PROJ + "/commits";
	/** /repos/:owner/:repo/pulls */
	public static final String PULLS = HTTPS //
			+ GIT + REPO + ORG + PROJ + "/pulls";
	/** /repos/:owner/:repo/issues */
	public static final String ISSUES = HTTPS //
			+ GIT + REPO + ORG + PROJ + "/issues";
	public static final String STATE = "state=";
	public static final String STATE_CLOSED = STATE + "closed";

	public static final String PER_PAGE = "per_page=";
	public static final String PAGE = "page=";
	/** ��ʦ���ʺ� */
	
	public static final String LOGIN_TEACHER = "zengsn";  //
	
}
