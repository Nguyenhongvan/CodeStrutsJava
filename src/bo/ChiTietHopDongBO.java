package bo;

import java.text.ParseException;
import java.util.ArrayList;

import bean.ChiTietHopDong;
import bean.LoaiTaiSan;
import dao.ChiTietHopDongDAO;

import common.MaTuTang;
import common.XuLy;

public class ChiTietHopDongBO {
	MaTuTang maTuTang=new MaTuTang();
	ChiTietHopDongDAO chiTietHopDongDAO=new ChiTietHopDongDAO();
	int maTaiSan;
	public ArrayList<LoaiTaiSan> getListDanhMuc() {
		return chiTietHopDongDAO.getListDanhMuc();
	}

	public ArrayList<ChiTietHopDong> getListChiTietHopDong(int maHopDong) {
		return chiTietHopDongDAO.getListChiTietHopDong(maHopDong);
	}

	public boolean themChiTietHopDong(int maHopDong, String ngayTra, float giaCam) throws ParseException {
		//lấy maCTHD
		int maCTHD=maTuTang.getMaCTHD();
		
		System.out.println("ChiTietHopDongBO/themChiTietHopDong/giaCam: "+giaCam);
		System.out.println("ChiTietHopDongBO/themChiTietHopDong/ngayTra: "+ngayTra);
		
		//lấy mã lãi suất
		XuLy xuLy=new XuLy();
		
		int maLaiSuat=xuLy.maLaiSuat(xuLy.ngayHt,ngayTra,giaCam);
		
		//test mã lãi suất
		System.out.println("ChiTietHopDongBO/themChiTietHopDong - maLaiSuat: "+maLaiSuat);
		
		//mã đóng lãi xử lý sau
		int maDongLai=0;
		
		//mã tài sản
		maTaiSan=maTuTang.getMaTaiSan();
		//ngày cầm 
		String ngayCam=xuLy.ngayHt;
		
		//tình trạng, chưa chưa hết hạn =1
		int tinhTrang=1;
		
		float tienThanhToan=xuLy.getTienThanhToan(maLaiSuat,giaCam);
		// số ti�?n hoặc tgian hopdong quá giới hạn
		if(maLaiSuat==0) return false;
		return chiTietHopDongDAO.themChiTietHopDong(maCTHD,maHopDong,maLaiSuat,maDongLai,maTaiSan,ngayCam,ngayTra,giaCam,tinhTrang,tienThanhToan);
	}
	
	public boolean themTaiSan(int maDanhMuc, String tenTaiSan, String moTaTaiSan,String urlHinhAnh) {
		int tinhTrang=1;
		//String urlHinhAnh="Chưa xu ly";
		return chiTietHopDongDAO.themTaiSan(maTaiSan,maDanhMuc,tenTaiSan,tinhTrang,moTaTaiSan,urlHinhAnh);
	}
}
