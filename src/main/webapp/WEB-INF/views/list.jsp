<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<%-- <%@ include file="/ssi/ssi_bbs.jsp" %> --%>

<%-- <% 
	String col = (String)request.getAttribute("col");
	String word = (String)request.getAttribute("word");		
	int nowPage = (Integer)request.getAttribute("nowPage");

	List<BbsDTO> list = (List<BbsDTO>)request.getAttribute("list");
	String paging = (String)request.getAttribute("paging");

%> --%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(bbsno){
       var url = "read";
       url += "?bbsno="+bbsno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;

     }
     
     function fileDown(filename){
         var url = "./fileDown";
         url += "?filename="+filename;
         url += "&dir=/storage";
         //alert(url);
         location.href=url;
     }

  
  </script>

</head>
<body>
<div class="container">

  <h2>게시판 목록</h2>
  <form class="form-inline" action="./list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="wname"
        <c:if test="${ col=='wname' }">selected</c:if>
        >성명</option>
        <option value="title"
        <c:if test="${ col=='title' }">selected</c:if>
        >제목</option>
        <option value="content"
        <c:if test="${ col=='content' }">selected</c:if>
        >내용</option>
        <option value="tile_content"
        <c:if test="${ col=='tile_content' }">selected</c:if>
        >제목+내용</option>
        <option value="total"
        <c:if test="${ col=='total' }">selected</c:if>
        >전체출력</option>
        
        <%-- <% if(col.equals("wname")) out.print("selected");%>
        >성명</option>
        <option value="title"
        <% if(col.equals("title")) out.print("selected");%>
        >제목</option>
        <option value="content"
        <% if(col.equals("content")) out.print("selected");%>
        >내용</option>
        <option value="title_content"
         <% if(col.equals("title_content")) out.print("selected");%>
        >제목+내용</option>
        <option value="total"
        <% if(col.equals("total")) out.print("selected");%>
        >전체출력</option>    --%>    
     </select>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${ word } ">
    </div>
    <button type="submit" class="btn btn-default" >검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='./create'">등록</button>
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>파일</th>
    <th>grpno</th>
    <th>indent</th>
    <th>ansnum</th>
    </tr>
   </thead>
   <tbody>
   
<c:choose>
	<c:when test="${ empty list }">
		<tr><td colspan="6">등록된 글이 없습니다.</td>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${ list }">
			<tr>
				<td>${ dto.bbsno }</td>
				<td>
					<c:forEach begin="1" end="${ dto.indent }">
						&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${ dto.indent > 0 }">
						<img src='../images/re.jpg'>
					</c:if>
					
					<c:set var="rcount" value="${util:rcount(dto.bbsno,rmapper) }"/>
					<a href="javascript:read('${ dto.bbsno }')">${ dto.title }</a>
					<c:if test="${rcount>0 }">
            			<span class="badge">${rcount}</span>
    				</c:if>
					
					<c:if test="${ util:newImg(fn:substring(dto.wdate,0,10)) }">
						<img src="../images/new.gif">
					</c:if>
				</td>
				<td>${ dto.wname }</td>
				<td>
					<c:choose>
						<c:when test="${ empty dto.filename }">
							파일없음
						</c:when>
						<c:otherwise>
							<a href="javascript:fileDown('${dto.filename}')">
								${ dto.filename }
							</a>		
						</c:otherwise>
					</c:choose>
				</td>
				<td>${ dto.grpno }</td>
				<td>${ dto.indent }</td>
				<td>${ dto.ansnum }</td>
		</c:forEach>	
	</c:otherwise>
</c:choose>
</tbody>
</table>
<%-- <%if(list.size() ==0){ %> 
   <tr><td colspan="6">등록된 글이 없습니다.</td>

<%}else{
  
   for(int i=0; i<list.size();i++){
      BbsDTO dto = list.get(i);
      
%> 
   <tr>
    <td><%=dto.getBbsno() %></td>
    <td>
      <%
       for(int r=0; r<dto.getIndent(); r++){
              out.println("&nbsp;&nbsp;");
       }
       if(dto.getIndent()>0)
           // out.print("[답변]");
               out.print("<img src='"+root+"/images/re.jpg' >");
       %>

   
    <a href="javascript:read('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
    <% if(Utility.compareDay(dto.getWdate().substring(0,10))){ %> 
    <img src="<%=root %>/images/new.gif"> 
    <% } %> 
    
    </td>
    <td><%=dto.getWname() %></td>
    <td><% if(dto.getFilename() == null) { %> 
    		파일없음
    	<% }else{ %>
    		<%=dto.getFilename() %>
    	<% } %>
    </td>
    <td><%=dto.getGrpno() %></td>
    <td><%=dto.getIndent() %></td>
    <td><%=dto.getAnsnum() %></td>
   </tr>
<%  
   } //for_end
   
  } //if_end
%>  
   </tbody>
  
  </table> --%>
  <div>
      ${paging}
  </div>
</div>
</body> 
</html> 
