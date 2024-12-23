<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%String userid = (String) session.getAttribute("userid");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ev</title>

    <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="./css/Footer.css">
    <link rel="stylesheet" href="./css/Ev.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/Ev.js"></script>
</head>
<body>
    <header>
    <div class="logo" onclick="location.href = './Ev_page.jsp'"> �ΰ�(�̹����� ��)</div>
    <div class="muen" onclick="location.href = './BoardInsertPage.jsp'"> �޴�</div>
    <div class="members">
       <% 
      String username = (String) session.getAttribute("userid");
      if (userid != null) {
    %>
        <div class="user-info">
          <span><%= session.getAttribute("name") %>�� ȯ���մϴ�!</span>
          <button onclick="location.href='./MyPage.jsp'">����������</button>
        </div>
    <% 
      } else {
    %>
        <div class="login" onclick="location.href = './login.jsp'">�α���(�̹����� ��)</div>
        <div class="Sing_Up" onclick="location.href = './Sing_Up.jsp'">ȸ������(�̹����� ��)</div>
    <% 
      }
    %>
    </div>
  </header>
    <main>
        <div class="section_1">
            <div class="section_1_container" id="slider_1">
                <div class="section_1_slider"> ��ǥ ����1</div>
                <div class="section_1_slider"> ��ǥ ����2</div>
                <div class="section_1_slider"> ��ǥ ����3</div>
            </div>
            <div class="section_1_controls">
                <button class="section_1_button" id="prev">����</button>
                <button class="section_1_button" id="next">����</button>
            </div>
            <div class="dots" id="dots"></div>
        </div>
        <div class="section_2">
            <div class="section_2_box">
                <div class="section_2_title"><h2>����</h2></div>
                <div class="section_2_subtitle"><h3>���� ����</h3></div>
                <div class="Car_color">
                    <div onclick="showMain(1)"  class="Car_color_box" id="Car_color_tag1">ALL</div>
                    <div onclick="showMain(2)"  class="Car_color_box" id="Car_color_tag2">2</div>
                    <div onclick="showMain(3)"  class="Car_color_box" id="Car_color_tag3">3</div>
                    <div onclick="showMain(4)"  class="Car_color_box" id="Car_color_tag4">4</div>
                </div>
                <div class="Car_type" >
                    <div class="Car_type_box Car_type_box_scroll Car_type_js_1" id="Car_type_div">
                        <div  class="Car_conten">
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Car_type_box Car_type_js_2">
                        <div class="Car_type_box_NOscroll">
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Car_type_box Car_type_js_3">
                        <div class="Car_type_box_NOscroll">
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Car_type_box Car_type_js_4">
                        <div class="Car_type_box_NOscroll">
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                            <div  class="car_box_no_scroll">
                                <div class="car_photos">���� �ִ°�</div>
                                <div class="car_list">
                                    <div>�ڵ��� �̸�</div>
                                    <div>����</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section_3" id="section_3_onclick">
            <div class="section_3_box" onclick="changeBg('green')">
                Ŭ�� �� �ڿ� ��� �ٲ�
            </div>
            <div class="section_3_box" onclick="changeBg('orange')">
                Ŭ�� �� �ڿ� ��� �ٲ�
            </div>
            <div class="section_3_box" onclick="changeBg('purple')">
                Ŭ�� �� �ڿ� ��� �ٲ�
            </div>
        </div>
    </main>
    <footer>
        <div class="footer_1"> SNS ���� �� 4��</div>
        <div class="footer_2"> �̻� �ΰ� �� ����</div>
        <div class="footer_3"> �� ��� �ּ� </div>
    </footer>
</body>
</html>