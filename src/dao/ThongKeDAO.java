package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.ChiTietHopDong;
import bean.DongTienLai;
import bean.KhachHang;
import bean.LaiSuat;
import bean.TaiSan;
import common.ConnectData;
import common.XuLyChuoi;

public class ThongKeDAO extends ConnectData{
	private Statement st=null;
	private ResultSet rs=null;
	
	public ArrayList<KhachHang> getKhachHangByWord(int nam,int thang){
		ArrayList<KhachHang> list=new ArrayList<KhachHang>();
		try {
			String sql="select * from KhachHang inner join HopDong on KhachHang.MaKhachHang=HopDong.MaKhachHang"
					+ " inner join ChiTietHopDong on HopDong.MaHopDong=ChiTietHopDong.MaHopDong "
					+ "inner join TaiSan on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan where YEAR(ChiTietHopDong.NgayCam)="+nam+" "
					+ "and MONTH(ChiTietHopDong.NgayCam)="+thang+"";
			st=getConnect().createStatement();
			rs=st.executeQuery(sql);
			while (rs.next()) {
				KhachHang khachHang=new KhachHang(String.valueOf(rs.getInt(1)),rs.getString(2),XuLyChuoi.sGioiTinh(rs.getInt(3))
						,rs.getString(4),rs.getString(5));
				
				ChiTietHopDong chiTietHopDong=new ChiTietHopDong();
				//chiTietHopDong.setMaHopDong(rs.getInt(6));
				
				Date dateNgayCam=new Date(rs.getDate(13).getTime());
				Date dateNgayTra=new Date(rs.getDate(14).getTime());
				
				chiTietHopDong.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayCam));
				chiTietHopDong.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayTra));
				chiTietHopDong.setSoTienCam(rs.getInt(15));
				
				TaiSan taiSan=new TaiSan();
				taiSan.setTenTaiSan(rs.getString(20));
				
				khachHang.setChiTietHopDong(chiTietHopDong);
				khachHang.setTaiSan(taiSan);
				
				list.add(khachHang);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<TaiSan> getSanPhamByWord(int nam,int thang,int maLoai){
		ArrayList<TaiSan> list=new ArrayList<TaiSan>();
		try {
			String sql="select TaiSan.*,LoaiTaiSan.TenLoaiTaiSan,ChiTietHopDong.NgayCam,"
					+ "ChiTietHopDong.NgayTra,ChiTietHopDong.SoTienCam "
					+ "from TaiSan inner join LoaiTaiSan on TaiSan.MaLoaiTaiSan=LoaiTaiSan.MaLoaiTaiSan "
					+ "inner join ChiTietHopDong on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan "
					+ "where YEAR(ChiTietHopDong.NgayCam)="+nam+" and MONTH(ChiTietHopDong.NgayCam)="+thang+" "
					+ "and LoaiTaiSan.MaLoaiTaiSan="+maLoai+"";
			st=getConnect().createStatement();
			rs=st.executeQuery(sql);
			while (rs.next()) {
				
				TaiSan taiSan=new TaiSan();
				
				taiSan.setMaTaiSan(rs.getInt(1));
				taiSan.setTenLoaiTaiSan(rs.getString(7));
				taiSan.setTenTaiSan(rs.getString(3));
				taiSan.setTinhTrang(rs.getInt(4));
				taiSan.setHinhAnh(rs.getString(5));
				
				ChiTietHopDong chiTietHopDong=new ChiTietHopDong();
				chiTietHopDong.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate(8)));
				chiTietHopDong.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(rs.getDate(9)));
				chiTietHopDong.setSoTienCam(rs.getInt(10));
				
				taiSan.setChiTietHopDong(chiTietHopDong);
				
				list.add(taiSan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			getConnect();
		}
		return list;
	}
	
	public ArrayList<ChiTietHopDong> getListHopDongHetHan(){
		ArrayList<ChiTietHopDong> list=new ArrayList<ChiTietHopDong>();
		
		String strDate=new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(new Date());
		Date date=null;
		try {
			date=new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(strDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println(""+date);
		java.sql.Date currentDate=new java.sql.Date(date.getTime());
		System.out.println("sql "+currentDate);
		
		try {
			String sql="select ChiTietHopDong.MaCTHD,TenKhachHang,MucLaiSuat,DongTienLai.TinhTrang,TenTaiSan,NgayCam,NgayTra,ChiTiethopDong.TinhTrang,"
					+ "DATEDIFF(DAY,'"+currentDate+"',NgayTra) as subDay "
					+ "from KhachHang inner join HopDong on KhachHang.MaKhachHang=HopDong.MaKhachHang "
					+ "inner join ChiTietHopDong on HopDong.MaHopDong=ChiTietHopDong.MaHopDong "
					+ "inner join TaiSan on TaiSan.MaTaiSan=ChiTietHopDong.MaTaiSan "
					+ "inner join LaiSuat on LaiSuat.MaLaiSuat=ChiTietHopDong.MaLaiSuat "
					+ "inner join DongTienLai on DongTienLai.MaCTHD=ChiTietHopDong.MaCTHD "
					+ "where DATEDIFF(DAY,'"+currentDate+"',NgayTra)>0 and DATEDIFF(DAY,'"+currentDate+"',NgayTra)<4 and TaiSan.MaTaiSan in(select MaTaiSan from ThanhLy)";
			st=getConnect().createStatement();
			
			rs=st.executeQuery(sql);
			while (rs.next()) {
				
				ChiTietHopDong cTHD=new ChiTietHopDong();
				
				cTHD.setMaCTHD(rs.getInt(1));
				/*System.out.println("Abc"+rs.getDate(6));
				System.out.println("Abcd"+rs.getString("NgayTra"));*/
				Date dateNgayCam=new Date(rs.getDate(6).getTime());
				Date dateNgayTra=new Date(rs.getDate(7).getTime());
				
				cTHD.setNgayCam(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayCam));
				cTHD.setNgayTra(new SimpleDateFormat("dd/MM/yyyy").format(dateNgayTra));
				cTHD.setTinhTrang(rs.getInt(8));
				
				KhachHang khachHang=new KhachHang();
				khachHang.setTenKhachHang(rs.getString(2));
				cTHD.setKhachHang(khachHang);
				
				DongTienLai tt=new DongTienLai();
				tt.setTinhTrang(rs.getInt(4));
				cTHD.setDongTienLai(tt);
				
				LaiSuat laiSuat=new LaiSuat();
				laiSuat.setMucLaiSuat(rs.getFloat(3));
				cTHD.setLaiSuat(laiSuat);
				
				TaiSan taiSan=new TaiSan();
				taiSan.setTenTaiSan(rs.getString(5));
				cTHD.setTaiSan(taiSan);
				
				list.add(cTHD);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			getConnect();
		}
		return list;
	}
}
