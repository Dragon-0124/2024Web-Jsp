<%-- TODO : 강의슬라이드 내용에 맞추어 작업 후 제출할 것 --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");


	String filename = "";

	// TODO : 아래 폴더는 여러분의 프로젝트 폴더를 직접 찾아 수정할 것
	// TODO : 보통 윈도우 환경의 경우 BookMarket 부분만 프로젝트명을 바꾸면 정상 작동될 것임.
	// TODO : 도저히 수정 못하겠으면 실행하지 말고 타이핑만 해서 제출하세요.
	String realFolder = "C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BookMarket16\\resources\\images";
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	
	
	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");	
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from book where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, bookId);
	rs = pstmt.executeQuery();	
	
	
	if (rs.next()) {		
		if (fileName != null) {
			sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=?, b_fileName=? WHERE b_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);		
			pstmt.setString(9, condition);	
			pstmt.setString(10, fileName);	
			pstmt.setString(11, bookId);	
			pstmt.executeUpdate();
			
					
		} else {
			sql = "UPDATE book SET b_name=?, b_unitPrice=?, b_author=?, b_description=?, b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? WHERE b_id=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);		
			pstmt.setString(9, condition);			
			pstmt.setString(10, bookId);	
			pstmt.executeUpdate();
		}		
	}
	

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	

	response.sendRedirect("editBook.jsp?edit=update");

%>

