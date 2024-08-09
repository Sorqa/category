package com.test.sku.pet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

public class PetDAO {
	 private Connection conn;
	 private PreparedStatement pstmt;
	 private ResultSet rs;
	   
	 private Connection getConn() 
	 {
	    try {
	         Class.forName("oracle.jdbc.OracleDriver");
	         conn = DriverManager.getConnection(
	                   "jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
	         return conn;
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	  }
	 
	 public boolean add(PetVO pet) {
		 String sql = "INSERT INTO pet VALUES (pet_seq.NEXTVAL,?,?,?,?,?,?)";
		 conn = getConn();
		 try {
			 pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pet.getName());
				pstmt.setString(2, pet.getOrigin());
				pstmt.setFloat(3, pet.getWeight());
				pstmt.setDate(4, pet.getBirth());
				pstmt.setInt(5, pet.getPrice());
				pstmt.setString(6, pet.getPic());
				System.out.printf("추가1");
				int rows = pstmt.executeUpdate();	
				System.out.printf("추가2");
				return rows>0;
		 }catch(SQLException sqle) {
				sqle.printStackTrace();
			}
		return false;
		 
	 }
	 
	 public List<PetVO> getList()
	 {
		 String sql = "SELECT no,name,origin,weight,birth,price FROM pet";
		 conn = getConn();
		 try {
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 List<PetVO> list = new ArrayList<>();
			 while(rs.next()) {
				 int no = rs.getInt("NO");
				 String name = rs.getString("NAME");
				 String origin = rs.getString("ORIGIN");
				 float weight = rs.getFloat("WEIGHT");
				 java.sql.Date brith = rs.getDate("BIRTH");
				 int price = rs.getInt("PRICE");
				 
				 list.add(new PetVO(no,name,origin,weight,brith,price));
			 }
			 return list;			 
		 }catch(SQLException sqle) {
				sqle.printStackTrace();
			}finally {
				closeAll();
			}
		return null;
		 
	 }
	 
	 public PetVO getPet(String name) {				
			String sql ="SELECT * FROM pet WHERE name=?";
			conn=getConn();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				
				PetVO pet = null;
				while(rs.next()) {
				int nos = rs.getInt("NO");
				String names = rs.getString("NAME");
				String origin = rs.getString("ORIGIN");
				float weight = rs.getFloat("WEIGHT");
				java.sql.Date brith = rs.getDate("BIRTH");
				int price = rs.getInt("PRICE");
				String pic = rs.getString("PIC");
					
				pet = new PetVO(nos,name,origin,weight,brith,price,pic);
				}	
				return pet;
			}catch(SQLException sqle){
				sqle.printStackTrace();
			}
			return null;
		}
	 
	 public PetVO getPet(int no) {				
			String sql ="SELECT * FROM pet WHERE no=?";
			conn=getConn();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				
				PetVO pet = null;
				while(rs.next()) {
				int nos = rs.getInt("NO");
				String name = rs.getString("NAME");
				String origin = rs.getString("ORIGIN");
				float weight = rs.getFloat("WEIGHT");
				java.sql.Date brith = rs.getDate("BIRTH");
				int price = rs.getInt("PRICE");
				String pic = rs.getString("PIC");
					
				pet = new PetVO(nos,name,origin,weight,brith,price,pic);
				}	
				return pet;
			}catch(SQLException sqle){
				sqle.printStackTrace();
			}
			return null;
		}
	 
	 public boolean edit(PetVO pet) {
			String sql = "UPDATE pet SET weight=?,price=?,pic=? WHERE no=?";
			conn = getConn();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setFloat(1, pet.getWeight());
				pstmt.setInt(2, pet.getPrice());
				pstmt.setString(3, pet.getPic());
				pstmt.setInt(4, pet.getNo());
				
				int rows = pstmt.executeUpdate();				
									
				return rows>0;
			}catch(SQLException sqle){
				sqle.printStackTrace();
			}finally {
				closeAll();
			}
			return false;
		}
	 
	 public boolean delete(int no) {
		 String sql = "DELETE FROM pet WHERE no=?";
		 conn = getConn();
		 try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
								
				int rows = pstmt.executeUpdate();				
									
				return rows>0;
			}catch(SQLException sqle){
				sqle.printStackTrace();
			}finally {
				closeAll();
			}
		return false;
		 
	 }
	 private void closeAll() {
	      try {
	         if(rs!=null) rs.close();
	         if(pstmt!=null) pstmt.close();
	         if(conn!=null) conn.close();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	   }
		

	
}
