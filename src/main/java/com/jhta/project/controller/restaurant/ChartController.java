package com.jhta.project.controller.restaurant;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.project.service.restaurant.RestaurantService;
import com.jhta.project.vo.restaurant.OrderListVo;
import com.jhta.project.vo.restaurant.RestaurantVo;

@Controller
public class ChartController {
	@Autowired RestaurantService service;
	@Autowired ServletContext sc;
	@GetMapping("/restaurant/chart")
	public String chartData(HttpServletResponse response,Principal p, Model model) {  //@RequestParam(value="r_id",required=false)String r_id
		RestaurantVo vo=service.idCheck(p.getName());
		model.addAttribute("vo",vo);
		model.addAttribute("main","/WEB-INF/views/restaurant/chart.jsp");
		model.addAttribute("mypage", "/WEB-INF/views/restaurant/sideSellerInfoList.jsp");
		return "layout";
		
	}
	
	//@RequestMapping(value="/restaurant/sales_chart", method = {RequestMethod.GET})
	@ResponseBody
	@GetMapping(value="/restaurant/sales_chart", produces= {MediaType.APPLICATION_JSON_VALUE})
	public Map<String, Object> sales_chart(HttpServletResponse response,Principal p, Model model,HttpServletRequest req) {  //@RequestParam(value="r_id",required=false)String r_id
		Map<String, Object> map= new HashMap<String, Object>();
		List<OrderListVo> list = service.selectSalesDay(req,p.getName());
 
		
		map.put("list",list);
		//System.out.println(list);
		//System.out.println(list.size());
		
		return map; 
		 
	}
//	@PostMapping("/restaurant/chart")
//	public void excleDownload(@RequestParam String fileName,HttpServletResponse response,Model model) throws Exception{
//		HSSFWorkbook objWorkBook = new HSSFWorkbook();
//		HSSFSheet objSheet = null;
//		HSSFRow objRow=null;
//		HSSFCell objCell=null;
//		
//		HSSFFont font = objWorkBook.createFont();
//		font.setFontHeightInPoints((short)9);
//		font.setFontName("맑은고딕");
//		
//		HSSFCellStyle styleHd=objWorkBook.createCellStyle();
//		styleHd.setFont(font);
//		
//		objSheet=objWorkBook.createSheet("첫번째 시트");
//		
//		objRow = objSheet.createRow(0);
//		objRow.setHeight((short)0x150);
//		
//		objCell=objRow.createCell(0);
//		objCell.setCellValue("번호");
//		objCell.setCellStyle(styleHd);
//		
//		objCell=objRow.createCell(1);
//		objCell.setCellValue("이름");
//		objCell.setCellStyle(styleHd);
//		
//		//2행
//		objRow=objSheet.createRow(1);
//		objRow.setHeight((short)0x150);
//		
//		objCell=objRow.createCell(0);
//		objCell.setCellValue("1");
//		objCell.setCellStyle(styleHd);
//		
//		objCell=objRow.createCell(1);
//		objCell.setCellValue("홍길동");
//		objCell.setCellStyle(styleHd);
//		
//		
//		response.setContentType("Application/Msexcel");
//		response.setHeader("Content-Disposition", "ATTachment; Filename="+URLEncoder.encode("테스트","UTF-8")+".xls");
//		
//		OutputStream fileOut =response.getOutputStream();
//		objWorkBook.write(fileOut);
//		fileOut.close();
//		
//		response.getOutputStream().flush();
//		response.getOutputStream().close();
//	}
	 	@GetMapping("/restaurant/excel")
	  public void excelDownload(HttpServletResponse response,HttpServletRequest req,String r_id,Principal p) throws IOException, ParseException {
	 	//System.out.println("aa");
	 	List<OrderListVo> list = service.selectSalesDay(req,p.getName());
	 	//System.out.println("bb"+list);
	 	//Workbook wb = new HSSFWorkbook(); 
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        String gbn = req.getParameter("gbn");
        SimpleDateFormat simpleDate=new SimpleDateFormat("yyyyMMdd");
        
        Date time= new Date();
        
        String today = simpleDate.format(time);
        Date selectDate=simpleDate.parse(today);
        Calendar cal=new GregorianCalendar(Locale.KOREA);
        cal.setTime(selectDate);
        today=simpleDate.format(cal.getTime());
        System.out.println(today);
        
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("날짜");
        cell = row.createCell(1);
        cell.setCellValue("매출액");

        //System.out.println(gbn+"aa");
        //System.out.println(list+"xx");
        if(gbn.equals("day")) {
        for (int i=0; i<list.size(); i++) {
        	//System.out.println("xx"+list);
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(list.get(i).getSales_day());
            cell = row.createCell(1);
            cell.setCellValue(list.get(i).getOr_totalcost());
           // System.out.println(list.get(i).getOr_totalcost()+"aa");
        	}
        }else if(gbn.equals("month")) {
        	 for (int j=0; j<list.size(); j++) {
             	 //System.out.println(list.get(j).getOr_totalcost());
                 row = sheet.createRow(rowNum++);
                 cell = row.createCell(0);
                 cell.setCellValue(list.get(j).getSales_month());
                 cell = row.createCell(1);
                 cell.setCellValue(list.get(j).getOr_totalcost());
             	}
        }else if(gbn.equals("year")) {
        	for (int y=0; y<list.size(); y++) {
        		//System.out.println("yy"+list);
             	//System.out.println(list.get(i).getOr_totalcost());
                 row = sheet.createRow(rowNum++);
                 cell = row.createCell(0);
                 cell.setCellValue(list.get(y).getSales_year());
                 cell = row.createCell(1);
                 cell.setCellValue(list.get(y).getOr_totalcost());
             	}
        }
        response.setContentType("ms-vnd/excel");
//        response.setContentType("application/ms-excel; charset=UTF-8");
        //response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");
       String fileName =today+".excel";
       // response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", String.format("attachment;filename=%s.xlsx", fileName));
        wb.write(response.getOutputStream());
        //response.getOutputStream().flush();
        wb.close();
        
    }
	 	
	 	
}