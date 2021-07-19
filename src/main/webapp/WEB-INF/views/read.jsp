<%@ page contentType="text/html; charset=UTF-8" %> 
<%-- <%@ include file="/ssi/ssi_bbs.jsp" %>
<%    
     
	BbsDTO dto = (BbsDTO) request.getAttribute("dto");
    /* String content = dto.getContent().replaceAll("\r\n", "<br>"); */      
    //페이징, 검색 유지
    String nowPage = request.getParameter("nowPage");
    String col = request.getParameter("col");
    String word = request.getParameter("word");
%>  --%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">

  <script type="text/javascript">
    function updateM(){
      var url = "update";
      url += "?bbsno=${dto.bbsno}";
      
      location.href=url;
    }
    function deleteM(){
      var url = "delete";
      url += "?bbsno=${ dto.bbsno }";
      url += "&oldfile=${ dto.filename }";
      
      location.href=url;
    }
    function replyM(){
        var url = "reply";
        url += "?bbsno=${ dto.bbsno }";
        
        location.href=url;
      }
    
    function listM(){
        var url = "list";
        url += "?nowPage=${param.nowPage}";
        url += "&col=${param.col}";
        url += "&word=${param.word}";
        location.href=url;
      }
  </script>

</head>
<body>  
<div class="container">

<h2>조회</h2>
<div class="panel panel-default">
<div class="panel-heading">작성자</div>
<div class="panel-body">${ dto.wname }</div>

<div class="panel-heading">제목</div>
<div class="panel-body">${ dto.title }</div>

<div class="panel-heading">내용</div>
<div class="panel-body" style="height: 150px">${ dto.content }</div>

<div class="panel-heading">조회수</div>
<div class="panel-body">${ dto.viewcnt }</div>

<div class="panel-heading">등록일</div>
<div class="panel-body">${ dto.wdate }</div>

<div class="panel-heading">파일</div>
<div class="panel-body">${ dto.filename }</div>
</div>

<div>
<button type="button" class="btn" onclick="location.href='./create'">등록</button>
<button type="button" class="btn" onclick="updateM()">수정</button>
<button type="button" class="btn" onclick="deleteM()">삭제</button>
<button type="button" class="btn" onclick="replyM()">답변</button>
<button type="button" class="btn" onclick="listM()">목록</button>
</div>

</div>
</body> 
</html> 