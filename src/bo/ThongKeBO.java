package bo;

import java.util.ArrayList;

import bean.ChiTietHopDong;
import bean.KhachHang;
import bean.TaiSan;
import dao.ThongKeDAO;

public class ThongKeBO {
	public ThongKeBO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<KhachHang> getKhachHangByWord(int nam,int thang){
		return new ThongKeDAO().getKhachHangByWord(nam, thang);
	}
	
	public ArrayList<TaiSan> getSanPhamByWord(int nam,int thang,int maLoai){
		return new ThongKeDAO().getSanPhamByWord( nam, thang, maLoai);
	}
	
	public ArrayList<ChiTietHopDong> getListHopDongHetHan(){
		return new ThongKeDAO().getListHopDongHetHan();
	}
}
