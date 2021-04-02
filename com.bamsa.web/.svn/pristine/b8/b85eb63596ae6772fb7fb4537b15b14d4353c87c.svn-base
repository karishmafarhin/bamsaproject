package com.bamsa.web.files;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.util.ApplicationConstants;

public class TicketDetailsXlGenerator extends AbstractExcelView {
	private static Logger log = Logger.getLogger(TicketDetailsXlGenerator.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workBook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("Enter into buildExcelDocument");
		List<AssetTicketModel> assetmodel=(List)request.getAttribute("ticketDetails"); 
		List<EmployeeModel> employeedetails = (List)request.getAttribute("empdetails"); 

		EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

		// create a new Excel sheet
		HSSFSheet sheet = workBook.createSheet("Ticket Details");
		sheet.setDefaultColumnWidth(30);

		// create style for header cells
		CellStyle style = workBook.createCellStyle();
		HSSFFont font = workBook.createFont();
		font.setFontName("Arial");
		style.setFillForegroundColor(HSSFColor.LIME.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		style.setFillBackgroundColor(CellStyle.BORDER_THICK);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);        
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);
		// create header row
		HSSFRow header = sheet.createRow(0);

		header.createCell(0).setCellValue("Asset Type");
		header.getCell(0).setCellStyle(style);

		header.createCell(1).setCellValue("Tag");
		header.getCell(1).setCellStyle(style);

		header.createCell(2).setCellValue("Request To");
		header.getCell(2).setCellStyle(style);

		header.createCell(3).setCellValue("Purpose");
		header.getCell(3).setCellStyle(style);

		header.createCell(4).setCellValue("Remarks");
		header.getCell(4).setCellStyle(style);

		header.createCell(5).setCellValue("Raised By");
		header.getCell(5).setCellStyle(style);

		header.createCell(6).setCellValue("Raised Date");
		header.getCell(6).setCellStyle(style);

		header.createCell(7).setCellValue("Status");
		header.getCell(7).setCellStyle(style);

		header.createCell(8).setCellValue("From Date");
		header.getCell(8).setCellStyle(style);

		header.createCell(9).setCellValue("To Date");
		header.getCell(9).setCellStyle(style);

		header.createCell(10).setCellValue("Approved By");
		header.getCell(10).setCellStyle(style);

		header.createCell(11).setCellValue("Approved Date");
		header.getCell(11).setCellStyle(style);
		// create data rows

		int rowCount = 1;
		for (AssetTicketModel bean : assetmodel) {

			HSSFRow aRow = sheet.createRow(rowCount++);

			aRow.createCell(0).setCellValue(bean.getAssettype());

			aRow.createCell(1).setCellValue(bean.getTag());

			for(EmployeeModel emp1:employeedetails){
				if(bean.getRequestto()==emp1.getUid())
				{
					aRow.createCell(2).setCellValue(emp1.getEmpId());
				}}




			aRow.createCell(3).setCellValue(bean.getPurpose());

			aRow.createCell(4).setCellValue(bean.getRemarks());

			aRow.createCell(5).setCellValue(bean.getEmpid());

			DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
    		String d=date.format(bean.getRiseddate());
    		 aRow.createCell(6).setCellValue(d);
			

			Date today=new Date();
			if(bean.getPurpose().equals("Taking Home") && null!=bean.getThstatus()){ 

				if(bean.getThstatus().equals("NA"))  {
					if(empModel.getStreamId()==6){
						aRow.createCell(7).setCellValue("Approve Now");

					}else{ 
						aRow.createCell(7).setCellValue("Not Approved");
					}
				}else{
					aRow.createCell(7).setCellValue("Approved");
				}
				DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	    		String df=dateformat.format(bean.getFromdate());
	    		 aRow.createCell(8).setCellValue(df);
	    		DateFormat dateformats = new SimpleDateFormat("yyyy-MM-dd");
		    		String ds=dateformats.format(bean.getTodate());
	            aRow.createCell(9).setCellValue(ds);
				
			}

			else if(bean.getPurpose().equals("Broken") && null!=bean.getBstatus()){ 
				if(bean.getBstatus().equals("NF") && today.after(bean.getRiseddate())){

					if(empModel.getStreamId()==6){
						aRow.createCell(7).setCellValue("Fix Now");
					}else{ 
						aRow.createCell(7).setCellValue("Not Fixed");				        
					}
				}else{
					aRow.createCell(7).setCellValue("Fixed");					 
				}
				aRow.createCell(8).setCellValue("----");
				aRow.createCell(9).setCellValue("----");
			}

			else if(bean.getPurpose().equals("Repair") && null!=bean.getRstatus()){ 
				if(bean.getRstatus().equals("NF")){
					if(empModel.getStreamId()==6){
						aRow.createCell(7).setCellValue("Fixed Now");
					}else{ 
						aRow.createCell(7).setCellValue("Not Fixed");
					}
				}else{
					aRow.createCell(7).setCellValue("Fixed");
				}

				aRow.createCell(8).setCellValue("----");
				aRow.createCell(9).setCellValue("----");	
			} 


			else if(bean.getPurpose().equals("Expired") ){
				aRow.createCell(7).setCellValue("Expired");
				aRow.createCell(8).setCellValue("----");	
				aRow.createCell(9).setCellValue("----");	
			} 
			else{ 

				aRow.createCell(7).setCellValue("Lost");
				aRow.createCell(8).setCellValue("----");
				aRow.createCell(9).setCellValue("----");
			} 

			if(bean.getApprovedby()!=0 && null!=bean.getApproveddate()){
				for(EmployeeModel emp:employeedetails){
					if(bean.getApprovedby()==emp.getUid())
					{
						aRow.createCell(10).setCellValue(emp.getEmpId());
					}}
				aRow.createCell(11).setCellValue(bean.getApproveddate());
			}else{ 
				aRow.createCell(10).setCellValue("----");
				aRow.createCell(11).setCellValue("----");
			} 





		}
		log.info("Exit from buildExcelDocument");

		
	}
}
