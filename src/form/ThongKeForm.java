package form;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import bean.ChiTietHopDong;
import bean.KhachHang;
import bean.LoaiTaiSan;
import bean.TaiSan;
import net.sf.json.JSONArray;

public class ThongKeForm extends ActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int page;
	private String massage;
	private String nam;
	private String thang;
	
	private String soLuong;
	private String tongTien;
	
	private JSONArray array;
	
	//thống kê khách hàng
	private ArrayList<KhachHang> listKH;
	private Collection<Integer> pages;
	
	//thống kê sản phẩm
	private ArrayList<TaiSan> listTS;
	private ArrayList<LoaiTaiSan> listLoaiTS;
	private String maLoaiTS;
	
	//hợp đông sắp hết hạn
	private ArrayList<ChiTietHopDong> listHDHH;
	
	
	public Collection<Integer> getPages() {
		return pages;
	}

	public void setPages(Collection<Integer> pagesKH) {
		this.pages = pagesKH;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public JSONArray getArray() {
		return array;
	}

	public void setArray(JSONArray array) {
		this.array = array;
	}

	public ArrayList<ChiTietHopDong> getListHDHH() {
		return listHDHH;
	}

	public void setListHDHH(ArrayList<ChiTietHopDong> listHDHH) {
		this.listHDHH = listHDHH;
	}

	public String getMaLoaiTS() {
		return maLoaiTS;
	}

	public void setMaLoaiTS(String tenLoaiTS) {
		this.maLoaiTS = tenLoaiTS;
	}

	public ArrayList<LoaiTaiSan> getListLoaiTS() {
		return listLoaiTS;
	}

	public void setListLoaiTS(ArrayList<LoaiTaiSan> listLoaiTS) {
		this.listLoaiTS = listLoaiTS;
	}

	public ArrayList<TaiSan> getListTS() {
		return listTS;
	}

	public void setListTS(ArrayList<TaiSan> listTS) {
		this.listTS = listTS;
	}

	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public String getTongTien() {
		return tongTien;
	}

	public void setTongTien(String tongTien) {
		this.tongTien = tongTien;
	}

	public ArrayList<KhachHang> getListKH() {
		return listKH;
	}

	public void setListKH(ArrayList<KhachHang> listKH) {
		this.listKH = listKH;
	}

	public String getNam() {
		return nam;
	}

	public void setNam(String nam) {
		this.nam = nam;
	}

	public String getThang() {
		return thang;
	}

	public void setThang(String thang) {
		this.thang = thang;
	}

	public String getMassage() {
		return massage;
	}

	public void setMassage(String massage) {
		this.massage = massage;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
		super.reset(mapping, request);
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
