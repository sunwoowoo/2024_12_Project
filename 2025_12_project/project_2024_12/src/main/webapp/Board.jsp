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
    <script src="./js/board.js"></script>
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
    <div class="container">
        <div class="section1">
        <div class="section1_list_1">
            <div class="title">차 종류</div>
            <div class="section1_box_list">
                <div id="section1_box_list1" onclick="showMain(1)">소형차</div>
                <div id="section1_box_list2" onclick="showMain(2)">중형차</div>
                <div id="section1_box_list3" onclick="showMain(3)">Suv</div>
                <div id="section1_box_list4" onclick="showMain(4)">트럭/화물</div>
            </div>
        </div>
        <div class="section1_list_2 section_type">
            <div class="title">가격</div>
            <div class="section1_box type_js_1">
                <span class="price_range" onclick="highlight(this)">1,100만 원 ~ 1,400만 원</span>
                <span class="price_range" onclick="highlight(this)">1,400만 원 ~ 1,600만 원</span>
                <span class="price_range" onclick="highlight(this)">1,600만 원 ~ 1,800만 원</span>
                <span class="price_range" onclick="highlight(this)">1,800만 원 ~ 2,000만 원</span>
                <span class="price_range" onclick="highlight(this)">2,000만 원 ~ 2,200만 원</span>
                <span class="price_range" onclick="highlight(this)">2,200만 원 ~ 2,500만 원</span>
            </div>
            <div class="section1_box type_js_2">
                <span class="price_range" onclick="highlight(this)">2,500만 원 ~ 3,000만 원</span>
                <span class="price_range" onclick="highlight(this)">2,700만 원 ~ 3,200만 원</span>
                <span class="price_range" onclick="highlight(this)">2,900만 원 ~ 3,400만 원</span>
                <span class="price_range" onclick="highlight(this)">3,400만 원 ~ 3,800만 원</span>
                <span class="price_range" onclick="highlight(this)">3,800만 원 ~ 4,000만 원</span>
                <span class="price_range" onclick="highlight(this)">4,200만 원 ~ 4,500만 원</span>
            </div>
            <div class="section1_box type_js_3">
                <span class="price_range" onclick="highlight(this)">2,000만 원 ~ 2,400만 원</span>
                <span class="price_range" onclick="highlight(this)">2,400만 원 ~ 2,800만 원</span>
                <span class="price_range" onclick="highlight(this)">2,800만 원 ~ 3,000만 원</span>
                <span class="price_range" onclick="highlight(this)">3,000만 원 ~ 3,500만 원</span>
                <span class="price_range" onclick="highlight(this)">3,400만 원 ~ 4,000만 원</span>
                <span class="price_range" onclick="highlight(this)">4,500만 원 ~ 6,000만 원</span>
            </div>
            <div class="section1_box type_js_4">
                <span class="price_range" onclick="highlight(this)">1,500만 원 ~ 2,000만 원</span>
                <span class="price_range" onclick="highlight(this)">1,600만 원 ~ 2,100만 원</span>
                <span class="price_range" onclick="highlight(this)">2,300만 원 ~ 2,800만 원</span>
                <span class="price_range" onclick="highlight(this)">3,500만 원 ~ 4,000만 원</span>
                <span class="price_range" onclick="highlight(this)">4,000만 원 ~ 5,000만 원</span>
                <span class="price_range" onclick="highlight(this)">5,500만 원 ~ 7,000만 원</span>
            </div>
        </div>
        <div class="section1_list_3 section_type">
            <div class="title">주행 거리</div>
            <div class="section1_box type_js_1">
                <span class="mileage" onclick="mileagelist(this)"> 5만  km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 10만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 15만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 20만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 25만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 30만 km 이하</span>
            </div>
            <div class="section1_box type_js_2">
                <span class="mileage" onclick="mileagelist(this)"> 5만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 10만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 15만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 20만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 25만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 30만 km 이하</span>
            </div>
            <div class="section1_box type_js_3">
                <span class="mileage" onclick="mileagelist(this)"> 5만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 10만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 15만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 20만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 25만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 30만 km 이하</span>
            </div>
            <div class="section1_box type_js_4">
                <span class="mileage" onclick="mileagelist(this)"> 5만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 10만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 15만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 20만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 25만 km 이하</span>
                <span class="mileage" onclick="mileagelist(this)"> 30만 km 이하</span>
            </div>
        </div>
        <div>
            <button>검색</button>
        </div>
    </div>
        <div class="section2">
        <div class="content">
    <%
    int currentPage = 1; // 현재 페이지 번호
    int itemsPerPage = 9; // 페이지당 항목 수

    // 페이지 번호 가져오기
    if (request.getParameter("page") != null) {
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            currentPage = 1; // 잘못된 값이 들어오면 기본값 1로 설정
        }
    }

    Connection conn = DBManager.getDBConnection();
    String sql = "SELECT * FROM (" +
            "  SELECT car_name, mileage AS car_mileage, car_price, car_type, category, ROWNUM AS rn FROM (" +
            "    SELECT car_name, mileage, car_price, car_type, category FROM car_list_view ORDER BY car_name" +
            "  ) WHERE ROWNUM <= ?" +
            ") WHERE rn > ?";
    try {
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, currentPage * itemsPerPage); // 상한
        pstmt.setInt(2, (currentPage - 1) * itemsPerPage); // 하한
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###");
            int carPrice = rs.getInt("car_price");
            int mileage = rs.getInt("car_mileage");
            String formattedMileage = formatter.format(mileage);
            String formattedPrice = formatter.format(carPrice);
    %>
    <div class="car_box">
        <div>차 이름:  <%= rs.getString("car_name") %></div>
        <div>주행 거리:  <%= formattedMileage %> km</div>
        <div>월납입금:  <%= formattedPrice %> 원</div>
        <div>차 종류: <%= rs.getString("car_type") %></div>
    </div>
    <%
        }

        // 전체 데이터 총 조회
        String countSql = "SELECT COUNT(*) AS total FROM car_list_view";
        PreparedStatement countPstmt = conn.prepareStatement(countSql);
        ResultSet countRs = countPstmt.executeQuery();
        int totalItems = 0;
        if (countRs.next()) {
            totalItems = countRs.getInt("total");
        }
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
        DBManager.dbClose(conn, pstmt, rs);
        DBManager.dbClose(null, countPstmt, countRs);
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

















 