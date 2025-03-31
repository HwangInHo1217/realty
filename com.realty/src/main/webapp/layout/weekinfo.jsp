<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--금주 분양 매물 정보 시작-->
  <section>
    <div class="weekdays">
      <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
      <div class="week_estates">
        <ul>
        <!-- foreach로 뿌려야함 -->
        <c:if test="${not empty sales}">
        	<c:forEach var="sale" items="${sales}">
        	<li onclick="goWeek_tails(${sale.sales_idx})">
            <span>매매</span>
            <div>${sale.s_type}</div>
            <aside>${sale.s_addr}</aside>
            <span>${sale.s_type}| ${sale.s_let}</span>
            <label>${sale.s_Bdate} | ${sale.s_Adate}</label>
            <div><img src="./room/${sale.s_file_ori}"></div>
          </li>
          </c:forEach>
        </c:if>
        <c:if test="${empty sales}">
        	<li>매물이 없습니다.</li>
        </c:if>
         <!--  <li onclick="goWeek_tails()">
            <span>매매</span>
            <div>LH센트럴힐(공공임대)</div>
            <aside>송파구 문정동</aside>
            <span>아파트 | 공공임대</span>
            <label>2023.11 분양 | 2024.09 입주</label>
            <div><img src="./room/room1.jpg"></div>
          </li> -->
        </ul>
      </div>
    </div>
  </section>
  <script>
  function goWeek_tails(idx){
	  location.href="./sale-detail/"+idx;
  }
  
  </script>
  <!--금주 분양 매물 정보 끝-->