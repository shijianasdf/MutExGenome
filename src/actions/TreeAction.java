package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import beans.Tree;
import utils.GsonTools;
import utils.SqlPool;

@SuppressWarnings("serial")
public class TreeAction extends ActionSupport{
     private String treeNodes;
     public String Browse() throws SQLException{
    	 long startTime = System.currentTimeMillis();
    	 Connection conn = null;
		 PreparedStatement pstmt =null;
		 ResultSet RS=null;
		 ArrayList<Tree> AT = new ArrayList<Tree>();
		 try{
			conn = SqlPool.getConnection();
			String sql = "select * from meddc.tree";
			pstmt = conn.prepareStatement(sql);
			RS=pstmt.executeQuery();
			while(RS.next()){
				AT.add(new Tree(RS.getString("id"),RS.getString("pId"),RS.getString("name"),RS.getString("target"),RS.getString("open")));
			} 
			this.treeNodes = GsonTools.createJsonString(AT);
			long endTime = System.currentTimeMillis();
	 		System.out.println("程序运行时间："+(endTime-startTime)+"ms");
		 }catch (Exception e){
			e.printStackTrace();
			return ERROR;
		 }
		 finally{
			 if(RS != null){
				 RS.close();
			 }
			 if(pstmt != null){
				 pstmt.close();
			 }
			 SqlPool.putBackConnection(conn);		
		 }	
    	 return SUCCESS;
     }
	public String getTreeNodes() {
		return treeNodes;
	}
	public void setTreeNodes(String treeNodes) {
		this.treeNodes = treeNodes;
	}	
}
