<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9"/>
<meta name="keywords" content=" " /> 
<meta name="description" content=" " />
<meta name="viewport" content="width=1000"/>
<meta name="format-detection" content="telephone=no"/>
<title>placeres</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/res/css/common.css" />
<link rel="stylesheet" type="text/css" href="/res/css/contents.css" />
<link rel="stylesheet" href="/res/css/jquery-ui-1.10.4.min.css" />
<link rel="stylesheet" href="/res/css/datepicker.css" />
<link rel="stylesheet" href="/res/css/font-awesome.min.css"/>
<link rel="stylesheet" href="/res/css/reservation.css"/>
<!-- Script -->
<script type="text/javascript" src="/res/js/jquery-1.10.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/res/js//jquery-ui.js" charset="utf-8"></script>
<script type="text/javascript" src="/res/js//jquery.cookie.js" charset="utf-8"></script>
<script type="text/javascript" src="/res/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="/res/js/reservation_add.js" charset="utf-8"></script>
<script type="text/javascript" src="/res/js/reservation.js" charset="utf-8"></script>

</head>

<body>
	<!-- wrap -->
<header>
  <div class="head-content">
    <h1 style="margin-top: 32px; font-size: 27px" ><a href="/">HOME</a></h1>
 
    <div class="nav" align="right">
    
      <ul>
       <li class="dep02" style="margin-top: 20px;" >
          <h2><a href="../member/questionborder">문의</a></h2>
        </li>
        <li class="dep02" style="margin-top: 20px;" >
          <h2><a href="reservation_list">예약현황</a></h2>
        </li>
        <li class="dep02" style="margin-top: 20px">
          <h2><a href="../branchinfo/branchmain">강의실 보기</a></h2>
        </li>
        
      </ul>
    </div>
  </div>
</header>

	<div id="wrap" class="rev_write"> 
		<!-- container -->
		<div id="container"> 		
		
			<!-- content -->
			<div id="content">	
				<div class="rnb">
					<p class="title_h3"><img src="http://iuc.cnu.ac.kr/assets/images/img_title_h3_reservation.gif"  alt="예약하기" /></p>
					<div class="room_info">
						<p class="room_cat">강의실</p>
						<p class="classroom_data" id="classroom_data" ><font style="color:#FF0000;">강의실을 선택해 주세요</font></p><br>				
						<p class="equipment_data" id="equipment_data" ></p>	
					</div>
					
					<div class="rev_info">
						<p class="rev_title">예약일시</p>
						<p class="rev_data"><span id="selectDate"></span></p><span id="selectTime"></span></p>
					</div>
				</div>
				<div class="contents">
					<div class="section">
						<div class="article article_roomname">
							<p class="title" style="font">강의실</p>
							<div class="list">
								<p class="class_title">지점</p>
								
									<select class="custom-select" 
											style=" width: 200px; margin-top:5px; font-size: 15px"  id="branchNoSelect" onchange="getClassroomName()">
										</select>
											<font class="text">예약 목적 </font>   <input type="text" id="reservation_title" name="reservation_title" maxlength="20" style="width: 200px"/> 
							</div>
						
							<div class="list list_02">
								<p class="class_title">호실</p>
									<select class="custom-select"
											style="width: 200px; margin-top:8px; font-size: 15px" id="classroomSelectList" onchange="classroomPrint(),equipmentPrint()" >
											<option>지점을 선택해 주세요</option>
										</select>
											<font class="text">예약 인원  </font>  <input type="number" size="200px" id="reservation_persons" name="reservation_persons" style=""/> 
							</div>
												
						</div>
						<!-- // atricle -->
					</div>
					<!-- // section -->
					<div class="section clearfix">
						<div id="calendar_wrap" class="article article_calender calender_6">
							<!-- 달력의 날짜 줄이 6줄일 경우에는 class="article article_calender"에 class="calender_6"를 추가하면 줄간격이 조절됨. 
							       5줄로 사용할 경우에는 class="calender_6"를 삭제하면 5줄에 맞게 줄간격이 조절 됨. -->
							<div class="head">
						
								<a href="javascript:;" id="prevMonth"><img src="http://iuc.cnu.ac.kr/assets/images/btn_prev.gif" alt="이전달로 가기" /></a>
								<span class="month" id="theDate" data-year="" data-month="" ></span>
								<a href="javascript:;" id="nextMonth"><img src="http://iuc.cnu.ac.kr/assets/images/btn_next.gif" alt="다음달로 가기" /></a>
							</div>
							<div class="table">
								<table id="table_calendar">
									<colgroup>
										<col width="60"/>
										<col width="60"/>
										<col width="60"/>
										<col width="60"/>
										<col width="60"/>
										<col width="60"/>
										<col width="60"/>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">일</th>
											<th scope="col">월</th>
											<th scope="col">화</th>
											<th scope="col">수</th>
											<th scope="col">목</th>
											<th scope="col">금</th>
											<th scope="col">토</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td><em>1</em></td>
											<td><em>2</em></td>
											<td><em>3</em></td>
											<td><em>4</em></td>
											<td><a href="javascript:;">5</a></td>
											<td class="last"><em>6</em></td>
										</tr>
										<tr>
											<td class="first"><em>7</em></td>
											<td><a href="javascript:;">8</a></td>
											<td><a href="javascript:;">9</a></td>
											<td><a href="javascript:;">10</a></td>
											<td><a href="javascript:;">11</a></td>
											<td><a href="javascript:;">12</a></td>
											<td class="last"><em>13</em></td>
										</tr>
										<tr>
											<td class="first"><em>14</em></td>
											<td><a href="javascript:;">15</a></td>
											<td><a href="javascript:;">16</a></td>
											<td><a href="javascript:;">17</a></td>
											<td><a href="javascript:;">18</a></td>
											<td><a href="javascript:;">19</a></td>
											<td class="last"><em>20</em></td>
										</tr>
										<tr>
											<td class="first"><em>21</em></td>
											<td><a href="javascript:;">22</a></td>
											<td><a href="javascript:;">23</a></td>
											<td><a href="javascript:;">24</a></td>
											<td><a href="javascript:;">25</a></td>
											<td><a href="javascript:;">26</a></td>
											<td class="last"><em>27</em></td>
										</tr>
										<tr>
											<td class="first"><em>28</em></td>
											<td><a href="javascript:;">29</a></td>
											<td><a href="javascript:;">30</a></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="last"></td>
										</tr>
										<tr>
											<td class="first"><em></em></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td class="last"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- // atricle -->
						<div class="article article_timeBoard">
							<div class="head">
								<span class="bold">이용시간 선택</span><span class="small"> (연속선택 가능)</span>
							</div>	
							<div class="table">
								<table>
									<colgroup>
										<col width="33%">
										<col width="34%">
										<col width="33%">
									</colgroup>

									<tbody>
<!-- 
<tr><td class="first time" data-stime="000" data-etime="030"><a href="javascript:;">00:00 - 00:30</a></td><td class="time" data-stime="030" data-etime="100"><a href="javascript:;">00:30 - 01:00</a></td><td class="last time" data-stime="100" data-etime="130"><a href="javascript:;">01:00 - 01:30</a></td></tr><tr><td class="first time" data-stime="130" data-etime="200"><a href="javascript:;">01:30 - 02:00</a></td><td class="time" data-stime="200" data-etime="230"><a href="javascript:;">02:00 - 02:30</a></td><td class="last time" data-stime="230" data-etime="300"><a href="javascript:;">02:30 - 03:00</a></td></tr><tr><td class="first time" data-stime="300" data-etime="330"><a href="javascript:;">03:00 - 03:30</a></td><td class="time" data-stime="330" data-etime="400"><a href="javascript:;">03:30 - 04:00</a></td><td class="last time" data-stime="400" data-etime="430"><a href="javascript:;">04:00 - 04:30</a></td></tr><tr><td class="first time" data-stime="430" data-etime="500"><a href="javascript:;">04:30 - 05:00</a></td><td class="time" data-stime="500" data-etime="530"><a href="javascript:;">05:00 - 05:30</a></td><td class="last time" data-stime="530" data-etime="600"><a href="javascript:;">05:30 - 06:00</a></td></tr><tr><td class="first time" data-stime="600" data-etime="630"><a href="javascript:;">06:00 - 06:30</a></td><td class="time" data-stime="630" data-etime="700"><a href="javascript:;">06:30 - 07:00</a></td><td class="last time" data-stime="700" data-etime="730"><a href="javascript:;">07:00 - 07:30</a></td></tr><tr><td class="first time" data-stime="730" data-etime="800"><a href="javascript:;">07:30 - 08:00</a></td><td class="time" data-stime="800" data-etime="830"><a href="javascript:;">08:00 - 08:30</a></td><td class="last time" data-stime="830" data-etime="900"><a href="javascript:;">08:30 - 09:00</a></td></tr><tr><td class="first time" data-stime="900" data-etime="930"><a href="javascript:;">09:00 - 09:30</a></td><td class="time" data-stime="930" data-etime="1000"><a href="javascript:;">09:30 - 10:00</a></td><td class="last time" data-stime="1000" data-etime="1030"><a href="javascript:;">10:00 - 10:30</a></td></tr><tr><td class="first time" data-stime="1030" data-etime="1100"><a href="javascript:;">10:30 - 11:00</a></td><td class="time" data-stime="1100" data-etime="1130"><a href="javascript:;">11:00 - 11:30</a></td><td class="last time" data-stime="1130" data-etime="1200"><a href="javascript:;">11:30 - 12:00</a></td></tr><tr><td class="first time" data-stime="1200" data-etime="1230"><a href="javascript:;">12:00 - 12:30</a></td><td class="time" data-stime="1230" data-etime="1300"><a href="javascript:;">12:30 - 13:00</a></td><td class="last time" data-stime="1300" data-etime="1330"><a href="javascript:;">13:00 - 13:30</a></td></tr><tr><td class="first time" data-stime="1330" data-etime="1400"><a href="javascript:;">13:30 - 14:00</a></td><td class="time" data-stime="1400" data-etime="1430"><a href="javascript:;">14:00 - 14:30</a></td><td class="last time" data-stime="1430" data-etime="1500"><a href="javascript:;">14:30 - 15:00</a></td></tr><tr><td class="first time" data-stime="1500" data-etime="1530"><a href="javascript:;">15:00 - 15:30</a></td><td class="time" data-stime="1530" data-etime="1600"><a href="javascript:;">15:30 - 16:00</a></td><td class="last time" data-stime="1600" data-etime="1630"><a href="javascript:;">16:00 - 16:30</a></td></tr><tr><td class="first time" data-stime="1630" data-etime="1700"><a href="javascript:;">16:30 - 17:00</a></td><td class="time" data-stime="1700" data-etime="1730"><a href="javascript:;">17:00 - 17:30</a></td><td class="last time" data-stime="1730" data-etime="1800"><a href="javascript:;">17:30 - 18:00</a></td></tr><tr><td class="first time" data-stime="1800" data-etime="1830"><a href="javascript:;">18:00 - 18:30</a></td><td class="time" data-stime="1830" data-etime="1900"><a href="javascript:;">18:30 - 19:00</a></td><td class="last time" data-stime="1900" data-etime="1930"><a href="javascript:;">19:00 - 19:30</a></td></tr><tr><td class="first time" data-stime="1930" data-etime="2000"><a href="javascript:;">19:30 - 20:00</a></td><td class="time" data-stime="2000" data-etime="2030"><a href="javascript:;">20:00 - 20:30</a></td><td class="last time" data-stime="2030" data-etime="2100"><a href="javascript:;">20:30 - 21:00</a></td></tr><tr><td class="first time" data-stime="2100" data-etime="2130"><a href="javascript:;">21:00 - 21:30</a></td><td class="time" data-stime="2130" data-etime="2200"><a href="javascript:;">21:30 - 22:00</a></td><td class="last time" data-stime="2200" data-etime="2230"><a href="javascript:;">22:00 - 22:30</a></td></tr><tr><td class="first time" data-stime="2230" data-etime="2300"><a href="javascript:;">22:30 - 23:00</a></td><td class="time" data-stime="2300" data-etime="2330"><a href="javascript:;">23:00 - 23:30</a></td><td class="last time" data-stime="2330" data-etime="2400"><a href="javascript:;">23:30 - 24:00</a></td></tr>-->
               							<tr>
               								<td class="first time" data-stime="900" data-etime="930"><a href="javascript:;">09:00 - 09:30</a></td>
               								<td class="time" data-stime="930" data-etime="1000"><a href="javascript:;">09:30 - 10:00</a></td>
               								<td class="last time" data-stime="1000" data-etime="1030"><a href="javascript:;">10:00 - 10:30</a></td>
               							</tr>
               							<tr>
               								<td class="first time" data-stime="1030" data-etime="1100"><a href="javascript:;">10:30 - 11:00</a></td>
               								<td class="time" data-stime="1100" data-etime="1130"><a href="javascript:;">11:00 - 11:30</a></td>
               								<td class="last time" data-stime="1130" data-etime="1200"><a href="javascript:;">11:30 - 12:00</a></td>
               							</tr>
               							<tr>
               								<td class="first time" data-stime="1200" data-etime="1230"><a href="javascript:;" >12:00 - 12:30</a></td>
               								<td class="time" data-stime="1230" data-etime="1300"><a href="javascript:;" >12:30 - 13:00</a></td>
               								<td class="last time" data-stime="1300" data-etime="1330"><a href="javascript:;" >13:00 - 13:30</a></td>
               							</tr>
               							<tr>
               								<td class="first time" data-stime="1330" data-etime="1400"><a href="javascript:;" >13:30 - 14:00</a></td>
               								<td class="time" data-stime="1400" data-etime="1430"><a href="javascript:;" >14:00 - 14:30</a></td>
               								<td class="last time" data-stime="1430" data-etime="1500"><a href="javascript:;" >14:30 - 15:00</a></td>
               							</tr>
               							<tr>
               								<td class="first time" data-stime="1500" data-etime="1530"><a href="javascript:;" >15:00 - 15:30</a></td>
               								<td class="time" data-stime="1530" data-etime="1600"><a href="javascript:;" >15:30 - 16:00</a></td>
               								<td class="last time" data-stime="1600" data-etime="1630"><a href="javascript:;" >16:00 - 16:30</a></td>
               							</tr>
               							<tr>
               								<td class="first time" data-stime="1630" data-etime="1700"><a href="javascript:;">16:30 - 17:00</a></td>
               								<td class="time" data-stime="1700" data-etime="1730"><a href="javascript:;">17:00 - 17:30</a></td>
               								<td class="last time" data-stime="1730" data-etime="1800"><a href="javascript:;">17:30 - 18:00</a></td>
               							</tr>

               						</tbody>
								</table>
							</div>
						</div>
						<!-- // atricle -->
					</div>
				
				</div>

				<div class="btn_area">
					<div class="center">
						<a href="javascript:;" class="btn btn_full" id="reservation_save">예약하기</a>
						
					</div>
				</div>
				<!-- // btn_area -->
			</div>
			<!-- // content --> 
		</div>
		<!-- // container -->
	</div>
<!-- <input type="hidden" id="seq" name="seq" value="" />RESERVATION_SEQ -->
<input type="hidden" id="classroom_no" name="classroom_no"/>
<input type="hidden" id="reservation_date" name="reservation_date" value="" />
<input type="hidden" id="reservation_start" name="reservation_start" value="" />
<input type="hidden" id="reservation_end" name="reservation_end" value="" />
<input type="hidden" id="member_no" name="member_no" value="${memberVO.memberNo}"/>
<input type="hidden" id="reservation_persons" name="reservation_persons" value="${reservationRoomInfoVO.persons}"/>
  <footer id="footer">
        
           
                <div class="footer">
                    서울특별시 서초구 서초동 1303-37 서초W타워 13층  T. 1544-8147.<br>
			Copyright by EZEN. All rights reserved.
                    
              
           
        </div>
    </footer>
</body>

</html>
