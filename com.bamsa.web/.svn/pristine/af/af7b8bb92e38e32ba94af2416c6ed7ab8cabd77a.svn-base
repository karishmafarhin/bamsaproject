package com.bamsa.web.files;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.model.Sheet;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;


import com.bamsa.web.model.TaskDetailsModel;

public class BamsaProfilesXlGenerator  extends AbstractExcelView {
	private static Logger log = Logger.getLogger(BamsaProfilesXlGenerator.class);
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workBook, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		log.info("Enter into buildExcelDocument");
		List<TaskDetailsModel> alltasks=(List<TaskDetailsModel>) model.get("TaskDetails");
		 
		// create a new Excel sheet
	        HSSFSheet sheet = workBook.createSheet("All Tasks");
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
	         
	        header.createCell(1).setCellValue("Project Name");
	        header.getCell(1).setCellStyle(style);
	        
	        header.createCell(2).setCellValue("Task Description");
	        header.getCell(2).setCellStyle(style);
	      
	        header.createCell(3).setCellValue("Task Type");
	        header.getCell(3).setCellStyle(style);
	         
	        header.createCell(4).setCellValue("Given Date");
	        header.getCell(4).setCellStyle(style);
	         
	        header.createCell(5).setCellValue("Deadline");
	        header.getCell(5).setCellStyle(style);
	        
	        header.createCell(6).setCellValue("Status");
	        header.getCell(6).setCellStyle(style);
	      
	        header.createCell(7).setCellValue("Percentage Completed");
	        header.getCell(7).setCellStyle(style);
	         
	        header.createCell(8).setCellValue("Backlogs");
	        header.getCell(8).setCellStyle(style);
	         
	        header.createCell(9).setCellValue("Queries");
	        header.getCell(9).setCellStyle(style);
	        // create data rows
	        int rowCount = 1;
	       
	        for (TaskDetailsModel bean : alltasks) {
	        
	            HSSFRow aRow = sheet.createRow(rowCount++);
	            
	            aRow.createCell(0).setCellValue(bean.getEmpid());
	            
	            aRow.createCell(1).setCellValue(bean.getProjectname());
	            
	            aRow.createCell(2).setCellValue(bean.getTaskDescription());
	            
	            
	            String task=Character.toString(bean.getTasktype() );
				if(task.equals("P")) {
				 aRow.createCell(3).setCellValue("project");
				}else {
				 aRow.createCell(3).setCellValue("Task");
				} 
	           
	           
	            DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	    		String d=dateformat.format(bean.getGivendate());
	    		 aRow.createCell(4).setCellValue(d);
	    		DateFormat dateformats = new SimpleDateFormat("yyyy-MM-dd");
		    		String ds=dateformats.format(bean.getDeadline());
	            aRow.createCell(5).setCellValue(ds);
	            
	            Date today =new Date();
	            if(bean.getStatus().equals("NC") && today.after(bean.getDeadline())){
	            	aRow.createCell(6).setCellValue("Not Started [Over Due]" );
	            }else if(bean.getStatus().equals("IP") && today.after(bean.getDeadline())){
	            	aRow.createCell(6).setCellValue("In Process [Over Due]" );
	            }else if(bean.getStatus().equals("NC")){
	            	aRow.createCell(6).setCellValue("Not Started" );
	            }else if(bean.getStatus().equals("IP")){
	            	aRow.createCell(6).setCellValue("In Process" );
	            }else{
	            	aRow.createCell(6).setCellValue("Completed" );

	            }
            	aRow.createCell(7).setCellValue(bean.getPercentagecompleted());
            	
            	if(bean.getBacklogs()==null){
					
            		aRow.createCell(8).setCellValue("-----" );
				 }
				else{
					
					aRow.createCell(8).setCellValue(bean.getBacklogs());
				}
                 if(bean.getQueries()==null){
					
            		aRow.createCell(9).setCellValue("-----" );
				 }
				else{
					
					aRow.createCell(9).setCellValue(bean.getQueries());
				}
            	
            	
            	

	        }
	        log.info("Exit from buildExcelDocument");
		}
}
