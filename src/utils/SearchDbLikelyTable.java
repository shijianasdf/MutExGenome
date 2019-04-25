package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class SearchDbLikelyTable {
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 模糊匹配，根据多个条件，返回�?�? table
	//
	// 参数说明
	// 1-3.	conn, dbName, tableName 望文生意
	// 4.	selectedCols 返回的列，以逗号空格 ", " 分隔�? String �?
	// 5-6.	基于 keyCols �? keyValues 搜索结果
	// 			要求此两者为 ArrayList<String> 分别包含�?索的列名和对应的�?
	// 8-9.	是否在最后添加要求，要求 notEqualCol 不等�? notEqualValue
	// 7.	基于 conditionTypeList 将多个条件连接， ArrayList<String>，这个参数关键，举例说明
	//		例一，如果希望得�? select * from * where (* like A) AND (* like B)
	//			�? conditionTypeList 中输�? ") AND ("
	//		例二，如果希望得�? select * from * where (* like A) AND (* like B OR * like C)
	//			�? conditionTypeList 中输�? ") AND (", " OR "
	//		例三，如果希望得�? select * from * where (* like A) AND (* like B) OR (* like C)
	//			�? conditionTypeList 中输�? ") AND (", ") OR ("
	// 返回 ArrayList<ArrayList<String>>
	public ArrayList<ArrayList<String>> queryTableMC(Connection conn, String dbName, String tableName, String selectedCols, ArrayList<String> keyCols, ArrayList<String> keyValues, ArrayList<String> conditionTypeList, String notEqualCol, String notEqualValue) throws SQLException{
		// 此函数返回的结果  ArrayList<ArrayList<String>>
		ArrayList<ArrayList<String>> resultTable=new ArrayList<ArrayList<String>>();
		// 确定有列数，初始化为零列
		int size = 0;
		// 如果 selectedCols 中包含�?�号，获取列�?
		if(selectedCols.contains(", "))
			size = selectedCols.split(", ").length;
		else
			size=1;	// 如果 selectedCols 中不包含逗号，则列数为一
		System.out.println("search for columns numbers ==== "+size);
		// 建立 mysql 指令
		// 如果 keyCols 中只有一个�?�，那么等同于单条件搜索的结�?
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where ("+keyCols.get(0)+" like '%"+keyValues.get(0)+"%'";
		// 如果 keyCols 的长度大与一
		// 则循�? keyCols 产生多条件搜索指�?
		if(keyCols.size()>1 && conditionTypeList.size()>0){
			for(int i=1; i<keyCols.size(); i++)
				mysqlStr = mysqlStr+conditionTypeList.get(i-1)+keyCols.get(i)+" like '%"+keyValues.get(i)+"%'";
		}
		// 添加mysql语句的尾�?
		// 如果没有限定不等列，则直接补上括号的右半�?
		// 否则添加不等列指令，并补上括号的右半�?
		if(notEqualCol.length()==0)
			mysqlStr = mysqlStr+")";
		else
			mysqlStr = mysqlStr+") AND ("+notEqualCol+"!='"+notEqualValue+"')";
		// 输出 mysql 指令
		System.out.println(mysqlStr);
		// 运行 mysql 指令
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// �? mysql 返回的数据输入到 resultTable �?
		while(rs.next()){
			// 建立临时�? list 以存储行信息
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1; i<=size; i++)
				rowList.add(rs.getString(i));
			// 添加行信息，以获得返回的 resultTable
			resultTable.add(rowList);
		}
		return resultTable;
	}

	// 模糊匹配，根据单个条件，返回�?�? table
	//
	// 参数说明
	// 1-3.	conn, dbName, tableName 望文生意
	// 4.	selectedCols 返回的列，以逗号空格 ", " 分隔�? String �?
	// 5-6.	基于 keyCol �? keyValue 搜索结果，String
	// 返回 ArrayList<ArrayList<String>>
	public ArrayList<ArrayList<String>> queryTableSC(Connection conn, String dbName, String tableName, String selectedCols, String keyCol, String keyValue) throws SQLException{
		ArrayList<ArrayList<String>> resultTable=new ArrayList<ArrayList<String>>();
		// 确定有列数，初始化为零列
		int size = 0;
		// 如果 selectedCols 中包含�?�号，获取列�?
		if(selectedCols.contains(", "))
			size = selectedCols.split(", ").length;
		else
			size=1;	// 如果 selectedCols 中不包含逗号，则列数为一
		System.out.println("search for columns numbers ==== "+size);
		// 建立 mysql 指令
		String mysqlStr = "";
		mysqlStr = "select "+selectedCols+" from "+dbName+"."+tableName+" where "+keyCol+" like '%"+keyValue+"%'";
		// 运行 mysql 指令
		pstmt = conn.prepareStatement(mysqlStr);
		rs = pstmt.executeQuery();
		// �? mysql 返回的数据输入到 resultTable �?
		while(rs.next()){
			// 建立临时�? list 以存储行信息
			ArrayList<String> rowList=new ArrayList<String>();
			for(int i=1; i<=size; i++)
				rowList.add(rs.getString(i));
			// 添加行信息，以获得返回的 resultTable
			resultTable.add(rowList);
		}
		return resultTable;
	}
}
