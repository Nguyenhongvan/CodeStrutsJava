package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ChiTietHopDong;
import bean.LoaiTaiSan;
import bo.ChiTietHopDongBO;
import common.Utilities;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.ChiTietHopDongForm;

public class ChiTietHopDongAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ChiTietHopDongBO cthdBO=new ChiTietHopDongBO();
		ChiTietHopDongForm chiTietHopDongForm=(ChiTietHopDongForm) form;
		
		Utilities utilities=new Utilities();
		
		/**
		 * GÃ¡Â»ï¿½i session
		 */
		HttpSession session=request.getSession();
		Integer maHopDong=chiTietHopDongForm.getMaHopDong();
		
		//kiÃ¡Â»Æ’m tra maHopDong cÃƒÂ³ tÃ¡Â»â€œn tÃ¡ÂºÂ¡i!?
		if(maHopDong==0)
			{
				maHopDong=Integer.parseInt((String) 
				session.getAttribute("maHopDong"));			
			}
		// lÃ†Â°u maHopDong lÃƒÂªn session
		session.setAttribute("maHopDong",String.valueOf(maHopDong));
		
		//test maHopDong
		System.out.println("maHopDong:"+maHopDong);
		
		
		/**
		 * check event
		 */
		// event datHopDong
		String datHopDong=chiTietHopDongForm.getDatHopDong();
		//test datHopDong
		System.out.println("ChiTietHopDongAction/datHopDong: "+datHopDong);
		
		// lÃ¡ÂºÂ¥y input tÃ¡Â»Â« browser
		int maDanhMuc=chiTietHopDongForm.getMaDanhMuc();
		String tenTaiSan=chiTietHopDongForm.getTenTaiSan();
		String moTaTaiSan=chiTietHopDongForm.getMoTaTaiSan();
		float giaCam=chiTietHopDongForm.getSoTienCam();
		String ngayTra=chiTietHopDongForm.getNgayTra();
		
		if("Đặt hợp đồng".equals(datHopDong))
		{
			/**
			 * 
			 */		
			//test 
			System.out.println("test thông tin - ChiTietHopDongAction:");
			System.out.println("maDanhMuc: "+maDanhMuc);
			System.out.println("tenTaiSan: "+tenTaiSan);
			System.out.println("moTaTaiSan: "+moTaTaiSan);
			System.out.println("giaCam: "+giaCam);
			System.out.println("hopDongDen: "+ngayTra);
			
			String filePathDr = getServlet().getServletContext().getRealPath("/") +"images";
			String url=utilities.loadImage(filePathDr, chiTietHopDongForm.getFile());
			//insert database
			if(cthdBO.themChiTietHopDong(maHopDong,ngayTra,giaCam)){
				cthdBO.themTaiSan(maDanhMuc,tenTaiSan,moTaTaiSan,url);
				return mapping.findForward("thanhcong");
			}else 
				return mapping.findForward("thatbai");
		}
		
		//event xemTruoc
		String xemTruoc=chiTietHopDongForm.getXemTruoc();
		
		//test xemTruoc
		System.out.println("ChiTietHopDongAction/xemTruoc: "+xemTruoc);
		/*if("Xem trước".equals(xemTruoc))
		{
			// chuyÃ¡Â»Æ’n qua TinhToanAction
			session.setAttribute("ngayTra",String.valueOf(ngayTra));
			session.setAttribute("giaCam",String.valueOf(giaCam));
			*//**
			 * chuyen sang trang tinhPhi.jsp
			 *//*
			return mapping.findForward("phiHopDong");
		}*/
		/**
		 * server
		 */
		//lay danh sach danh muc 
		ArrayList<LoaiTaiSan> listDanhMuc=new ArrayList<LoaiTaiSan>();
		listDanhMuc=cthdBO.getListDanhMuc();
		
		// lay danh sach chi tiet hop dong
		ArrayList<ChiTietHopDong> listChiTietHopDong=new ArrayList<ChiTietHopDong>();
		listChiTietHopDong=cthdBO.getListChiTietHopDong(maHopDong);
		
		/**
		 * client
		 */
		// 
		chiTietHopDongForm.setListDanhMuc(listDanhMuc);
		//
		chiTietHopDongForm.setListChiTietHopDong(listChiTietHopDong);
		
		//
		return mapping.getInputForward();
	}
}
