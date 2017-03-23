package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.ChiTietHopDong;
import bean.KhachHang;
import bean.LaiSuat;
import bean.LoaiTaiSan;
import bean.TaiSan;
import common.DataProvider;

public class ChiTietHopDongDAO extends DataProvider {

	public ArrayList<LoaiTaiSan> getListDanhMuc(){
		String querry="select * from LoaiTaiSan";
		LoaiTaiSan loaiTaiSan;
		ArrayList<LoaiTaiSan> list=new ArrayList<LoaiTaiSan>();
		try {
		ResultSet rs=exQ(querry);
		while(rs.next())
		{
			loaiTaiSan=new LoaiTaiSan();
			loaiTaiSan.setMaLoaiTaiSan(rs.getInt("MaLoaiTaiSan"));
			loaiTaiSan.setTenLoaiTaiSan(rs.getString("TenLoaiTaiSan"));
			list.add(loaiTaiSan);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ChiTietHopDong> getListChiTietHopDong(int maHopDong) {
	String querry="select cthd.MaCTHD,kh.TenKhachHang,kh.DiaChi,ts.TenTaiSan,ts.MoTa,cthd.NgayCam,cthd.NgayTra,cthd.SoTienCam,ls.MucLaiSuat,cthd.TienThanhToan from ChiTietHopDong as cthd,TaiSan as ts,HopDong as hd, KhachHang as kh, LaiSuat as ls where cthd.MaTaiSan=ts.MaTaiSan and cthd.MaLaiSuat=ls.MaLaiSuat and hd.MaHopDong=cthd.MaHopDong and hd.MaKhachHang=kh.MaKhachHang and hd.MaHopDong="+maHopDong+" order by MaCTHD";
	
	ArrayList<ChiTietHopDong> listCTHD=new ArrayList<ChiTietHopDong>();
	ChiTietHopDong cthd;
	try {
		ResultSet rs=exQ(querry);
		while(rs.next())
		{
			cthd=new ChiTietHopDong();
			cthd.setMaCTHD(rs.getInt("MaCTHD"));
			
			KhachHang khachHang=new KhachHang();
			khachHang.setTenKhachHang(rs.getString("TenKhachHang"));
			khachHang.setDiaChi(rs.getString("DiaChi"));
			cthd.setKhachHang(khachHang);
			
			TaiSan taiSan=new TaiSan();
			taiSan.setTenTaiSan(rs.getString("TenTaiSan"));
			taiSan.setMoTa(rs.getString("MoTa"));
			cthd.setTaiSan(taiSan);
			
			cthd.setNgayCam(rs.getString("NgayCam"));
			cthd.setNgayTra(rs.getString("NgayTra"));
			cthd.setSoTienCam(rs.getFloat("SoTienCam"));
			
			LaiSuat laiSuat=new LaiSuat();
			laiSuat.setMucLaiSuat(rs.getFloat("MucLaiSuat"));
			cthd.setLaiSuat(laiSuat);
			
			cthd.setTienThanhToan(rs.getFloat("TienThanhToan"));
			
			listCTHD.add(cthd);
		
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return listCTHD;
	}
	
	public boolean themTaiSan(int maTaiSan, int maDanhMuc, String tenTaiSan, int tinhTrang, String moTaTaiSan,String urlHinhAnh) {
		boolean check=false;
		String querry="insert into TaiSan values('"+maTaiSan+"','"+maDanhMuc+"','"+tenTaiSan+"','"+tinhTrang+"','"+moTaTaiSan+"','"+urlHinhAnh+"')";
		try {
			exU(querry);
			check=true;
			System.out.println("ChiTietHopDongDAO/themTaiSan: success!");
		} catch (SQLException e) {
			System.out.println("ChiTietHopDongDAO/themTaiSan: lỗi cmnr!");
			check=false;
			e.printStackTrace();
		}
		return check;
	}

	public boolean themChiTietHopDong(int maCTHD, int maHopDong, int maLaiSuat,int maDongLai, int maTaiSan,
	String ngayCam, String ngayTra,float giaCam, int tinhTrang,float tienThanhToan) {
	String querry="insert into ChiTietHopDong values('"+maCTHD+"','"+maHopDong+"','"+maLaiSuat+"','"+maDongLai+"','"+maTaiSan+"','"+ngayCam+"','"+ngayTra+"','"+giaCam+"','"+tinhTrang+"','"+tienThanhToan+"')";
	try {
	exU(querry);
	System.out.println("ChiTietHopDongDAO/themChiTietHopDong: success!");
	return true;
	} catch (SQLException e) {
	System.out.println("ChiTietHopDongDAO/themChiTietHopDong: Lỗi cmnr!");
	e.printStackTrace();
	}
	return false;
	}
}
