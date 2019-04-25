package Config;

import org.apache.struts2.ServletActionContext;

public class Configs {
	// /bkDir/Software/tomcat7/webapps/LnChrom/tmpFiles
	public static String filePath=ServletActionContext.getServletContext().getRealPath("/tmpFiles").replaceAll("\\\\", "/")+"/";
	
	
	public static String dbName = "LnChrom";
	
	
	public static String regionSearchFun = "";
	
	public static String usersubmit = "usersubmit";

}
