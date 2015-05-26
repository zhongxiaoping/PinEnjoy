<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"+request.getServerName()+":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>搜索页</title>
    <style type="text/css">
      ._main {
        margin: 30px 30px 30px 50px;
        height: 500px;
      }
      ._searchResult {
        margin-bottom: 30px;
      }
      ._content {
        float: left;
      }
      ._imageContent {
        width: 50px;
        height: 50px;
      }
      ._sideNav {
        width: 300px;
        float: right;
      }
      ._searchNav {
        margin-top: 30px;
      }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="_main">
       <div class="_searchResult">
           <p id="_searchContent">${searchContent}</p>
           <p class="help-block">PinEnjoy为您找到相关结果约${sumOfSearch }个</p>
       </div>
       <div class="_content">
         <div id="_searchImageContent">
           <%--<div class="media">
              <div class="media-left media-middle _imageContent">
                <a href="#">
                  <img class="media-object" src="static/image/sys/logo.png" alt="xxx">
                </a>
              </div>
              <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                  我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道
              </div>
           </div>--%>
           <div class="_searchNav">
             <nav>
               <ul class="pager">
                 <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> 上一页</a></li>
                 <li class="next"><a href="#">下一页 <span aria-hidden="true">&rarr;</span></a></li>
               </ul>
             </nav>
           </div>
         </div>
       </div>
       <div class="_sideNav">
          <div class="list-group">
            <li class="list-group-item">
              <span class="glyphicon glyphicon-align-right" aria-hidden="true"></span>
              <span class="badge">14</span>
                图片分类
            </li>
            <li class="list-group-item">
              <span class="badge">14</span>
              <a href="#">Dapibus ac facilisis in</a>
            </li>
            <li class="list-group-item">
              <span class="badge">14</span>
              <a href="#">Dapibus ac facilisis in</a>
            </li>
            <li class="list-group-item">
              <span class="badge">14</span>
              <a href="#">Dapibus ac facilisis in</a>
            </li>
            <li class="list-group-item">
              <span class="badge">14</span>
              <a href="#">Dapibus ac facilisis in</a>
            </li>
            <li class="list-group-item">
              <span class="badge">14</span>
              <a href="#">Dapibus ac facilisis in</a>
            </li>
          </div>
       </div>

    </div>

    <jsp:include page="bottom.jsp"/>

    <script type="text/javascript">
      $(function() {
        getJSONData();
      });

      function getJSONData() {
        var $searchContent = $("#_searchContent").text();

        $.getJSON($searchContent + "/" + pn + "/tosearch", function(data) {
          var $_searchImageContent = $("#_searchImageContent");
          $_searchImageContent.empty();

          for (var i = 1; i <= 12; i++) {
            $_searchImageContent.append('<div class="media _imagetent">')
                    .append('</div>');
          }

          for (var j = 0; j < 12; j++) {
            $("._imagetent").eq(j).append('<div class="media-left media-middle _imageContent"> <a href="' + data[j].image_id + '/detail">')
                    .append('<img class="media-object" src="' +  data[j].image_location
                    +'">').append('</p></div>')
                    .append('<div class="media-body"><h4 class="media-heading">' + data[j].image_title
                    + '</h4>' + data[j].image_description).append('</div></div>');
            }

        })
      }

    </script>

</body>
</html>
