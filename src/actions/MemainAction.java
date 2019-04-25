package actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import beans.Edges;
import beans.Memain;
import beans.Mesub;
import beans.Nodes;
import utils.GsonTools;
import utils.SqlPool;
@SuppressWarnings("serial")
public class MemainAction extends ActionSupport{
	private String genes;
	private String diseases;
	private String id;
	private String parent;
	private String son;
	private String nodes;
	private String edges;
	private String node;
	private String resultTable;
	private String inputNodes;
	private String param;
	
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getInputNodes() {
		return inputNodes;
	}
	public void setInputNodes(String inputNodes) {
		this.inputNodes = inputNodes;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGenes() {
		return genes;
	}
	public void setGenes(String genes) {
		this.genes = genes;
	}
	public String getDiseases() {
		return diseases;
	}
	public void setDiseases(String diseases) {
		this.diseases = diseases;
	}
	@SuppressWarnings("resource")
	public String AdvancedSearch() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet RSinputNodes=null;
		ResultSet RStable=null;
		ResultSet RSedges=null;
		ResultSet RSnodes=null;
		String hqlmain = "select * from meddc.memain where ";
		String hqledge = "select * from meddc.edges where ";
		String hqlnode = "select * from meddc.nodes where ";
		try{
			conn = SqlPool.getConnection();
			if(!this.genes.equalsIgnoreCase("")){
				   String s = "(";
				   String s1 = "(";
				   String s2 = "(";
				   genes = this.replaceBlank(genes);
		  		   String[] tempgenes = genes.split(",");
		  		   for(int i=0;i<tempgenes.length-1;i++){
		  			   s = s + "genename1 = '"+tempgenes[i]+"' or genename2 = '"+tempgenes[i]+"' or ";
		  			   s1 = s1 + "source = '"+tempgenes[i]+"' or target = '"+tempgenes[i]+"' or ";
		  		       s2 = s2 + "id = '" + tempgenes[i] + "' or ";
		  		   }
		  		   s = s + "genename1 = '"+tempgenes[tempgenes.length-1]+"' or genename2 = '"+tempgenes[tempgenes.length-1]+"')";
		  		   s1 = s1 + "source = '"+tempgenes[tempgenes.length-1]+"' or target = '"+tempgenes[tempgenes.length-1]+"')";
		  	       s2 = s2 + "id = '" + tempgenes[tempgenes.length-1] + "')";
		  		   hqlmain = hqlmain + s;
		  		   hqledge = hqledge + s1;
		  		   hqlnode = hqlnode + s2;
		  		   pstmt = conn.prepareStatement(hqlnode);
		  		   RSinputNodes = pstmt.executeQuery();
		  		   //RSinputNodes=pstmt.executeQuery(hqlnode);
		  		   ArrayList<Nodes> inputAN = new ArrayList<Nodes>();
		  		   while(RSinputNodes.next()){
		  			   inputAN.add(new Nodes(RSinputNodes.getString("id"),RSinputNodes.getString("nodecolor"),RSinputNodes.getString("favorshape")));
		  		   }
		  		   this.inputNodes = GsonTools.createJsonString(inputAN);
			}
			if(this.diseases != null){
            	String s = "";
                if(hqlmain.equalsIgnoreCase("select * from meddc.memain where ")){
                	s = "(";
                }else{
                	s = " and (";
                }
            	hqlmain = hqlmain + s + "cancertype = '"+ this.diseases + "' or subtype = '"+this.diseases + "')";   
                hqledge = hqledge + s + "cancertype = '"+ this.diseases + "' or subtype = '"+this.diseases + "')";      
			}
			pstmt = conn.prepareStatement(hqlmain);
			RStable = pstmt.executeQuery();
  		    ArrayList<Memain> AM = new ArrayList<Memain>();
  		    while(RStable.next()){
  			   AM.add(new Memain(RStable.getString("mainid"),RStable.getString("tissueorigin"),RStable.getString("cancertype"),RStable.getString("subtype"),RStable.getString("genename1"),RStable.getString("geneid1"),RStable.getString("ensembleid1"),RStable.getString("aberrancetype1"),RStable.getString("genename2"),RStable.getString("geneid2"),RStable.getString("ensembleid2"),RStable.getString("aberrancetype2"),RStable.getString("evidence"),RStable.getString("plotimage")));
  		    }
  		    this.resultTable = GsonTools.createJsonString(AM);
  		    pstmt = conn.prepareStatement(hqledge);
  		    RSedges = pstmt.executeQuery();
		    ArrayList<Edges> AE = new ArrayList<Edges>();
		    while(RSedges.next()){
			   AE.add(new Edges(RSedges.getString("id"),RSedges.getString("source"),RSedges.getString("aberrancetype1"),RSedges.getString("target"),RSedges.getString("aberrancetype2"),RSedges.getString("evidence"),RSedges.getString("tissueorigin"),RSedges.getString("cancertype"),RSedges.getString("subtype"),RSedges.getString("edgecolor"),RSedges.getString("linestyle")));
		    }
		    if(AE.size()>0){
				ArrayList<HashMap<String,Edges>> AEdges = new ArrayList<HashMap<String,Edges>>();//对边处理
		 	    for(int i=0;i<AE.size();i++){
		 		   HashMap<String,Edges> HE = new HashMap<String,Edges>();
		 		   HE.put("data", AE.get(i));
		 		   AEdges.add(HE);
		 	    }
		 	    this.edges = GsonTools.createJsonString(AEdges); //返回边
		 	    HashSet<String> hs = new HashSet<String>(); //对点进行去重
			    for(int i = 0;i<AE.size();i++){
				   hs.add(AE.get(i).getSource());
				   hs.add(AE.get(i).getTarget());
			    }
			    ArrayList<String> as = new ArrayList<String>(hs);			
				String hqlNodes1 = "select * from meddc.nodes where "; //网络中所有的点
		 	    String s2 = "(";
		 	    for(int j=0;j<(as.size()-1);j++){ 
		 		   s2 = s2 + "id = '" + as.get(j) + "' or ";
		 	    }
		 	    s2 = s2 + "id = '" + as.get(as.size()-1) + "')";
		 	    hqlNodes1 = hqlNodes1 + s2;
		 	    pstmt = conn.prepareStatement(hqlNodes1);
		 	    RSnodes = pstmt.executeQuery();
	  		    ArrayList<Nodes> AN = new ArrayList<Nodes>();
			    while(RSnodes.next()){
				   AN.add(new Nodes(RSnodes.getString("id"),RSnodes.getString("nodecolor"),RSnodes.getString("favorshape")));
			    }
		 	    ArrayList<HashMap<String,Nodes>> ANodes = new ArrayList<HashMap<String,Nodes>>(); //对点进行处理
		 	    for(int i=0;i<AN.size();i++){
		 		   HashMap<String,Nodes> HM = new HashMap<String,Nodes>();
		 		   HM.put("data", AN.get(i));
		 		   ANodes.add(HM);
		 	    }
		 	    this.nodes = GsonTools.createJsonString(ANodes);
			}
		    
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			if(RSinputNodes != null){
				RSinputNodes.close();
			}
			if(RStable != null){
				RStable.close();
			}
			if(RSedges != null){
				RSedges.close();
			}
			if(RSnodes != null){
				RSnodes.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			SqlPool.putBackConnection(conn);
		}
		return SUCCESS;		
	}
	@SuppressWarnings("resource")
	public String DetailSearch() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet RSmt = null;
		ResultSet RSst = null;
		try{
		   conn = SqlPool.getConnection();	
		   pstmt = conn.prepareStatement("select * from meddc.memain where mainid = '" +this.id + "'");
		   RSmt = pstmt.executeQuery();
  		   ArrayList<Memain> AM = new ArrayList<Memain>();
  		   while(RSmt.next()){
  			 AM.add(new Memain(RSmt.getString("mainid"),RSmt.getString("tissueorigin"),RSmt.getString("cancertype"),RSmt.getString("subtype"),RSmt.getString("genename1"),RSmt.getString("geneid1"),RSmt.getString("ensembleid1"),RSmt.getString("aberrancetype1"),RSmt.getString("genename2"),RSmt.getString("geneid2"),RSmt.getString("ensembleid2"),RSmt.getString("aberrancetype2"),RSmt.getString("evidence"),RSmt.getString("plotimage")));
  		   }
  		   ActionContext.getContext().put("memainTable", AM);
  		   pstmt = conn.prepareStatement("select * from meddc.mesub where mainid = '" +this.id + "'");
  		   RSst = pstmt.executeQuery();
		   ArrayList<Mesub> AS = new ArrayList<Mesub>();
		   while(RSst.next()){
			 AS.add(new Mesub(RSst.getInt("id"),RSst.getString("aberrancesite1"),RSst.getString("aberrancesite2"),RSst.getString("description"),RSst.getInt("pmid"),RSst.getString("mainid")));
		   }
		   ActionContext.getContext().put("mesubTable", AS);
		   ActionContext.getContext().put("mesubMatrix", GsonTools.createJsonString(AS));
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			if(RSmt != null){
				RSmt.close();
			}
			if(RSst != null){
				RSst.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			SqlPool.putBackConnection(conn);
		}
		return "DetailSuccess";
	}
	@SuppressWarnings("resource")
	public String SearchNode() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet RStable=null;
		ResultSet RSedges=null;
		ResultSet RSnodes=null;
		try{
			//System.out.println(new Date().toString());
			conn = SqlPool.getConnection();
			if(this.parent.equalsIgnoreCase("Chromosomal Events") || this.parent.equalsIgnoreCase("Structural Variation Events") || this.parent.matches("[A-Z]")){
				long startTime = System.currentTimeMillis();
				pstmt = conn.prepareStatement("select * from meddc.memain where (genename1 = '"+this.son+"' or genename2 = '"+this.son+"')");
				RStable = pstmt.executeQuery();
		  		ArrayList<Memain> AM = new ArrayList<Memain>();
		  		while(RStable.next()){
		  			AM.add(new Memain(RStable.getString("mainid"),RStable.getString("tissueorigin"),RStable.getString("cancertype"),RStable.getString("subtype"),RStable.getString("genename1"),RStable.getString("geneid1"),RStable.getString("ensembleid1"),RStable.getString("aberrancetype1"),RStable.getString("genename2"),RStable.getString("geneid2"),RStable.getString("ensembleid2"),RStable.getString("aberrancetype2"),RStable.getString("evidence"),RStable.getString("plotimage")));
		  		}
		  		pstmt = conn.prepareStatement("select * from meddc.edges where (source = '"+this.son+"' or target = '"+this.son+"')");
		  		RSedges = pstmt.executeQuery();
		  		ArrayList<Edges> AE = new ArrayList<Edges>();
		  		while(RSedges.next()){
		  			AE.add(new Edges(RSedges.getString("id"),RSedges.getString("source"),RSedges.getString("aberrancetype1"),RSedges.getString("target"),RSedges.getString("aberrancetype2"),RSedges.getString("evidence"),RSedges.getString("tissueorigin"),RSedges.getString("cancertype"),RSedges.getString("subtype"),RSedges.getString("edgecolor"),RSedges.getString("linestyle")));
		  		}
		  		ArrayList<HashMap<String,Edges>> AEdges = new ArrayList<HashMap<String,Edges>>();//对边处理
		     	   for(int i=0;i<AE.size();i++){
		     		   HashMap<String,Edges> HE = new HashMap<String,Edges>();
		     		   HE.put("data", AE.get(i));
		     		   AEdges.add(HE);
		     	   }
		     	   HashSet<String> hs = new HashSet<String>(); //对点进行去重
		     	   for(int i = 0;i<AE.size();i++){
		     		   hs.add(AE.get(i).getSource());
		     		   hs.add(AE.get(i).getTarget());
		     	   }
		     	   ArrayList<String> as = new ArrayList<String>(hs);
		     	   String hqlNodes1 = "select * from meddc.nodes where "; //网络中所有的点
		     	   String s2 = "(";
		     	   for(int j=0;j<(as.size()-1);j++){
		     		   s2 = s2 + "id = '" + as.get(j) + "' or ";
		     	   }
		     	   s2 = s2 + "id = '" + as.get(as.size()-1) + "')";
		     	   hqlNodes1 = hqlNodes1 + s2;
		     	   pstmt = conn.prepareStatement(hqlNodes1);
			  	   RSnodes = pstmt.executeQuery();
			  	   ArrayList<Nodes> AN = new ArrayList<Nodes>();
			  	   while(RSnodes.next()){
			  		   AN.add(new Nodes(RSnodes.getString("id"),RSnodes.getString("nodecolor"),RSnodes.getString("favorshape")));
			  	   }
			  	   ArrayList<HashMap<String,Nodes>> ANodes = new ArrayList<HashMap<String,Nodes>>(); //对点进行处理
		     	   for(int i=0;i<AN.size();i++){
		     		   HashMap<String,Nodes> HM = new HashMap<String,Nodes>();
		     		   HM.put("data", AN.get(i));
		     		   ANodes.add(HM);
		     	   }
		     	   this.nodes = GsonTools.createJsonString(ANodes);
		 		   this.resultTable = GsonTools.createJsonString(AM);
		 		   this.edges = GsonTools.createJsonString(AEdges);
		 		   this.node = this.son;
		 		   long endTime = System.currentTimeMillis();
		 		  System.out.println("程序运行时间："+(endTime-startTime)+"ms");
			}else{
				long startTime = System.currentTimeMillis();
				pstmt = conn.prepareStatement("select * from meddc.memain where (cancertype = '"+this.son+"' or subtype = '"+this.son+"')");
				RStable = pstmt.executeQuery();
		  		ArrayList<Memain> AM = new ArrayList<Memain>();
		  		while(RStable.next()){
		  			AM.add(new Memain(RStable.getString("mainid"),RStable.getString("tissueorigin"),RStable.getString("cancertype"),RStable.getString("subtype"),RStable.getString("genename1"),RStable.getString("geneid1"),RStable.getString("ensembleid1"),RStable.getString("aberrancetype1"),RStable.getString("genename2"),RStable.getString("geneid2"),RStable.getString("ensembleid2"),RStable.getString("aberrancetype2"),RStable.getString("evidence"),RStable.getString("plotimage")));
		  		}
		  		pstmt = conn.prepareStatement("select * from meddc.edges where (cancertype = '"+this.son+"' or subtype = '"+this.son+"')");
		  		RSedges = pstmt.executeQuery();
		  		ArrayList<Edges> AE = new ArrayList<Edges>();
		  		while(RSedges.next()){
		  			AE.add(new Edges(RSedges.getString("id"),RSedges.getString("source"),RSedges.getString("aberrancetype1"),RSedges.getString("target"),RSedges.getString("aberrancetype2"),RSedges.getString("evidence"),RSedges.getString("tissueorigin"),RSedges.getString("cancertype"),RSedges.getString("subtype"),RSedges.getString("edgecolor"),RSedges.getString("linestyle")));
		  		}
		  		ArrayList<HashMap<String,Edges>> AEdges = new ArrayList<HashMap<String,Edges>>();//对边处理
		     	   for(int i=0;i<AE.size();i++){
		     		   HashMap<String,Edges> HE = new HashMap<String,Edges>();
		     		   HE.put("data", AE.get(i));
		     		   AEdges.add(HE);
		     	   }
		     	   HashSet<String> hs = new HashSet<String>(); //对点进行去重
		     	   for(int i = 0;i<AE.size();i++){
		     		   hs.add(AE.get(i).getSource());
		     		   hs.add(AE.get(i).getTarget());
		     	   }
		     	   ArrayList<String> as = new ArrayList<String>(hs);
		     	   String hqlNodes1 = "select * from meddc.nodes where "; //网络中所有的点
		     	   String s2 = "(";
		     	   for(int j=0;j<(as.size()-1);j++){
		     		   s2 = s2 + "id = '" + as.get(j) + "' or ";
		     	   }
		     	   s2 = s2 + "id = '" + as.get(as.size()-1) + "')";
		     	   hqlNodes1 = hqlNodes1 + s2;
		     	   pstmt = conn.prepareStatement(hqlNodes1);
			  	   RSnodes = pstmt.executeQuery();
			  	   ArrayList<Nodes> AN = new ArrayList<Nodes>();
			  	   while(RSnodes.next()){
			  		   AN.add(new Nodes(RSnodes.getString("id"),RSnodes.getString("nodecolor"),RSnodes.getString("favorshape")));
			  	   }
			  	   ArrayList<HashMap<String,Nodes>> ANodes = new ArrayList<HashMap<String,Nodes>>(); //对点进行处理
		     	   for(int i=0;i<AN.size();i++){
		     		   HashMap<String,Nodes> HM = new HashMap<String,Nodes>();
		     		   HM.put("data", AN.get(i));
		     		   ANodes.add(HM);
		     	   }
		     	   this.nodes = GsonTools.createJsonString(ANodes);
		 		   this.resultTable = GsonTools.createJsonString(AM);
		 		   this.edges = GsonTools.createJsonString(AEdges);
		 		   this.node = this.son;
		 		   long endTime = System.currentTimeMillis();
		 		   System.out.println("程序运行时间："+(endTime-startTime)+"ms");
			}
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			if(RStable != null){
				RStable.close();
			}
			if(RSedges != null){
				RSedges.close();
			}
			if(RSnodes != null){
				RSnodes.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			SqlPool.putBackConnection(conn);
		}
		return "NodeSuccess";
	}
	@SuppressWarnings("resource")
	public String QuickSearch() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet RSmt = null;
		ResultSet RSedges = null;
		ResultSet RSnodes = null;
		ResultSet RSinputNodes = null;
		String hqlmain = "select * from meddc.memain where (genename1 = '" +this.param + "' or genename2 = '"+this.param +"' or cancertype = '"+this.param+ "' or subtype = '"+ this.param +"')";
		String hqledge = "select * from meddc.edges where (source = '" +this.param + "' or target = '"+this.param +"' or cancertype = '"+this.param+ "' or subtype = '"+ this.param +"')";
		String hqlinputnode = "select * from meddc.nodes  where (id = '"+ this.param +"')";
		try{
			conn = SqlPool.getConnection();	
			pstmt = conn.prepareStatement(hqlmain);
			RSmt = pstmt.executeQuery();
	  		ArrayList<Memain> AM = new ArrayList<Memain>();
	  		while(RSmt.next()){
	  			AM.add(new Memain(RSmt.getString("mainid"),RSmt.getString("tissueorigin"),RSmt.getString("cancertype"),RSmt.getString("subtype"),RSmt.getString("genename1"),RSmt.getString("geneid1"),RSmt.getString("ensembleid1"),RSmt.getString("aberrancetype1"),RSmt.getString("genename2"),RSmt.getString("geneid2"),RSmt.getString("ensembleid2"),RSmt.getString("aberrancetype2"),RSmt.getString("evidence"),RSmt.getString("plotimage")));
	  		}
	  		ActionContext.getContext().put("resultTable", AM);
	  		pstmt = conn.prepareStatement(hqledge);
	  		RSedges = pstmt.executeQuery();
	  		ArrayList<Edges> AE = new ArrayList<Edges>();
	  		while(RSedges.next()){
	  			AE.add(new Edges(RSedges.getString("id"),RSedges.getString("source"),RSedges.getString("aberrancetype1"),RSedges.getString("target"),RSedges.getString("aberrancetype2"),RSedges.getString("evidence"),RSedges.getString("tissueorigin"),RSedges.getString("cancertype"),RSedges.getString("subtype"),RSedges.getString("edgecolor"),RSedges.getString("linestyle")));
	  		}
	  		if(AE.size()>0){
				ArrayList<HashMap<String,Edges>> AEdges = new ArrayList<HashMap<String,Edges>>();//对边处理
			  	for(int i=0;i<AE.size();i++){
			  		HashMap<String,Edges> HE = new HashMap<String,Edges>();
			  		HE.put("data", AE.get(i));
			  		AEdges.add(HE);
			  	}
			   ActionContext.getContext().put("Edges",GsonTools.createJsonString(AEdges));
			   HashSet<String> hs = new HashSet<String>(); //对点进行去重
		  	   for(int i = 0;i<AE.size();i++){
		  		   hs.add(AE.get(i).getSource());
		  		   hs.add(AE.get(i).getTarget());
		  	   }
		  	   ArrayList<String> as = new ArrayList<String>(hs);
		  	   String hqlnode = "select * from meddc.nodes where "; //网络中所有的点
		  	   String s2 = "(";
		  	   for(int j=0;j<(as.size()-1);j++){
		  		   s2 = s2 + "id = '" + as.get(j) + "' or ";
		  	   }
		  	   s2 = s2 + "id = '" + as.get(as.size()-1) + "')";
		  	   hqlnode = hqlnode + s2;
		  	   ArrayList<Nodes> AN = new ArrayList<Nodes>();
		  	   pstmt = conn.prepareStatement(hqlnode);
		  	   RSnodes = pstmt.executeQuery();
		  		while(RSnodes.next()){
		  			AN.add(new Nodes(RSnodes.getString("id"),RSnodes.getString("nodecolor"),RSnodes.getString("favorshape")));
		  		}
		  	   ArrayList<HashMap<String,Nodes>> ANodes = new ArrayList<HashMap<String,Nodes>>(); //对点进行处理
		  	   for(int i=0;i<AN.size();i++){
		  		   HashMap<String,Nodes> HM = new HashMap<String,Nodes>();
		  		   HM.put("data", AN.get(i));
		  		   ANodes.add(HM);
		  	   }
				ActionContext.getContext().put("Nodes",GsonTools.createJsonString(ANodes));
				pstmt = conn.prepareStatement(hqlinputnode);
			  	RSinputNodes = pstmt.executeQuery();
			  	ArrayList<Nodes> inputNodes = new ArrayList<Nodes>();
			    while(RSinputNodes.next()){
			    	inputNodes.add(new Nodes(RSinputNodes.getString("id"),RSinputNodes.getString("nodecolor"),RSinputNodes.getString("favorshape")));
			  	}
			    ActionContext.getContext().put("inputNodes",GsonTools.createJsonString(inputNodes));
	  		}else{
			  ActionContext.getContext().put("Edges","");
			  ActionContext.getContext().put("Nodes","");
			  ActionContext.getContext().put("inputNodes","");
		  }
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			if(RSedges != null){
				RSedges.close();
			}
			if(RSnodes != null){
				RSnodes.close();
			}
			if(RSinputNodes != null){
				RSinputNodes.close();
			}
			if(RSmt != null){
				RSmt.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			SqlPool.putBackConnection(conn);
		}
		return "QuickSuccess";
	}
	@SuppressWarnings("resource")
	public String AdvancedInnerSearch() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet RSmt = null;
		ResultSet RSedges = null;
		ResultSet RSnodes = null;
		String hqlmain = "select * from meddc.memain where (genename1 in (";
		String hqledge = "select * from meddc.edges where (source in (";
		try{
			conn = SqlPool.getConnection();
			if(!this.genes.equalsIgnoreCase("")){
				   genes = this.replaceBlank(genes);
		  		   String[] tempgenes = genes.split(",");
		  		   String s = "";
		  		   String s1 = "";
		  		   for(int i = 0;i< tempgenes.length-1;i++){
		  			   s = s + "'" + tempgenes[i] +"',";
		  			   s1 = s1 +"'" + tempgenes[i] +"',";
		  		   }
		  		   s = s + "'" + tempgenes[tempgenes.length-1]+"'"; 
		  		   s1 = s1 + "'" + tempgenes[tempgenes.length-1]+"'"; 
		  		   hqlmain = hqlmain + s + ")) and (genename2 in (" + s +"))";
		  		   hqledge = hqledge + s1 + ")) and (target in (" + s1 +"))";
				}
				if(this.diseases != null){
		            	String s = "";
		                if(hqlmain.equalsIgnoreCase("select * from meddc.memain where (genename1 in (")){
		                	s = "(";
		                }else{
		                	s = " and (";
		                }
		            	hqlmain = hqlmain + s + "cancertype = '"+ this.diseases + "' or subtype = '"+this.diseases + "')";   
		                hqledge = hqledge + s + "cancertype = '"+ this.diseases + "' or subtype = '"+this.diseases + "')";    
				}
				pstmt = conn.prepareStatement(hqlmain);
				RSmt = pstmt.executeQuery();
		  		ArrayList<Memain> AM = new ArrayList<Memain>();
		  		while(RSmt.next()){
		  			AM.add(new Memain(RSmt.getString("mainid"),RSmt.getString("tissueorigin"),RSmt.getString("cancertype"),RSmt.getString("subtype"),RSmt.getString("genename1"),RSmt.getString("geneid1"),RSmt.getString("ensembleid1"),RSmt.getString("aberrancetype1"),RSmt.getString("genename2"),RSmt.getString("geneid2"),RSmt.getString("ensembleid2"),RSmt.getString("aberrancetype2"),RSmt.getString("evidence"),RSmt.getString("plotimage")));
		  		}
		  		this.resultTable = GsonTools.createJsonString(AM);
		  		pstmt = conn.prepareStatement(hqledge);
		  		RSedges = pstmt.executeQuery();
		  		ArrayList<Edges> AE = new ArrayList<Edges>();
		  		while(RSedges.next()){
		  			AE.add(new Edges(RSedges.getString("id"),RSedges.getString("source"),RSedges.getString("aberrancetype1"),RSedges.getString("target"),RSedges.getString("aberrancetype2"),RSedges.getString("evidence"),RSedges.getString("tissueorigin"),RSedges.getString("cancertype"),RSedges.getString("subtype"),RSedges.getString("edgecolor"),RSedges.getString("linestyle")));
		  		}
				if(AE.size()>0){
					ArrayList<HashMap<String,Edges>> AEdges = new ArrayList<HashMap<String,Edges>>();//对边处理
			 	    for(int i=0;i<AE.size();i++){
			 		   HashMap<String,Edges> HE = new HashMap<String,Edges>();
			 		   HE.put("data", AE.get(i));
			 		   AEdges.add(HE);
			 	    }
			 	    this.edges = GsonTools.createJsonString(AEdges); //返回边
			 	    HashSet<String> hs = new HashSet<String>(); //对点进行去重
				    for(int i = 0;i<AE.size();i++){
					   hs.add(AE.get(i).getSource());
					   hs.add(AE.get(i).getTarget());
				    }
				    ArrayList<String> as = new ArrayList<String>(hs);			
					String hqlNodes1 = "select * from meddc.nodes where"; //网络中所有的点
			 	    String s2 = "(";
			 	    for(int j=0;j<(as.size()-1);j++){ 
			 		   s2 = s2 + "id = '" + as.get(j) + "' or ";
			 	    }
			 	    s2 = s2 + "id = '" + as.get(as.size()-1) + "')";
			 	    hqlNodes1 = hqlNodes1 + s2;
			 	    pstmt = conn.prepareStatement(hqlNodes1);
			  		RSnodes = pstmt.executeQuery();
			  		ArrayList<Nodes> AN = new ArrayList<Nodes> ();
			  		while(RSnodes.next()){
			  			AN.add(new Nodes(RSnodes.getString("id"),RSnodes.getString("nodecolor"),RSnodes.getString("favorshape")));
			  		}
			 	    ArrayList<HashMap<String,Nodes>> ANodes = new ArrayList<HashMap<String,Nodes>>(); //对点进行处理
			 	    for(int i=0;i<AN.size();i++){
			 		   HashMap<String,Nodes> HM = new HashMap<String,Nodes>();
			 		   HM.put("data", AN.get(i));
			 		   ANodes.add(HM);
			 	    }
			 	    this.nodes = GsonTools.createJsonString(ANodes);
				}
		}catch(Exception e){
			e.printStackTrace();
			return ERROR;
		}finally{
			if(RSmt != null){
				RSmt.close();
			}
			if(RSedges != null){
				RSedges.close();
			}
			if(RSnodes != null){
				RSnodes.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			SqlPool.putBackConnection(conn);
		}
		return "InnerSuccess";
	}
	public String replaceBlank(String str){ //清洗空格和换行  
	       String dest = "";  
	       if (str!=null) {  
	           Pattern p = Pattern.compile("\\s*|\t|\r|\n");  
	           Matcher m = p.matcher(str);  
	           dest = m.replaceAll("");  
	       }  
	       return dest;  
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getSon() {
		return son;
	}
	public void setSon(String son) {
		this.son = son;
	}
	public String getNodes() {
		return nodes;
	}
	public void setNodes(String nodes) {
		this.nodes = nodes;
	}
	public String getEdges() {
		return edges;
	}
	public void setEdges(String edges) {
		this.edges = edges;
	}
	public String getNode() {
		return node;
	}
	public void setNode(String node) {
		this.node = node;
	}
	public String getResultTable() {
		return resultTable;
	}
	public void setResultTable(String resultTable) {
		this.resultTable = resultTable;
	} 
	
}
