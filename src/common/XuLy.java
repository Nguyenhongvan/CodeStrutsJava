package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import common.DataProvider;

public class XuLy extends DataProvider{	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	public String ngayHt=sdf.format(cal.getTime());

	public int demNgay(String ngayBatDau,String ngayKetThuc) throws ParseException
	{
		 Calendar cal1 = new GregorianCalendar();
	     Calendar cal2 = new GregorianCalendar();

	     Date date = sdf.parse(ngayBatDau);
	     cal1.setTime(date);
	     date = sdf.parse(ngayKetThuc);
	     cal2.setTime(date);
	     return (int)( (cal2.getTime().getTime() - cal1.getTime().getTime()) / (1000 * 60 * 60 * 24));
	}
	
	public int maLaiSuat(String ngayBatDau,String ngayKetThuc,float soTienCam) throws ParseException
	{
	int soNgay=demNgay(ngayBatDau,ngayKetThuc);
	System.out.println("So ngay: "+soNgay);
	if(soNgay<=90)
	{
		if(0<soTienCam&&soTienCam<=20000) return 1;
		if(20000<soTienCam&&soTienCam<=40000) return 2;
		if(40000<soTienCam&&soTienCam<=60000) return 3;
		if(60000<soTienCam&&soTienCam<=80000) return 4;
	}
	else if(90<soNgay&&soNgay<=180)
	{
		if(0<soTienCam&&soTienCam<=20000) return 3;
		if(20000<soTienCam&&soTienCam<=40000) return 4;
		if(40000<soTienCam&&soTienCam<=60000) return 5; 
		if(60000<soTienCam&&soTienCam<=80000) return 6;
	}
	else if(180<soNgay&&soNgay<=270)
	{
		if(0<soTienCam&&soTienCam<=20000) return 5;
		if(20000<soTienCam&&soTienCam<=40000) return 6;
		if(40000<soTienCam&&soTienCam<=60000) return 7; 
		if(60000<soTienCam&&soTienCam<=80000) return 8;
	}
	else if(270<soNgay&&soNgay<=360)
	{
		if(0<soTienCam&&soTienCam<=20000) return 7;
		if(20000<soTienCam&&soTienCam<=40000) return 8;
		if(40000<soTienCam&&soTienCam<=60000) return 9;
		if(60000<soTienCam&&soTienCam<=80000) return 10;
	}
	return 0;
	}
	
	public float getMucLaiSuat(int maLaiSuat)
	{
	String querry="select * from LaiSuat where MaLaiSuat="+maLaiSuat+"";
	return Float.parseFloat(getCell(querry,"MucLaiSuat"));
	}
	
	//sá»­a sau
	public float getTienThanhToan(int maLaiSuat,float giaCam)
	{
	float mucLaiSuat=getMucLaiSuat(maLaiSuat);
	return giaCam+giaCam*mucLaiSuat/100;
	}
	
	// cá»™ng ngÃ y
	public String congNgay(String ngayBatDau, int soNgay) throws ParseException
	{
		Date date=sdf.parse(ngayBatDau);
		cal.setTime(date);
		cal.add(Calendar.DATE, soNgay); 
		String output = sdf.format(cal.getTime());
		return output;
	}
	
	// danh sÃ¡ch ngÃ y
	public List<String> danhSachNgay(String ngayBatDau,String ngayKetThuc,int chuKyNgay) throws ParseException
	{
		List<String> dsNgay=new ArrayList<String>();
		boolean check=false;
		String ngayToi="";
		int i=0;
		while(!check)
		{
		i++;
			if(i==1) ngayToi=ngayBatDau;
			else
			{
			ngayToi=congNgay(ngayToi,chuKyNgay);
			if(demNgay(ngayToi,ngayKetThuc)<0) 
				{
				ngayToi=ngayKetThuc;
				check=true;
				}		
			}
		dsNgay.add(ngayToi);
		}
		return dsNgay;
	}
	
	public List<Float> getTienDongLai(float tienLai,int soLanDong)
	{
	List<Float> tien = new ArrayList<>();
	float tienChan=tienLai/(soLanDong-1);
	tien.add(tienChan);
	float tienLe=tienLai-tienChan;
	tien.add(tienLe);
	return tien;
	}

	public static void main(String[] args) throws ParseException{
		XuLy tt=new XuLy();
		System.out.println("Ngay Ht: "+tt.ngayHt);
		System.out.println("MÃ£ lai suat: "+tt.maLaiSuat(tt.ngayHt,"2017-7-6",60000));
		System.out.println("Tiá»�n thanh toÃ¡n: "+tt.getTienThanhToan(1,2));
		
		System.out.println("Ä�áº¿m ngÃ y: "+tt.demNgay("2017-7-6", "2017-7-10"));
		
	//	System.out.println("Cong ngay: "+tt.congNgay("2017-3-1",5));
		for(String s:tt.danhSachNgay("2017-2-6","2017-7-6",7))
		{
			System.out.println(s);
		}
		
		for(Float tien:tt.getTienDongLai(12000, 5))
		{
			System.out.println("tien chan: "+tien);
		}
	}
}
