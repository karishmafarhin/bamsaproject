package com.bamsa.web.files;


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

import com.bamsa.web.model.GrievanceDetailsModel;

import com.bamsa.web.model.UserBean;
import com.bamsa.web.util.ApplicationConstants;

public class BamsaGrievanceXlGenerator extends AbstractExcelView {
	private static Logger log = Logger.getLogger(BamsaGrievanceXlGenerator.class);

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workBook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("Enter into buildExcelDocument");
		List<GrievanceDetailsModel> grievance=(List<GrievanceDetailsModel>) model.get("grievancedetails");
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		uid =userData.getUid();
		}
		// create a new Excel sheet
        HSSFSheet sheet = workBook.createSheet("All Grievance");
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
      
        header.createCell(0).setCellValue("Employee Id");
        header.getCell(0).setCellStyle(style);
         
        header.createCell(1).setCellValue("Employee Name");
        header.getCell(1).setCellStyle(style);
        
        header.createCell(2).setCellValue("Grievance Type");
        header.getCell(2).setCellStyle(style);
      
        header.createCell(3).setCellValue("Severity");
        header.getCell(3).setCellStyle(style);
         
        header.createCell(4).setCellValue("Details");
        header.getCell(4).setCellStyle(style);
         
        header.createCell(5).setCellValue("MobileNo");
        header.getCell(5).setCellStyle(style);
        
        header.createCell(6).setCellValue("Registered MobileNo");
        header.getCell(6).setCellStyle(style);
      
        header.createCell(7).setCellValue("Fixed/NotFixed");
        header.getCell(7).setCellStyle(style);
         
        
        // create data rows
        int rowCount = 1;
       
        for (GrievanceDetailsModel bean : grievance) {
        
            HSSFRow aRow = sheet.createRow(rowCount++);
            
            aRow.createCell(0).setCellValue(bean.getEmpId());
            
            aRow.createCell(1).setCellValue(bean.getName());
            
            if(bean.getGrievancetype()==1){
            aRow.createCell(2).setCellValue("Pay and Benefits");
            }else if(bean.getGrievancetype()==2){
            	 aRow.createCell(2).setCellValue("Work Loads");
            }else if(bean.getGrievancetype()==3){
            	 aRow.createCell(2).setCellValue("Work Conditions");
            }else{
            	 aRow.createCell(2).setCellValue("Union And Management Relations");
            }
         
            
            
			if(bean.getGrievancesevere()==1){
				 aRow.createCell(3).setCellValue("Less Severe");
			 }else if(bean.getGrievancesevere()==2){	
				 aRow.createCell(3).setCellValue("Moderate");
			 }
		else if(bean.getGrievancesevere()==3) {
			aRow.createCell(3).setCellValue("Normal");
		 }
		else if(bean.getGrievancesevere()==4){
			
			aRow.createCell(3).setCellValue("Severe");
		   }else{
			   aRow.createCell(3).setCellValue("More Severe");
				
				}
         
			aRow.createCell(4).setCellValue(bean.getGrievancedetails());
			aRow.createCell(5).setCellValue(bean.getMobileNo());
			aRow.createCell(6).setCellValue(bean.getEmpmobileno());
			if(bean.getStatus().equals("NF")){ 
				if(null!=userData && userData.getUid()==0){
				aRow.createCell(7).setCellValue("Fix Now");
				}else{ 
					aRow.createCell(7).setCellValue("Not Fixed");

			} 
				}else{ 
					aRow.createCell(7).setCellValue("Fixed");

				}
        	

        }
        log.info("Exit from buildExcelDocument");
	}

}
