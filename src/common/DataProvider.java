package common;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;
public class DataProvider extends ConnectData{
	DateFormat ngay = new SimpleDateFormat("dd-MM-yyyy");
	DateFormat gio= new SimpleDateFormat("HH:mm");
	Calendar cal = Calendar.getInstance();
	public String ngayHt=ngay.format(cal.getTime());
	public String gioHt=gio.
	format(cal.getTime());
	
    //private Connection con=null;
    private Statement stmt = null;
    private PreparedStatement pstmt=null;
    private ResultSet rs = null;
    public DataProvider() {
    }
    
  // láº¥y káº¿t ná»‘i
    public Connection getCon() throws SQLException {
        
        return getConnect();
    }
  
   // láº¥y Statement
    public Statement getSta() throws SQLException {
      stmt = getCon().createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        return stmt;
    }
   // láº¥y Rs
    public ResultSet exQ(String query) throws SQLException {
    rs=getSta().executeQuery(query);
    return rs;
     }
  // xoa
    public void PreSta(String query) throws SQLException{
    pstmt=getCon().prepareStatement(query);
    pstmt.executeUpdate();	
    }
    // chÃ¨n, sá»­a
    public void exU(String query) throws SQLException {
    	getSta().executeUpdate(query);
     }
     
    // láº¥y dá»¯ liá»‡u báº£ng   
	public DefaultTableModel getTb(String query,String[] tieude,String[] field)
	{
	DefaultTableModel tb=new DefaultTableModel();
	try {
	String _query=query;
	ResultSet rs = exQ(_query);
	ArrayList<String[]> dulieubang = new ArrayList<String[]>();
		while(rs.next())
		{
			String[] dong = new String[tieude.length];
			for(int i=0;i<=tieude.length-1;i++)
			dong[i]=rs.getString(field[i]);
			dulieubang.add(dong);
		}
	String[][] data = new String[dulieubang.size()][tieude.length];
	for(int i=0; i<dulieubang.size(); i++)
	{
		data[i]=dulieubang.get(i);
	}
	tb.setDataVector(data,tieude);
	return tb;
	    }
	catch(Exception ex){
    System.out.println("Loi: "+ex);
    return null;
	}		
	}
    // láº¥y dá»¯ liá»‡u comboBox
	public DefaultComboBoxModel<String> getCmb(String query,String element,String field)
	{ 
	DefaultComboBoxModel<String> cmbModel=new DefaultComboBoxModel<String>();
	cmbModel.addElement(element);
	try {
	exQ(query);
	while(rs.next()){
	cmbModel.addElement(rs.getString(field));
	}
	return cmbModel;
	}
	catch(Exception e)
	{
	System.out.println("Loi: "+e);
	return null;
	}

	}
	// Id tá»± tÄƒng
	public int Ai(String tb,String ma)
	{
	    int id1=0,id2=0;
		String id = null;
		try {
			exQ("select * from "+tb+"");
				while(rs.next())
				{
					id = new String();
					id = rs.getString(ma);
					id1=Integer.parseInt(id);
					if(id1>=id2)
					{
						id2=id1;
					}
				}
				return id2+1;
			}
			catch(Exception ex){
		    System.out.println("DataProvider - lá»—i tá»± tÄƒng");
		    ex.printStackTrace();
			return id2;
			}
	}
	
	// Ä�áº¿m sá»‘ dÃ²ng 
	public String demDong(String query)
	{
		String soDong="";
		int countRow=0;
		try {
	        exQ(query);
				while(rs.next())
				{
					countRow++;
				}
				soDong=""+countRow;
				return soDong;
			}
			catch(Exception ex){
				System.out.println("DataProvider - lá»—i demDong: "+ex);
				return null;
			}
	}
	
	// láº¥y Ã´ Table
	public String getCell(String query,String col)
	{
		String cell="null";
		try {
			exQ(""+query+"");
				while(rs.next())
				{
					cell = rs.getString(col);;
				}
				return cell;
			}
			catch(SQLException ex){
		System.out.println("Lá»—i: "+ex);
				return "Lá»—i";
			}
	}
	

}

