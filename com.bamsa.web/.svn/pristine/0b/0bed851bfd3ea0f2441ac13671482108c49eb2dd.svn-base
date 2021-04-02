package com.bamsa.web.files;

import java.awt.Color;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.bamsa.web.model.GrievanceDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.util.ApplicationConstants;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class GrievanceGeneratePdf extends AbstractPdfView{

	private static Logger logger = Logger.getLogger(TaskGeneratePdf.class);

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter pdf, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("Enter into buildPdfDocument");
		Paragraph header = new Paragraph(new Chunk("Grievance Details Report",FontFactory.getFont(FontFactory.HELVETICA, 15)));
		  document.add(header);
		  List<GrievanceDetailsModel> grievance=(List<GrievanceDetailsModel>) model.get("grievancedetails");
		  logger.info(grievance);
		  UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
			int uid=0;
			if(null!=userData){
			uid =userData.getUid();
			}
		  PdfPTable table = new PdfPTable(8);
		  table.setWidthPercentage(100.0f);
	       table.setSpacingBefore(5f); 
	       
	      
	         
	        // define font for table header row
	        Font font = FontFactory.getFont(FontFactory.HELVETICA,7);
	        font.setColor(Color.BLACK);
	 
	        //Set Column widths
	        float[] columnWidths = {2.5f, 2.0f, 3.0f, 2.0f, 3.0f, 2.0f, 2.0f,2.0f};
	        table.setWidths(columnWidths);
	        
 PdfPCell cell = new PdfPCell();
	        
	        cell.setBackgroundColor(Color.LIGHT_GRAY);
	        cell.setPadding(5);
	       
	        cell.setPhrase(new Phrase("Employee Id",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Employee Name",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Grievance Type",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Severity",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Details",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("MobileNo",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Registered MobileNo",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Fixed/Not Fixed",font));
	        table.addCell(cell);
	        
	        for(GrievanceDetailsModel bean:grievance) {
			       
		    	PdfPCell rowcell = new PdfPCell();
		    	Font fonts = FontFactory.getFont(FontFactory.HELVETICA,8);
		        fonts.setColor(Color.black);
		    	
		    	rowcell.setPhrase(new Phrase(bean.getEmpId(),fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getName(),fonts));
		        table.addCell(rowcell);
		        
		        if(bean.getGrievancetype()==1){
		        	rowcell.setPhrase(new Phrase(("Pay and Benefits"),fonts));
			        table.addCell(rowcell);
		            }else if(bean.getGrievancetype()==2){
		            	rowcell.setPhrase(new Phrase(("Work Loads"),fonts));
				        table.addCell(rowcell);
		            	 
		            }else if(bean.getGrievancetype()==3){
		            	rowcell.setPhrase(new Phrase(("Work Conditions"),fonts));
				        table.addCell(rowcell);
		            	 
		            }else{
		            	rowcell.setPhrase(new Phrase(("Union And Management Relations"),fonts));
				        table.addCell(rowcell);
		            }
		         
		        if(bean.getGrievancesevere()==1){
		        	rowcell.setPhrase(new Phrase(("Less Severe"),fonts));
			        table.addCell(rowcell);
					
				 }else if(bean.getGrievancesevere()==2){	
					 rowcell.setPhrase(new Phrase(("Moderate"),fonts));
				        table.addCell(rowcell);
				 }
			else if(bean.getGrievancesevere()==3) {
				 rowcell.setPhrase(new Phrase(("Normal"),fonts));
			        table.addCell(rowcell);
			 }
			else if(bean.getGrievancesevere()==4){
				
				 rowcell.setPhrase(new Phrase(("Severe"),fonts));
			        table.addCell(rowcell);
			   }else{
				   rowcell.setPhrase(new Phrase(("More Severe"),fonts));
			        table.addCell(rowcell);
					
					}
		        
		        rowcell.setPhrase(new Phrase(bean.getGrievancedetails(),fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getMobileNo(),fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getEmpmobileno(),fonts));
		        table.addCell(rowcell);
		        

		        if(bean.getStatus().equals("NF")){ 
					if(null!=userData && userData.getUid()==0){
						rowcell.setPhrase(new Phrase(("Fix Now"),fonts));
				        table.addCell(rowcell);
					}else{ 
						rowcell.setPhrase(new Phrase(("Not Fixed"),fonts));
				        table.addCell(rowcell);

				} 
					}else{ 
						rowcell.setPhrase(new Phrase(("Fixed"),fonts));
				        table.addCell(rowcell);

					}
	        	
		        
		       
		        
		        }
		  
		 
		        document.add(table);
		  
		        logger.info("Exit from buildPdfDocument");
			
	        
	}
 

}
