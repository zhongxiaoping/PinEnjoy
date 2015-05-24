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
           <p id="_searchContent"> ${searchContent} :</p>
           <p class="help-block">PinEnjoy为您找到相关结果约${sumOfSearch }个</p>
       </div>
       <div class="_content">
         <div class="media">
           <div>
              <div class="media-left media-middle _imageContent">
                <a href="#">
                  <img class="media-object" src="static/image/sys/logo.png" alt="xxx">
                </a>
              </div>
              <div class="media-body">
                <h4 class="media-heading">Middle aligned media</h4>
                  我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道我知道
              </div>
           </div>
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
        getPage();
      });

      function getJSONData(pn) {
        var $username = $("#_username").text();

        $.getJSON("image/taylor swift/all", function(data) {
          var totalCount = data.totalCount;
          var pageSize = data.pageSize;
          var pageTotal = Math.ceil(totalCount / pageSize);
          var startPage = data.start;
          var endPage = startPage + pageSize - 1;

          var $_allImageContent = $("#_allImage");
          $_allImageContent.empty();

          for (var i = 1; i <= pageSize; i++) {
            $_allImageContent.append('<div class="_imagecontent">');
            $_allImageContent.append('</div>');
          }

          var dataRoot = data.data;
          if (pageTotal == 1) {
            for (var j = 0; j < totalCount; j++) {
              $("._imagecontent").eq(j).append('<div class="imageround"><img src="' + dataRoot[j].imageLocation + '"class="img-rounded">')
                      .append('<span "glyphicon glyphicon-tags" aria-hidden="true">' +  dataRoot[j].imageCataloge
                      +'</span>').append('<p>' + dataRoot[j].imageTitle
                      + '</p>').append('<a href="image/' + dataRoot[j].imageId
                      + '/detail" class="btn btn-default" role="button" style="margin-left:58px;">').append('详情</a></div>');
            }
          } else {
            for (var j = startPage, k = 0; j < endPage, k < pageSize; j++, k++) {
              if (j == totalCount) {
                break;
              }
              $("._imagecontent").eq(j).append('<div class="imageround"><img src="' + dataRoot[j].imageLocation + '"class="img-rounded">')
                      .append('<span "glyphicon glyphicon-tags" aria-hidden="true">' +  dataRoot[j].imageCataloge
                      +'</span>').append('<p>' + dataRoot[j].imageTitle
                      + '</p>').append('<a href="image/' + dataRoot[j].imageId
                      + '/detail" class="btn btn-default" role="button" style="margin-left:58px;">').append('详情</a></div>');
            }
          }
          //$(".page-count").text(pageTotal);
        })
      }

      function getPage() {
        var $searchContent = $("#_searchContent").text();

        $.getJSON("image/taylor swift/all", function(data) {
          var totalCount = data.totalCount;
          var pageSize = data.pageSize;
          var pageTotal = Math.ceil(totalCount / pageSize);
          pn = 1;

          var $_prevContent = $("#xxxx");
          $_prevContent.empty();

          for (var k = 1; k <= pageTotal; k++) {
            if (k == 1) {
              $_prevContent.append('<li><a id="firstPage page-jump">'+ k + '</a></li>');
            }
            $_prevContent.append('<li><a id="page-jump">'+ k + '</a></li>');
          }

          $('#next').click(function() {
            if (pn == pageTotal) {
              alert("后面没有了");
              pn = pageTotal;
            } else {
              pn++;
              gotoPage(pn);
            }
          });
          $("#prev").click(function() {
            if (pn == 1) {
              alert("前面没有了");
              pn = 1;
            } else {
              pn--;
              gotoPage(pn);
            }
          });
          $("#page-jump").click(function(){
            if($("#page-jump").text()  <= pageTotal && $("#page-jump").text() != ''){
              pn = $("#page-jump").text()
              gotoPage(pn);
            }else{
              alert("您输入的页码有误！");
              $("#page-jump").text('').focus();
            }
          })
          $("#firstPage").trigger("click");

        });
      }

      function gotoPage(pn) {
        alert(pn);
        //$(".current-page").text(pn);
        getJSONData(pn)
      }

    </script>

</body>
</html>
