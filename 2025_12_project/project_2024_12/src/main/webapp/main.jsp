<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.company1.DBManager" %>
<% request.setCharacterEncoding("UTF-8"); %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="./css/main.css">
     <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
    <script src="./js/main.js"></script>
</head>
<body>
    <header>
        <div class="logo" onclick="location.href = './Ev_page.html'"> 로고(이미지나 글)</div>
        <div class="menu"> 메뉴</div>
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
        <div class="login" onclick="location.href = './login.jsp'">로그인(이미지나 글)</div>
        <div class="Sing_Up" onclick="location.href = './Sing_Up.jsp'">회원가입(이미지나 글)</div>
    <% 
      }
    %>
        </div>
    </header>
    <main>
        <div class="search_1">
            <div class="title">
                <h1>Model</h1>
            </div>
            <div class="subtitle">
                <h3> 최근 한달 동안 고객님들이 가장 많이 구매하신 모델입니다.</h3>
            </div>
            <div class="search_box search_1_box">
                <div>사진</div>
                <div>
                    <div class="search_1_title">
                        <div onclick="showMain(1)" class="search_1_img_box" id="search_1_tag1"> 클릭시 효과</div>
                        <div onclick="showMain(2)" class="search_1_img_box" id="search_1_tag2"> 클릭시 효과</div>
                        <div onclick="showMain(3)" class="search_1_img_box" id="search_1_tag3"> 클릭시 효과</div>
                        <div onclick="showMain(4)" class="search_1_img_box" id="search_1_tag4"> 클릭시 효과</div>
                    </div>
                    <div class="search_1_subtitle">
                        <h1>제목</h1>
                    </div>
                    <div class="search_1_so_img_box">
                        <div class="search_1_type_box search_1_js_1">
                            <div>1</div>
                            <div>2</div>
                        </div>
                        <div class="search_1_type_box search_1_js_2">
                            <div>11111</div>
                            <div>2</div>
                        </div>
                        <div class="search_1_type_box search_1_js_3">
                            <div>11111</div>
                            <div>2</div>
                        </div>
                        <div class="search_1_type_box search_1_js_4">
                            <div>111</div>
                            <div>2</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="search_2">
            <div class="title">
                <h1>전기차</h1>
            </div>
            <div class="subtitle">
                <h3>지구 환경을 품은 자동차의 미래형 모빌리티를 경험해보세요.</h3>
            </div>
            <div class="search_box">
                <div class="search_2_box_1">
                    <div class="search_2_box_12">
                        <div class="search_2_box_12">
                            <div class="box_outer">
                                <div class="box_inner">
                                </div>
                            </div>
                        </div>           
                    </div>
                </div>
                <div class="search_2_box_2">
                    <div id="slider_1" class="slider">
                        <div class="slide">1</div>
                        <div class="slide">2</div>
                        <div class="slide">3</div>
                        <div class="slide">4</div>
                    </div>
                    <button id="prev" class="slider-button prev-button"> < </button>
                    <button id="next" class="slider-button next-button"> ></button>
                    <div id="dots" class="dots-container"></div>
                </div>
            </div>
        </div>
        
        <div class="search_3">
            <div class="title">
                <h1>Brand</h1>
            </div>
            <div class="subtitle">
                <h3> 지속 가능한 미래로의 연결을 추구하는 자동차의 브랜드 캠페인을 만나보세요.</h3>
            </div>
            <div class="search_box search_3_box">
                <div>
                    <div></div>
                </div>
                <div>
                    <div></div>
                </div>
                <div>
                    <div></div>
                </div>
                <div>
                    <div></div>
                </div>
            </div>
        </div> 
    </main>
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
           <div>고객 서비스 링크</div>
            <ul>
                <li> 사용 가이드</li>
                <li> 자주 묻는 질문 (FAQ)</li>
                <li>가격 정채 페이지</li>
                <li> 고객 지원 / 고객 센터</li>
            </ul>
        </div>
        <div class="footer_3"> 
             <div>정책 관련 링크 </div>
            <ul>
                <li>개인정보 처리 방침</li>
                <li> 사이트 이용 약관</li>
                <li>  쿠키 정책</li>
            </ul>
        </div>
        <div class="footer_4"> 
           <div>저작권 정보 </div> 
            <ul>
                <li>웝사이트 소유자 정보</li>
                <li>웹사이트 저작권 정보 (연도 및 소유자)</li>
            </ul>
        </div>
    </footer>
</body>
</html>