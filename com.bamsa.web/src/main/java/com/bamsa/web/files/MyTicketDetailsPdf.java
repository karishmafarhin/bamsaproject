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

import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.EmployeeTaskModel;
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

public class MyTicketDetailsPdf extends AbstractPdfView{

	private static Logger logger = Logger.getLogger(MyTicketDetailsPdf.class);

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter pdf, HttpServletRequest request,
			HttpServletResponse res) throws Exception {
		logger.info("Enter into buildPdfDocument");
		Paragraph header = new Paragraph(new Chunk("My Ticket Details Report",FontFactory.getFont(FontFactory.HELVETICA, 15)));
		  document.add(header);
		
			
		  List<AssetTicketModel> empModelTicket =(List)request.getAttribute("ticketDetails");
			List<EmployeeModel> employeedetails = (List)request.getAttribute("empdetails"); 
			logger.info("ticketd"+empModelTicket);
			logger.info("empdetails"+employeedetails);
			EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

		  logger.info(empModelTicket);
		  PdfPTable table = new PdfPTable(12);
		  table.setWidthPercentage(100.0f);
	       table.setSpacingBefore(5f); 
	       
	    // define font for table header row
	       Font font = FontFactory.getFont(FontFactory.HELVETICA,9);
	        font.setColor(Color.WHITE);
	 
	        //Set Column widths
	        float[] columnWidths = {2.5f, 2.5f, 3.0f, 2.0f, 2.5f, 3.0f, 2.0f, 3.0f, 2.0f,2.5f,2.5f,3.0f};
	        table.setWidths(columnWidths);
	       
          PdfPCell cell = new PdfPCell();
	        
	        cell.setBackgroundColor(Color.LIGHT_GRAY);
	        cell.setPadding(5);
	       
	        cell.setPhrase(new Phrase("Asset Type",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Tag",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Request To",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Purpose",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Remarks",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Raised By",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Raised Date",font));
	        table.addCell(cell);
	        
	        cell.setPhrase(new Phrase("Status",font));
	        table.addCell(cell);
	      
	        
	        cell.setPhrase(new Phrase("From Date",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("To Date",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Approved By",font));
	        table.addCell(cell);
	        cell.setPhrase(new Phrase("Approved Date",font));
	        table.addCell(cell);
	        
	        for(AssetTicketModel bean:empModelTicket){
	        	PdfPCell rowcell = new PdfPCell();
		    	Font fonts = FontFactory.getFont(FontFactory.HELVETICA,8);
		        fonts.setColor(Color.black);
		        
		        rowcell.setPhrase(new Phrase(bean.getAssettype() ,fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getTag(),fonts));
		        table.addCell(rowcell);
		        
		         for(EmployeeModel emp1:employeedetails){
					if(bean.getRequestto()==emp1.getUid())
					{
						rowcell.setPhrase(new Phrase(emp1.getEmpId() ,fonts));
						table.addCell(rowcell);
					}
						
					}
		        
		        
		        
		        rowcell.setPhrase(new Phrase(bean.getPurpose() ,fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getRemarks() ,fonts));
		        table.addCell(rowcell);
		        
		        rowcell.setPhrase(new Phrase(bean.getEmpid() ,fonts));
		        table.addCell(rowcell);
		        
		        DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
	    		String d=dateformat.format(bean.getRiseddate());
	    		rowcell.setPhrase(new Phrase(d,fonts));
		        table.addCell(rowcell);
		        
		        Date today=new Date();
				if(bean.getPurpose().equals("Taking Home") && null!=bean.getThstatus()){ 

					if(bean.getThstatus().equals("NA"))  {
						if(empModel.getStreamId()==6){
							rowcell.setPhrase(new Phrase("Approve Now" ,fonts));
					        table.addCell(rowcell);

						}else{ 
							rowcell.setPhrase(new Phrase("Not Approved" ,fonts));
					        table.addCell(rowcell);
						}
					}else{
						rowcell.setPhrase(new Phrase("Approved" ,fonts));
				        table.addCell(rowcell);
					}
					DateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		    		String df=date.format(bean.getFromdate());
		    		rowcell.setPhrase(new Phrase(df ,fonts));
			        table.addCell(rowcell);
		    		DateFormat dateformats = new SimpleDateFormat("yyyy-MM-dd");
			    		String ds=dateformats.format(bean.getTodate());
			    		rowcell.setPhrase(new Phrase(ds ,fonts));
				        table.addCell(rowcell);
					
				}

				else if(bean.getPurpose().equals("Broken") && null!=bean.getBstatus()){ 
					if(bean.getBstatus().equals("NF") && today.after(bean.getRiseddate())){

						if(empModel.getStreamId()==6){
							rowcell.setPhrase(new Phrase("Fix Now" ,fonts));
					        table.addCell(rowcell);
						}else{ 
							rowcell.setPhrase(new Phrase("Not Fixed" ,fonts));
					        table.addCell(rowcell);			        
						}
					}else{
						rowcell.setPhrase(new Phrase("Fixed" ,fonts));
				        table.addCell(rowcell);				 
					}
					rowcell.setPhrase(new Phrase("----" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("----" ,fonts));
			        table.addCell(rowcell);
				}

				else if(bean.getPurpose().equals("Repair") && null!=bean.getRstatus()){ 
					if(bean.getRstatus().equals("NF")){
						if(empModel.getStreamId()==6){
							rowcell.setPhrase(new Phrase("Fixed Now" ,fonts));
					        table.addCell(rowcell);
						}else{ 
							rowcell.setPhrase(new Phrase("Not Fixed" ,fonts));
					        table.addCell(rowcell);
						}
					}else{
						rowcell.setPhrase(new Phrase("Fixed" ,fonts));
				        table.addCell(rowcell);
					}

					rowcell.setPhrase(new Phrase("-----" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("-----" ,fonts));
			        table.addCell(rowcell);
				} 


				else if(bean.getPurpose().equals("Expired") ){
					rowcell.setPhrase(new Phrase("Expired" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("-----" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("-----" ,fonts));
			        table.addCell(rowcell);
				} 
				else{ 
					rowcell.setPhrase(new Phrase("Lost" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("----" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("-----" ,fonts));
			        table.addCell(rowcell);
				} 

				if(bean.getApprovedby()!=0 && null!=bean.getApproveddate()){
					for(EmployeeModel emp:employeedetails){
						if(bean.getApprovedby()==emp.getUid())
						{
							rowcell.setPhrase(new Phrase(emp.getEmpId() ,fonts));
					        table.addCell(rowcell);
						}}
					
					  DateFormat datefor = new SimpleDateFormat("yyyy-MM-dd");
			    		String date=datefor.format(bean.getApproveddate());
			    		rowcell.setPhrase(new Phrase(date,fonts));
				        table.addCell(rowcell);
				}else{ 
					rowcell.setPhrase(new Phrase("----" ,fonts));
			        table.addCell(rowcell);
			        rowcell.setPhrase(new Phrase("-----" ,fonts));
			        table.addCell(rowcell);
				} 
	}
	        document.add(table);
			  
	        logger.info("Exit from buildPdfDocument");
		
	  


}
}
