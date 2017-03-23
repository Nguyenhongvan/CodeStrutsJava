package common;

import java.text.ParseException;
import common.DataProvider;

public class CellData extends DataProvider {

	/**
	 * HÃ m láº¥y tÃªn khÃ¡ch hÃ ng
	 * @param maCTHD
	 * @return TenKhachHang
	 */
	public String getTenKhachHang(int maCTHD) {
	String querry="select * from ChiTietHopDong,HopDong,KhachHang where KhachHang.MaKhachHang=HopDong.MaKhachHang and ChiTietHopDong.MaHopDong=HopDong.MaHopDong and MaCTHD='"+maCTHD+"'";
	return getCell(querry,"TenKhachHang");
	}
		
	/**
	 * HÃ m láº¥y ngÃ y cáº§m
	 * @param maCTHD
	 * @return NgayCam
	 */
	public String getNgayCam(int maCTHD)
	{
	String querry="select * from ChiTietHopDong where MaCTHD='"+maCTHD+"'";
	return getCell(querry,"NgayCam");
	}
	
	/**
	 * HÃ m kiá»ƒm tra CTHD Ä‘Ã£ dc gia háº¡n chÆ°a?!
	 * @param maCTHD
	 * @return boolean
	 */
	public boolean daGiaHan(int maCTHD)
	{
	String querry="select * from GiaHan,ChiTietHopDong where GiaHan.MaCTHD=ChiTietHopDong.MaCTHD and ChiTietHopDong.MaCTHD='"+maCTHD+"'";
	System.out.println(demDong(querry));
	if(demDong(querry).equals("0")) return false;
	return true;
	}
	
	/**
	 * HÃ m láº¥y ngÃ y báº¯t Ä‘áº§u gia háº¡n,
	 * 2 trÆ°á»�ng há»£p: cthd Ä‘Ã£ vÃ  chÆ°a gia háº¡n
	 * @param maCTHD
	 * @return NgayKetThuc+1ngay
	 * @throws ParseException
	 */
	public String getNgayBDGiaHan(int maCTHD) throws ParseException
	{
	XuLy tt=new XuLy();
	String querry;
	String ngayBDGiaHan=new String();
	// náº¿u Ä‘Ã£ gia háº¡n
	if(daGiaHan(maCTHD))
	{
	// láº¥y ngayTra trong ChiTietHopDong + 1
		querry="select * from GiaHan where MaCTHD='"+maCTHD+"'";
		ngayBDGiaHan=tt.congNgay(getCell(querry,"NgayKetThuc"),1);
	}
	else 
	{
	// chÆ°a gia háº¡n : láº¥y ngayTra trong GiaHan + 1
		querry="select * from ChiTietHopDong where MaCTHD='"+maCTHD+"'";
		ngayBDGiaHan=tt.congNgay(getCell(querry,"NgayTra"),1);
	}
	return ngayBDGiaHan;
	}
	
	/**
	 * Lay ngay ket thuc gia han
	 * @param maCTHD
	 * @return
	 * @throws ParseException
	 */
	public String getNgayKetThuc(int maCTHD) throws ParseException
	{
		String querry;
		String ngayBDGiaHan=new String();
		// náº¿u Ä‘Ã£ gia háº¡n
		if(daGiaHan(maCTHD))
		{
		// láº¥y ngayTra trong ChiTietHopDong + 1
			querry="select * from GiaHan where MaCTHD='"+maCTHD+"'";
			ngayBDGiaHan=getCell(querry,"NgayKetThuc");
		}
		else 
		{
		// chÆ°a gia háº¡n : láº¥y ngayTra trong GiaHan + 1
			querry="select * from ChiTietHopDong where MaCTHD='"+maCTHD+"'";
			ngayBDGiaHan=getCell(querry,"NgayTra");
		}
		return ngayBDGiaHan;
	}
	
	/**
	 * HÃ m láº¥y giÃ¡ cáº§m
	 * @param maCTHD
	 * @return GiaCam
	 */
	public float getGiaCam(int maCTHD)
	{
	String querry="select * from ChiTietHopDong where MaCTHD='"+maCTHD+"'";
	return Float.parseFloat(getCell(querry,"SoTienCam"));
	}
	
	/**
	 * Ham lay tien gia han 1 ngay
	 * @param maLaiSuat
	 * @return
	 */
	public float getTienGH1Ngay(int maLaiSuat)
	{
	String querry="select * from LaiSuat where MaLaiSuat='"+maLaiSuat+"'";	
	return Float.parseFloat(getCell(querry,"TienGiaHan"));
	}
	
	/**
	 * Ham lay so CMND
	 * @param maCTHD
	 * @return
	 */
	public String getSoCMND(int maCTHD)
	{
	String querry="Select * from ChiTietHopDong,HopDong,KhachHang where ChiTietHopDong.MaHopDong=HopDong.MaHopDong and HopDong.MaKhachHang=KhachHang.MaKhachHang";
	return getCell(querry,"CMND");
	}
	
	public static void main(String[] args) {
		CellData c=new CellData();
		System.out.println(c.getSoCMND(1));
	}
}
