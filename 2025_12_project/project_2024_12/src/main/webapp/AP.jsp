<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<%
//한글 처리
	request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AP</title>
  <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
    <link rel="stylesheet" href="./css/AP.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/AP.js"></script>
</head>
<body>
    <header>
      <div class="logo" onclick="location.href = './main.jsp'"></div>
        <div class="menu" onclick="location.href = './AP.jsp'">  게시판</div>
        <div class="members">
        <%            
        String user = (String) session.getAttribute("userid");
        if (user != null) {
    %>
        <div class="user-info">
          <span><%= session.getAttribute("name") %>님 환영합니다!</span>
          <button onclick="location.href='./MyPage.jsp'">마이페이지</button>
        </div>
    <% 
      } else {
    %>
        <div class="login" onclick="location.href = './login.jsp'">로그인</div>
        <div class="Sing_Up" onclick="location.href = './Sing_Up.jsp'">회원가입</div>
    <% 
      }
    %>
        </div>
    </header>
     <main>
        <div class="section_1">
            <div class="section_1_container" id="slider_1">
                <div class="section_1_slider">
                
                </div>
                <div class="section_1_slider">
                
                </div>
                <div class="section_1_slider">
                
                </div>
            </div>
            <div class="section_1_controls">
                <button class="section_1_button" id="prev"> < </button>
                <button class="section_1_button" id="next"> > </button>
            </div>
            <div class="dots" id="dots"></div>
        </div>
        <div class="section_2">
            <div class="section_2_box">
                <div class="section_2_title"><h2>Our Models</h2></div>
                <div class="section_2_subtitle"><h3> 다양한 차량을 만나보세요.</h3></div>
                <div class="Car_color">
                    <div onclick="showMain(1)"  class="Car_color_box" id="Car_color_tag1">경차</div>
                    <div onclick="showMain(2)"  class="Car_color_box" id="Car_color_tag2">중형차</div>
                    <div onclick="showMain(3)"  class="Car_color_box" id="Car_color_tag3">Suv</div>
                    <div onclick="showMain(4)"  class="Car_color_box" id="Car_color_tag4">트럭 / 화물</div>
                </div>
                <div class="Car_type" >
                    <div class="Car_type_box Car_type_box_scroll  Car_type_js_1" id="Car_type_divA">
                        <div  class="Car_conten">
                          <%
                                                          Connection conn = null;
                                                          PreparedStatement pstmt = null;
                                                          ResultSet rs = null;

                                                          try {
                                                              conn = DBManager.getDBConnection();
                                                              String sql = "SELECT l_car_bno , l_car_name, l_mileage , l_car_price FROM light_cars";
                                                              pstmt = conn.prepareStatement(sql);
                                                              rs = pstmt.executeQuery();
                                                              
                                                              java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###");
                                                              // 결과를 HTML로 출력
                                                              while (rs.next()) {
                                                              	int L_carBno = rs.getInt("l_car_bno");
                                                              	int L_mileage = rs.getInt("l_mileage");
                                                                  String L_carName = rs.getString("l_car_name");
                                                                  int L_carPrice = rs.getInt("l_car_price");
                                                                  
                                                                  String formattedMileage = formatter.format(L_mileage);
                                                                  String formattedPrice = formatter.format(L_carPrice);
                          ;
                          %>
                                <div class="car_box" onclick="location.href = './Board.jsp'">
                                <div class="car_photos">
                                <div> 차량 번호: <%=L_carBno%></div>
                                 <div> <%=L_carName%></div>
                                 </div>
                                <div class="car_list">
                                    <div>주행거리: <%=formattedMileage%> km</div>
                                    <div>가격: <%=formattedPrice%> 원</div>
                                </div>
                            </div>
                            <%
                            }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                                if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                                if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                            }
                            %>
                         </div>
                   </div>
                    <div class="Car_type_box Car_type_box_scroll  Car_type_js_2 " id="Car_type_divB">
                     <div  class="Car_conten">
                    <%
                    try {
                                                        conn = DBManager.getDBConnection();
                                                        String sql = "SELECT C_car_bno , C_car_name, C_mileage , C_car_price FROM Compact_cars";
                                                        pstmt = conn.prepareStatement(sql);
                                                        rs = pstmt.executeQuery();

                                                        // 결과를 HTML로 출력
                                                        while (rs.next()) {
                                                        	int C_carBno = rs.getInt("C_car_bno");
                                                        	int C_mileage = rs.getInt("C_mileage");
                                                            String C_carName = rs.getString("C_car_name");
                                                            int C_carPrice = rs.getInt("C_car_price");
                                                            
                                                            java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###");
                                                            
                                                            String formattedMileage = formatter.format(C_mileage);
                                                            String formattedPrice = formatter.format(C_carPrice);
                    ;
                    ;
                    %>
                                <div class="car_box" onclick="location.href = './Board.jsp'">
                                <div class="car_photos">
                                <div> 차량 번호: <%=C_carBno%></div>
                                 <div><%=C_carName%></div>
                                 </div>
                                <div class="car_list">
                                    <div>주행거리: <%=formattedMileage%> km</div>
                                    <div>가격: <%=formattedPrice%> 원</div>
                                </div>
                            </div>
                            <%
                            }
                                                        } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                                if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                                if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                            }
                            %>
                     </div>
                    </div>
                    <div class="Car_type_box Car_type_box_scroll  Car_type_js_3 " id="Car_type_divC">
                        <div  class="Car_conten">
                           <%
                           try {
                                                               conn = DBManager.getDBConnection();
                                                               String sql = "SELECT S_car_bno , S_car_name, S_mileage , S_car_price FROM Suv";
                                                               pstmt = conn.prepareStatement(sql);
                                                               rs = pstmt.executeQuery();

                                                               // 결과를 HTML로 출력
                                                               while (rs.next()) {
                                                               	int S_carBno = rs.getInt("S_car_bno");
                                                               	int S_mileage = rs.getInt("S_mileage");
                                                                   String S_carName = rs.getString("S_car_name");
                                                                   int S_carPrice = rs.getInt("S_car_price");
                                                                   
                                                                   java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###");
                                                                   String formattedMileage = formatter.format(S_mileage);
                                                                   String formattedPrice = formatter.format(S_carPrice);
                           ;
                           ;
                           %>
                                     <div class="car_box" onclick="location.href = './Board.jsp'">
                                <div class="car_photos">
                                 <div>차량 번호 <%=S_carBno%></div>  
                                 <div><%=S_carName%></div>
                                 </div>
                                <div class="car_list">
                                    <div>주행거리: <%=formattedMileage%> km</div>
                                    <div>가격: <%=formattedPrice%> 원</div>
                                </div>
                            </div>
                            <%
                            }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                                if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                                if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                                            }
                            %>
                     </div>
                           
                      
                    </div>
                    <div class="Car_type_box Car_type_box_scroll  Car_type_js_4 " id="Car_type_divD">
                          <div  class="Car_conten">
                           <%
                           try {
                                                               conn = DBManager.getDBConnection();
                                                               String sql = "SELECT h_car_bno , h_car_name, h_mileage , h_car_price FROM heavy_cars";
                                                               pstmt = conn.prepareStatement(sql);
                                                               rs = pstmt.executeQuery();

                                                               // 결과를 HTML로 출력
                                                               while (rs.next()) {
                                                               	int h_carBno = rs.getInt("h_car_bno");
                                                               	int h_mileage = rs.getInt("h_mileage");
                                                                   String h_carName = rs.getString("h_car_name");
                                                                   int h_carPrice = rs.getInt("h_car_price");
                                                                   
                                                                   java.text.DecimalFormat formatter = new java.text.DecimalFormat("#,###");
                                                                   String formattedMileage = formatter.format(h_mileage);
                                                                   String formattedPrice = formatter.format(h_carPrice);
                           ;
                           %>
                            <div class="car_box" onclick="location.href = './Board.jsp'">
                                <div class="car_photos">
                                 <div> 차량 번호 <%= h_carBno %></div>  
                                 <div> <%= h_carName %></div>
                                 </div>
                                <div class="car_list">
                                    <div>주행거리: <%= formattedMileage %> km</div>
                                    <div>가격: <%= formattedPrice %> 원</div>
                                </div>
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                    if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                    if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
                                }
                            %>
                     </div>
                    </div>
                </div>
            </div>
        </div>
        
      <div class="section_3" id="section_3_onclick">
            <div class="section_3_box" onclick="changeBg('green')">
                <div>월드 프리미어 </div>
                <div>최초로 공개되는 혁신적인 기술과 디자인</div>
            </div>
            <div class="section_3_box" onclick="changeBg('orange')">
                <div>새로움 복합체험 공간</div>
                <div>상상을 현실로 만드는 다양한 체험</div>
            </div>
            <div class="section_3_box" onclick="changeBg('purple')">
                <div>스마트한 카</div>
                <div>첨단 기술로 만들어진 미래의 자동차</div>
            </div>
        </div>
    </main>
    <footer>
    </footer>
</body>
</html>