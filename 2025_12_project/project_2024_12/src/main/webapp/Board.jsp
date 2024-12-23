<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<%
    request.setCharacterEncoding("UTF-8");
	
%>  
<%
/*   location.href = './Board.jsp'; */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <link rel="stylesheet" href="./css/Board.css">
    <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
</head>
<body>
    <header>
        <div class="logo" onclick="location.href = './Ev_page.html'">로고(이미지나 글)</div>
        <div class="menu">메뉴</div>
        <div class="members">
            <div class="login" onclick="location.href = './Login.html'">로그인(이미지나 글)</div>
            <div class="Sing_Up" onclick="location.href = './Sing_Up.html'">회원가입(이미지나 글)</div>
        </div>
    </header>
    <%
    // 1. 사용자가 선택한 필터 값 가져오기
    String carType = request.getParameter("car_type");  // 차 종류
    String priceRange = request.getParameter("price_range");  // 가격 범위
    String mileage = request.getParameter("mileage");  // 주행 거리
    int currentPage = 1;
    int itemsPerPage = 9;

    // 페이지 번호가 전달되면 currentPage 업데이트
    if (request.getParameter("page") != null) {
    	  try {
              currentPage = Integer.parseInt(request.getParameter("page"));
          } catch (NumberFormatException e) {
              currentPage = 1; // 잘못된 값이 들어오면 기본값 1로 설정
          }
    }

    // 2. DB 연결
    Connection conn = DBManager.getDBConnection();

    // 3. 기본 SQL 쿼리 작성
    StringBuilder sql = new StringBuilder("SELECT * FROM ( " +
            "  SELECT car_name, mileage AS car_mileage, car_price, car_type, category, ROWNUM AS rn FROM ( " +
            "    SELECT car_name, mileage, car_price, car_type, category FROM car_list_view WHERE 1=1 ");

    // 필터 조건 추가
    if (carType != null && !carType.isEmpty()) {
        sql.append(" AND car_type = ? ");
    }

    if (priceRange != null && !priceRange.isEmpty()) {
        String[] priceParts = priceRange.split("-");
        if (priceParts.length == 2) {
            sql.append(" AND car_price BETWEEN ? AND ? ");
        }
    }

    if (mileage != null && !mileage.isEmpty()) {
    	String[] mileaget = mileage.split("-");
        if (mileaget.length == 2) {
            sql.append(" AND car_price BETWEEN ? AND ? ");
        }
    }

    sql.append("  ORDER BY car_name) " +
            " ) WHERE rn > ? AND rn <= ?");

    try {
        // 4. PreparedStatement로 쿼리 실행
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        int paramIndex = 1;

        // 조건에 맞는 값 설정
        if (carType != null && !carType.isEmpty()) {
            pstmt.setString(paramIndex++, carType);
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            String[] priceParts = priceRange.split("-");
            if (priceParts.length == 2) {
                pstmt.setInt(paramIndex++, Integer.parseInt(priceParts[0]));
                pstmt.setInt(paramIndex++, Integer.parseInt(priceParts[1]));
            }
        }

        if (mileage != null && !mileage.isEmpty()) {
        	String[] mileaget  = priceRange.split("-");
            if (mileaget.length == 2) {
                pstmt.setInt(paramIndex++, Integer.parseInt(mileaget[0]));
                pstmt.setInt(paramIndex++, Integer.parseInt(mileaget[1]));
            }
        }

        pstmt.setInt(paramIndex++, (currentPage - 1) * itemsPerPage);  // 하한
        pstmt.setInt(paramIndex++, currentPage * itemsPerPage);  // 상한

        // 결과 실행
        ResultSet rs = pstmt.executeQuery();

        %>
    <form method="get">
    <div class="section1_list_1">
        <div class="title">차 종류</div>
        <select id="car_type" name="car_type" size="4" class="section1_box_list">
            <option value="소형차" <%= carType != null && carType.equals("소형차") ? "selected" : "" %> >소형차</option>
            <option value="중형차" <%= carType != null && carType.equals("중형차") ? "selected" : "" %>>중형차</option>
            <option value="Suv" <%= carType != null && carType.equals("Suv") ? "selected" : "" %>> Suv </option>
            <option value="트럭/화물" <%= carType != null && carType.equals("트럭/화물") ? "selected" : "" %>>트럭/화물</option>
        </select>
    </div>

    <div class="section1_list_2">
        <div class="title">가격</div>
        <select id="price_range" name="price_range" size="4" >
            <option value="100000-1000000" <%= priceRange != null && priceRange.equals("100000-1000000") ? "selected" : "" %>>1,000만원 이하</option>
            <option value="1000000-3000000" <%= priceRange != null && priceRange.equals("1000000-3000000") ? "selected" : "" %>>1,000만원 ~ 3,000만원</option>
            <option value="3000000-5000000" <%= priceRange != null && priceRange.equals("3000000-5000000") ? "selected" : "" %>>3,000만원 ~ 5,000만원</option>
            <option value="5000000-7000000" <%= priceRange != null && priceRange.equals("5000000-7000000") ? "selected" : "" %>>5,000만원 ~ 7,000만원</option>
            <option value="7000000-10000000" <%= priceRange != null && priceRange.equals("7000000-10000000") ? "selected" : "" %>>7,000만원 ~ 1억원</option>
           <option value="10000000-100000000" <%= priceRange != null && priceRange.equals("10000000-100000000") ? "selected" : "" %>>1억원 이상</option>
        </select>

    </div>
    <div class="section1_list_3">
        <div class="title">주행 거리</div>
        <select id="mileage" name="mileage" size="4" >
        <option value="0-50000" <%= mileage != null && mileage.equals("50000") ? "selected" : "" %>>5만 km 이하</option>
        <option value="50000-100000" <%= mileage != null && mileage.equals("50000-100000") ? "selected" : "" %>>5만 km ~ 10만 km</option>
        <option value="100000-150000" <%= mileage != null && mileage.equals("100000-150000") ? "selected" : "" %>>10만 km ~ 15만 km</option>
        <option value="150000-200000" <%= mileage != null && mileage.equals("150000-200000") ? "selected" : "" %>>15만 km ~ 20만 km</option>
        <option value="200000-300000" <%= mileage != null && mileage.equals("200000-300000") ? "selected" : "" %>>20만 km ~ 30만 km</option>
        <option value="300000-3000000" <%= mileage != null && mileage.equals("300000-3000000") ? "selected" : "" %>>30만 km 이상</option>
        </select>
    </div>
    <div class="search_button">
        <button type="submit">검색</button>
        <button type="reset" onclick="window.location.href=window.location.pathname;">초기화</button>
    </div>
</form>
<div class="section2">
        <div class="content">
         <% 
        // 5. 결과 출력
        while (rs.next()) {
            java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###");
            int carPrice = rs.getInt("car_price");
            int carMileage = rs.getInt("car_mileage");
            String formattedMileage = formatter.format(carMileage);
            String formattedPrice = formatter.format(carPrice);
%>
            <div class="car_box">
                <div>차 이름: <%= rs.getString("car_name") %></div>
                <div>주행 거리: <%= formattedMileage %> km</div>
                <div>가격: <%= formattedPrice %> 원</div>
                <div>차 종류: <%= rs.getString("car_type") %></div>
            </div>
<%
        }
         // 페이지 번호 가져오기
         if (request.getParameter("page") != null) {
             try {
                 currentPage = Integer.parseInt(request.getParameter("page"));
             } catch (NumberFormatException e) {
                 currentPage = 1; // 잘못된 값이 들어오면 기본값 1로 설정
             }
         }
        // 6. 전체 데이터 총 조회 (페이지네이션)
        String countSql = "SELECT COUNT(*) AS total FROM car_list_view WHERE 1=1";
        if (carType != null && !carType.isEmpty()) {
            countSql += " AND car_type = ?";
        }
        
        if (priceRange != null && !priceRange.isEmpty()) {
            countSql += " AND car_price BETWEEN ? AND ?";
        }

        if (mileage != null && !mileage.isEmpty()) {
            countSql += " AND mileage <= ?";
        }

        PreparedStatement countPstmt = conn.prepareStatement(countSql);
        paramIndex = 1;

        if (carType != null && !carType.isEmpty()) {
            countPstmt.setString(paramIndex++, carType);
        }

        if (priceRange != null && !priceRange.isEmpty()) {
            String[] priceParts = priceRange.split("-");
            if (priceParts.length == 2) {
                countPstmt.setInt(paramIndex++, Integer.parseInt(priceParts[0]));
                countPstmt.setInt(paramIndex++, Integer.parseInt(priceParts[1]));
            }
        }

        if (mileage != null && !mileage.isEmpty()) {
        	 String[] mileaget = priceRange.split("-");
             if (mileaget.length == 2) {
                 countPstmt.setInt(paramIndex++, Integer.parseInt(mileaget[0]));
                 countPstmt.setInt(paramIndex++, Integer.parseInt(mileaget[1]));
             }
        }
        ResultSet countRs = countPstmt.executeQuery();
        int totalItems = 0;
        if (countRs.next()) {
            totalItems = countRs.getInt("total");
        }

        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

        // 7. 페이지네이션 출력
%>
        </div>
        <div class="pagination">
        <%
        int maxPageLinks = 10; // 최대 표시할 페이지 번호 개수
        int startPage = Math.max(1, currentPage - 5); // 시작 페이지 번호
        int endPage = Math.min(totalPages, startPage + maxPageLinks - 1); // 끝 페이지 번호

        // "이전" 버튼
        if (currentPage > 1) {
        %>
        <a href="?page=<%= currentPage - 1 %>">이전</a>
        <% } else { %>
        <span>이전</span>
        <%
        }
        // 페이지 번호 표시
        if (startPage > 1) {
        %>
        <a href="?page=1">1</a>
        <span>...</span>
        <%
        }

        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
        %> 
        <span><%= i %></span> 
        <% } else { %>
        <a href="?page=<%= i %>"><%= i %></a>
        <%
            }
        }
        if (endPage < totalPages) {
        %>
        <span>...</span>
        <a href="?page=<%= totalPages %>"><%= totalPages %></a>
        <%
        }
        // "다음" 버튼
        if (currentPage < totalPages) {
        %>
        <a href="?page=<%= currentPage + 1 %>">다음</a>
        <% } else { %> 
        <span>다음</span> 
        <% }
        %>
    </div>
    <%
    } catch (SQLException se) {
        se.printStackTrace();
        System.err.println("테이블 조회 에러");
    }
    %>
    </div>
    </div>
       
<footer>
        <div class="footer_1">
            <div>로고</div>
            <div class="sns">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div>세부 내용</div>
        </div>
        <div class="footer_2"> 
            <ul>
                고객 서비스 링크
                <li  사용 가이드></li>
                <li> 자줒 묻는 질문 (FAQ)</li>
                <li>가격 정채 페이지</li>
                <li> 고객 지원 / 고객 센터</li>
            </ul>
        </div>
        <div class="footer_3"> 
            <ul>
                정책 관련 링크
                <li>개인정보 처리 방침</li>
                <li>  사이트 이용 약관</li>
                <li>   쿠키 정책</li>
            </ul>
        </div>
        <div class="footer_4"> 
            <ul>
                저작권 정보 
                <li>웝사이트 소유자 정보</li>
                <li>웹사이트 저작권 정보 (연도 및 소유자)</li>
            </ul>
        </div>
    </footer>
</body>
</html>
    