package action;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import bean.ChiTietHopDong;
import bo.LoaiTaiSanBO;
import bo.ThongKeBO;
import form.ThongKeForm;

public class ThongKeAction extends DispatchAction{

	public ActionForward listkhachhang(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse respone)
			throws Exception {
			
		//thong ke khach hang
			/*ThongKeForm thongKeForm=(ThongKeForm) form;
			
			ThongKeBO thongKeBO=new ThongKeBO();
			
			String nam=thongKeForm.getNam();
			String thang=thongKeForm.getThang();
			
			int page=thongKeForm.getPage();
			
			int maxEntriesPerPage=0;
			
			System.out.println("tao la nam "+nam);
			
			ArrayList<KhachHang> list=new ArrayList<>();
			
			if ((thang==null || thang.length()==0)&&(nam==null || nam.length()==0)) {
				thongKeForm.setMassage("Vui lòng nhập năm,tháng !");
			}else{
				
				list=thongKeBO.getKhachHangByWord(Integer.parseInt(nam), 
						Integer.parseInt(thang));
				
				System.out.println(list.size()+" size");
				
				if (list.size()==0) {
					thongKeForm.setMassage("không có dữ liệu !");
				}else{
					
					//phan trang
					maxEntriesPerPage=list.size();
					page=1;
					
					int offset = maxEntriesPerPage * (page - 1);
					
					ArrayList<KhachHang> listPage=getListByOffsetAndLength(list,offset,maxEntriesPerPage);
					
					thongKeForm.setListKH(listPage);
					
					thongKeForm.setPagesKH(getPages(list, maxEntriesPerPage));
					
					thongKeForm.setSoLuong(list.size()+"");
					
					float tongTien=0;
					
					for (KhachHang khachHang : list) {
						tongTien+=khachHang.getChiTietHopDong().getSoTienCam();
					}
					
					thongKeForm.setTongTien(tongTien+"");
				}
			}*/
			
			return mapping.findForward("khachhang");
	}	

	public ActionForward listsanpham(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse respone)
			throws Exception {
		
		//thong ke san pham trong kho
		
		ThongKeForm thongKeForm=(ThongKeForm) form;
		
		LoaiTaiSanBO loaiTaiSanBO=new LoaiTaiSanBO();
		//ThongKeBO thongKeBO=new ThongKeBO();
		
		thongKeForm.setListLoaiTS(loaiTaiSanBO.getListLoaiTaiSan());
		
		/*String nam=thongKeForm.getNam();
		String thang=thongKeForm.getThang();
		String maLoaiTS=thongKeForm.getMaLoaiTS();
		
		if (nam == null || nam.length()==0) {
			thongKeForm.setMassage("vui long chọn năm ??");
		}else if (thang == null || thang.length()==0) {
			thongKeForm.setMassage("vui long chọn tháng ??");
		}else if (maLoaiTS==null ||  maLoaiTS.length()==0) {
			thongKeForm.setMassage("vui long chọn loại xe ??");
		}else{
			ArrayList<TaiSan> list=thongKeBO.getSanPhamByWord(Integer.parseInt(nam), Integer.parseInt(thang), 
					Integer.parseInt(maLoaiTS));
			
			if (list.size()==0) {
				thongKeForm.setMassage("Không có dữ liệu ??");
			} else {
				thongKeForm.setListTS(list);
				thongKeForm.setSoLuong(list.size()+"");
				
				float tongTien=0;
				for (TaiSan taiSan : list) {
					tongTien+=taiSan.getChiTietHopDong().getSoTienCam();
				}
				
				thongKeForm.setTongTien(tongTien+"");
			}
		}*/
		
		return mapping.findForward("sanpham");
	}

	public ActionForward listthanhtoan(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse respone)
			throws Exception {
		
		
		return mapping.findForward("doanhthu");
	}
	
	public ActionForward hopdonghethan(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse respone)
			throws Exception {
		
		ThongKeForm thongKeForm=(ThongKeForm) form;
		
		ThongKeBO thongKeBO=new ThongKeBO();
		
		int page=1;
		
		System.out.println("page "+thongKeForm.getPage());
		
		if (thongKeForm.getPage()!=0) {
			page=thongKeForm.getPage();
		}
		
		int maxEntriesPerPage=20;
		
		ArrayList<ChiTietHopDong> list=new ArrayList<>();
		ArrayList<ChiTietHopDong> listPages=new ArrayList<>();

		Collection<Integer> pages= new ArrayList<>();
		
		list=thongKeBO.getListHopDongHetHan();
		
		int offset = maxEntriesPerPage * (page - 1);
		
		listPages=getListByOffsetAndLength(list,offset,maxEntriesPerPage);
		pages=getPages(list,maxEntriesPerPage);
		
		thongKeForm.setListHDHH(listPages);
		thongKeForm.setPages(pages);
		
		System.out.println(thongKeForm.getListHDHH().size());
		
		return mapping.findForward("hopdong");
	}
	
	
	//get list by offset and length thong ke khach hang
		public ArrayList<ChiTietHopDong> getListByOffsetAndLength(ArrayList<ChiTietHopDong> list,int offset,int length ){
			
			ArrayList<ChiTietHopDong> arrayList = new ArrayList<>();
			
			//calc the to value
			int to = offset + length;
			//if offset or lenght exceed set them to list.size
			if(offset > list.size()) offset = list.size();
			if(to > list.size()) to = list.size();
			//add the list items to the return collection 
			for(int i=offset;i<to;i++){
				arrayList.add(list.get(i));
			}
			//return the collection
			return arrayList;
		}
	
	//get pages thong ke khach hang
		public Collection<Integer> getPages(ArrayList<ChiTietHopDong> list,int length){
			
			Collection<Integer> collection = new ArrayList<>(); 
			//calc how many pages are there
			int pages = list.size() / length;
			if(list.size() % length != 0)
				pages = pages + 1;
			
			//fill an collection with all pages
			for(int i=1;i<=pages;i++){
				collection.add(new Integer(i));
			}
			
			return collection;
		}
}
