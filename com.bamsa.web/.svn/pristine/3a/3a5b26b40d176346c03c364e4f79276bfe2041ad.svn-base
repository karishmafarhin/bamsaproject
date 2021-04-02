package com.bamsa.web.files;

import java.awt.Color;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class MyTaskGeneratePdf extends AbstractPdfView{

	private static Logger logger = Logger.getLogger(TaskGeneratePdf.class);

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter pdf, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("Enter into buildPdfDocument");
		Paragraph header = new Paragraph(new Chunk("My Task Status Report",FontFactory.getFont(FontFactory.HELVETICA, 15)));
		  document.add(header);
		  List<EmployeeTaskModel> empModelTask =(List<EmployeeTaskModel> )model.get("mytaskpdf");
		  logger.info(empModelTask);
		  PdfPTable table = new PdfPTable(9);
		  table.setWidthPercentage(100.0f);
	       table.setSpacingBefore(5f); 
	       
	      
	         
	        // define font for table header row
	        Font font = FontFactory.getFont(FontFactory.HELVETICA,9);
	        font.setColor(Color.WHITE);
	 
	        //Set Column widths
	        float[] columnWidths = {2.5f, 2.0f, 2.0f, 2.0f, 2.0f, 2.0f, 2.0f, 3.0f, 2.0f};
	        table.setWidths(columnWidths);
	        
	        
	        PdfPCell cell = new PdfPCell();
	        
	        cell.setBackgroundColor(Color.LIGHT_GRAY);
	        cell.setPadding(5);
	       
	        cell.setPhrase(new Phrase("Employee Id",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Project Name",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Task Description",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Task Type",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Given By",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Given Date",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Deadline",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Status",font));
	        table.addCell(cell);
	      
	        
	        cell.setPhrase(new Phrase("Updated Reason",font));
	        table.addCell(cell);
	        
	        for(EmployeeTaskModel bean:empModelTask) {
			       
		    	PdfPCell rowcell = new PdfPCell();
		    	Font fonts = FontFactory.getFont(FontFactory.HELVETICA,8);
		        fonts.setColor(Color.black);
		    	
		    	rowcell.setPhrase(new Phrase(bean.getEmpid(),fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getProjectname(),fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getTaskdescription(),fonts));
		        table.addCell(rowcell);
		        
		        String task=Character.toString(bean.getTasktype());
				if(task.equals("P")) {
					 rowcell.setPhrase(new Phrase("project",fonts));
				        table.addCell(rowcell);
				}else {
					 rowcell.setPhrase(new Phrase("Task",fonts));
				        table.addCell(rowcell);
				} 
				
				rowcell.setPhrase(new Phrase(bean.getGivenbyname(),fonts));
		        table.addCell(rowcell);
		        
				DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	    		String d=dateformat.format(bean.getGivendate());
	    		rowcell.setPhrase(new Phrase(d,fonts));
		        table.addCell(rowcell);
		        
	    		DateFormat dateformats = new SimpleDateFormat("yyyy-MM-dd");
		    	String ds=dateformats.format(bean.getDeadline());
		    	rowcell.setPhrase(new Phrase(ds,fonts));
			    table.addCell(rowcell);
				
			    Date today =new Date();
	            if(bean.getStatus().equals("NC") && today.after(bean.getDeadline())){
	            	rowcell.setPhrase(new Phrase("Not Started [Over Due]",fonts));
			        table.addCell(rowcell);
	            }else if(bean.getStatus().equals("IP") && today.after(bean.getDeadline())){
	            	rowcell.setPhrase(new Phrase("In Process [Over Due]" ,fonts));
	            	  table.addCell(rowcell);
	            }else if(bean.getStatus().equals("NC")){
	            	rowcell.setPhrase(new Phrase("Not Started",fonts ));
	            	  table.addCell(rowcell);
	            }else if(bean.getStatus().equals("IP")){
	            	rowcell.setPhrase(new Phrase("In Process",fonts ));
	            	  table.addCell(rowcell);
	            }else{
	            	rowcell.setPhrase(new Phrase("Completed",fonts ));
	            	  table.addCell(rowcell);

	            }
	            rowcell.setPhrase(new Phrase(bean.getReason(),fonts));
		        table.addCell(rowcell);
		        
		       
		        
		        }
		  
		 
		        document.add(table);
		  
		        logger.info("Exit from buildPdfDocument");
	}


}
