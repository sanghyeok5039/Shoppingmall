package com.shoppingmall.order;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;

import com.shoppingmall.dao.BasketCUDDao;
import com.shoppingmall.dao.IBasketDao;
import com.shoppingmall.dao.IMembersDao;
import com.shoppingmall.dao.IOrdersDao;
import com.shoppingmall.dao.IOrdersDetailDao;
import com.shoppingmall.dao.IPoint_InOutDao;
import com.shoppingmall.dao.IProductDao;
import com.shoppingmall.dao.IProductDetailDao;
import com.shoppingmall.dao.IProduct_InOutDao;
import com.shoppingmall.dto.BasketDto;
import com.shoppingmall.dto.CountDto;
import com.shoppingmall.dto.MbrDto;
import com.shoppingmall.dto.MembersDto;
import com.shoppingmall.dto.OrdDto;
import com.shoppingmall.dto.OrderListDto;
import com.shoppingmall.dto.OrdersDetailDto;
import com.shoppingmall.dto.Point_inoutDto;
import com.shoppingmall.dto.ProductDetailDto;
import com.shoppingmall.dto.ProductDto;
import com.shoppingmall.dto.Product_InOutDto;

@Service("osvc")
public class OrdersService implements IOrderService {
	
	@Autowired
	private IProductDao pdao;
	@Autowired
	private IProductDetailDao pddao;
	@Autowired
	private IOrdersDao odao;
	@Autowired
	private IOrdersDetailDao oddao;
	@Autowired
	private IMembersDao mdao;
	@Autowired
	private IProduct_InOutDao piodao;
	@Autowired
	private IPoint_InOutDao ptiodao;
	@Autowired
	private IBasketDao bsdao;
	@Autowired
	private BasketCUDDao bscdao;
	int maxcount=12;
	
	/* (non-Javadoc)
	 * @see com.test.Score.IOrderSvc#insert(com.test.Score.OrdersDto)
	 */
	@Override
	@Transactional
	public String insert(HttpServletRequest request,Model model) {
		String[] num=request.getParameterValues("num");
		String[] product_id=request.getParameterValues("product_id");
		String[] product_detail_id=request.getParameterValues("product_detail_id");
		String[] card=request.getParameterValues("card");
		String[] bank=request.getParameterValues("bank");
		String mbr_adres=request.getParameter("mbr_adres");
		String mbr_name=request.getParameter("mbr_name");
		String mbr_tel=request.getParameter("mbr_tel");
		String mbr_pw=request.getParameter("mbr_pw");
		String mbr_email=request.getParameter("mbr_email");
		String totalprice=request.getParameter("set");
		String pt_in=request.getParameter("pointin");
		String pt_out=request.getParameter("pointset");
		String mbr_id=(String) request.getAttribute("mbr_id");
		String tp=request.getParameter("tp");
		Date date = new Date();
		String payment="";
		try {
		int number=odao.count()+1;
		MembersDto mdto=mdao.search(mbr_id);
		MembersDto set = new MembersDto();
		System.out.println(mdto.getMbr_level());
		if(mdto.getMbr_level().equals("9")) { //비회원일경우 id 생성
			int nonid = mdao.countnon();
			set.setMbr_adres(mbr_adres);
			set.setMbr_brthdy("0");
			set.setMbr_email(mbr_email);
			set.setMbr_grade("0");
			set.setMbr_rgsde("0");
			set.setMbr_id(Integer.toString(nonid+1));
			set.setMbr_level("8");			//level은 8으로 함
			set.setMbr_name(mbr_name);
			set.setMbr_point("0");
			set.setMbr_pw(mbr_pw);
			set.setMbr_secsn("0");
			set.setMbr_sex("0");
			set.setMbr_tel(mbr_tel);
			mdao.insertnon(set);
			
			OrdDto odto = new OrdDto();
			odto.setMbr_id(set.getMbr_id());
			odto.setOrds_date(date);
			odto.setOrds_state("0");
			odto.setOrds_delv_adres(mbr_adres);
			odto.setOrds_delv_state("0");
			odto.setOrds_total(totalprice);
			if(card != null) {
				payment="카드"+card[0]+card[1];
			}
			else if(bank != null) {
				payment="통장"+bank[0]+bank[1];
			}
			odto.setOrds_payment_state(payment);
			odto.setOrds_number(number);
			odao.insert(odto);
		} else {
			OrdDto odto = new OrdDto();
			odto.setMbr_id(mbr_id);
			odto.setOrds_date(date);
			odto.setOrds_state("0");
			odto.setOrds_delv_adres(mbr_adres);
			odto.setOrds_delv_state("0");
			odto.setOrds_total(totalprice);
			if(card != null) {
				payment="카드"+card[0]+card[1];
			}
			else if(bank != null) {
				payment="통장"+bank[0]+bank[1];
			}
			odto.setOrds_payment_state(payment);
			odto.setOrds_number(number);
			odao.insert(odto);
	
			int pointout = Integer.parseInt(mdto.getMbr_point())-Integer.parseInt(pt_out);
			if(pointout<0) {
				throw new RuntimeException("Exception for rollback");
			} else if(Integer.parseInt(pt_out)>Integer.parseInt(tp)) {
				throw new RuntimeException("Exception for rollback");
			}
			int pointin=Integer.parseInt(pt_in);
			mdto.setMbr_point(Integer.toString(pointout+pointin));
			mdao.pointupdate(mdto);
			Point_inoutDto ptiodto = new Point_inoutDto();
			ptiodto.setMbr_id(mbr_id);
			ptiodto.setPt_date(date);
			ptiodto.setPt_in(pt_in);
			ptiodto.setPt_out(pt_out);
			ptiodao.insert(ptiodto);
		}
		
		for(int i =0 ;num.length>i;i++) {
			ProductDetailDto pddto=pddao.searchOne(product_detail_id[i]);
			int count = Integer.parseInt(pddto.getProduct_count())-Integer.parseInt(num[i]);
			if(count<0) {
				throw new RuntimeException("Exception for rollback");
			}
			pddto.setProduct_count(Integer.toString(count));
			pddao.countupdate(pddto);
			OrdersDetailDto oddto=new OrdersDetailDto();
			oddto.setOrds_detail_count(num[i]);
			oddto.setProduct_detail_id(product_detail_id[i]);
			oddto.setOrds_date(date);
			if(mdto.getMbr_level().equals("9")) {
				oddto.setMbr_id(set.getMbr_id());
			} else {
				oddto.setMbr_id(mbr_id);
			}
			oddto.setProduct_id(product_id[i]);
			oddao.insert(oddto);
			Product_InOutDto piodto = new Product_InOutDto();
			piodto.setPrd_out(num[i]);
			piodto.setPrd_in("0");
			piodto.setproduct_detail_id(product_detail_id[i]);
			piodto.setPrd_inout_date(date);
			piodao.insert(piodto);
			BasketDto bdto = new BasketDto();
			BasketDto bTemp = null;
			bdto.setMbr_id(mbr_id);
			bdto.setProduct_detail_id(product_detail_id[i]);
			bTemp = bscdao.getBskt(bdto.getMbr_id(), bdto.getProduct_detail_id());
			
			if(bTemp == null) {
				
			} else {
				bsdao.delete(bdto);
			}		
		}
		} catch (RuntimeException e1) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "ordererror";
		}
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.test.Score.IOrderSvc#search(java.lang.String, org.springframework.ui.Model)
	 */
	@Override
	public String search(String mbr_id, Model model) {
		String go="null";
		MembersDto dto = mdao.search(mbr_id);
		model.addAttribute("mbr",dto);
		if(dto!=null) {
			go="show";
		} else {
			go="showNon";
		}
		return go;
	}
	
	/* (non-Javadoc)
	 * @see com.test.Score.IOrderSvc#directopen(java.lang.String, java.lang.String, java.lang.String, org.springframework.ui.Model)
	 */
	@Override
	public String directopen(String product_id,String num, String mbr_id,String product_detail_id,Model model) {
		ProductDto pdto= pdao.searchOne(product_id);
		ProductDetailDto pddto = pddao.searchOne(product_detail_id);
		MembersDto mdto= mdao.search(mbr_id);
		int count = Integer.parseInt(pddto.getProduct_count());
		int num1 = Integer.parseInt(num);
		if(count<num1) {
			return "error";
		}
		int price = 0;
		int delivery = 2500;
		price= Integer.parseInt(pddto.getProduct_price())*num1;
		if(price>=50000) {
			delivery=0;
		}
		pddto.setProduct_size(pddto.getProduct_color()+pddto.getProduct_size());
		List<OrderListDto> list = new ArrayList<OrderListDto>();
		OrderListDto dto = new OrderListDto();
		dto.setNum(num);
		dto.setPdto(pdto);
		dto.setPddto(pddto);
		dto.setTotal(Integer.toString(price));
		list.add(dto);
		
		model.addAttribute("list",list);
		model.addAttribute("delivery",delivery);
		model.addAttribute("mdto",mdto);
		model.addAttribute("totalprice",price+delivery);
		model.addAttribute("point",(price+delivery)/10);
		return null;
	}
	
	@Override
	public void List(Model model,HttpServletRequest request,HttpSession session) {
		MbrDto mdto = (MbrDto) session.getAttribute("loginUser");
		String id = null;
		if(mdto!=null) {
			id=mdto.getMbr_id();
		} else {
			id=request.getParameter("mbr_id");
		}
		int count=odao.countId(id);
		if(count == 0) {
			return;
		}
		
		int startNum=Integer.parseInt(request.getParameter("startNum"));
		
		int startRow= (startNum - 1) * maxcount + 1;;
		CountDto dto= new CountDto();
		dto.setPageNum(maxcount);
		dto.setStartNum(startRow);
		dto.setMbr_id(id);

		List<OrdDto> list =  odao.searchId(dto);
		for(int i =0;i<list.size();i++) {
			OrdDto odto = list.get(i);
			List<OrdersDetailDto> dlist = oddao.search(odto);
			ProductDto pdto = pdao.searchOne(dlist.get(0).getProduct_id());
			odto.setProduct_img(pdto.getProduct_img());
			int size = dlist.size();
			String name = "";
			if(size==1) {
				name = pdto.getProduct_name();
			} else {
				name = pdto.getProduct_name()+"외 "+(size-1)+"개";
			}
			odto.setName(name);
			int num=0;
			for(int j = 0;j<dlist.size();j++) {
				num+=Integer.parseInt(dlist.get(j).getOrds_detail_count());
			}
			odto.setNum(num);
			String state=odto.getOrds_state();
			if(state.equals("0")) {
				state="주문확인";
			} else if(state.equals("1")) {
				state="주문취소";
			} else if(state.equals("1")) {
				state="주문완료";
			}
			odto.setOrds_state(state);
			String delv=odto.getOrds_delv_state();
			if(delv.equals("0")) {
				delv="배송준비";
			} else if(delv.equals("1")) {
				delv="배송중";
			} else if(delv.equals("2")) {
				delv="배송완료";
			}
			odto.setOrds_delv_state(delv);
			Date date = odto.getOrds_date();
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format=fm.format(date);
			odto.setDate(format);
			
			list.set(i, odto);
		}
		
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;
		if (count > 0) {
			pageCount = count / maxcount + (count % maxcount == 0 ? 0 : 1);
			startPage = 1;

			if (startNum % 12 != 0)
				startPage = (int) (startNum / 12) * 12 + 1;
			else
				startPage = ((int) (startNum / 12) - 1) * 12 + 1;

			int pageBlock = 12;
				endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
		}
		ArrayList<String> numlist = new ArrayList<String>();
		for (int i = startPage; i <= endPage; i++) {
			String num1 = Integer.toString(i);
			numlist.add(num1);
		}
		model.addAttribute("mbr_id",id);
		model.addAttribute("list",list);
		model.addAttribute("startPage",startPage);
		model.addAttribute("numlist",numlist);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);

	}
	
	@Override
	public void detailList(Model model,HttpServletRequest request,HttpSession session) throws ParseException {
		String date = request.getParameter("date");
		String id=request.getParameter("mbr_id");
		String totalprice=request.getParameter("totalprice");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = fm.parse(date);
		OrdDto odto = new OrdDto();
		int price=0;
		odto.setMbr_id(id);
		odto.setOrds_date(to);
		List<OrdersDetailDto> list=oddao.search(odto);
		for(int i=0;i<list.size();i++) {
			OrdersDetailDto oddto=list.get(i);
			ProductDto pdto=pdao.searchOne(oddto.getProduct_id());
			ProductDetailDto pddto=pddao.searchOne(oddto.getProduct_detail_id());
			oddto.setName(pdto.getProduct_name());
			oddto.setPrice(pddto.getProduct_price());
			oddto.setSize(pddto.getProduct_color()+pddto.getProduct_size());
			oddto.setDate(date);
			oddto.setProduct_img(pdto.getProduct_img());
			list.set(i, oddto);
			price+=Integer.parseInt(pddto.getProduct_price())*Integer.parseInt(oddto.getOrds_detail_count());
		}
		Point_inoutDto piodto = new Point_inoutDto();
		piodto.setMbr_id(id);
		piodto.setPt_date(to);
		piodto=ptiodao.search(piodto);
		model.addAttribute("list",list);
		model.addAttribute("price",price);
		model.addAttribute("totalprice",totalprice);
		if(mdao.search(id).getMbr_level().equals("8")) {} 
		else { //비회원일 경우 포인트 표시 x
			model.addAttribute("pt_in",piodto.getPt_in());
			model.addAttribute("pt_out",piodto.getPt_out());
		}
	}
}
