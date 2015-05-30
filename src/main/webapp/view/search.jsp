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
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>搜索页</title>
    <style type="text/css">
        .wrap {
            width: 80%;
            margin: 10px 10px 10px 180px;
        }
        .leftContent {
            float: left;
            width: 600px;
        }
        .rightContent {
            float: right;
            width: 300px;
            margin-top: 50px;
        }
        .searchResult {
            height: 50px;
        }
        .mainContent {
            margin-top: 20px;
        }
        .mainContentImg img {
            height: 250px;
            width: 250px;
        }
        .searchNav {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="wrap">
        <div class="leftContent">
            <div class="searchResult">
                <p id="_searchContent" hidden="hidden">${searchContent }</p>
                <p class="help-block">
                    PinEnjoy为您找到相关结果约
                    <c:choose>
                        <c:when test="${numFound != 0 }">
                            ${numFound }
                        </c:when>
                        <c:otherwise>
                            0
                        </c:otherwise>
                    </c:choose>
                    个
                </p>
            </div>
            <div class="mainContent">
                <c:forEach var="image" items="${imagesOfSearch }">
                    <div class="media">
                        <div class="media-left media-middle mainContentImg">
                            <a href="image/${image.imageId }/detail">
                                <img class="media-object" src="${image.imageLocation }" alt="${image.imageTitle }">
                            </a>
                        </div>
                        <div class="media-body">
                            <a href="image/${image.imageId }/detail">
                                <h4 class="media-heading">${image.imageTitle }
                                </h4>
                            </a>
                            ${image.imageDescription }
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="searchNav">
                <c:choose>
                    <c:when test="${imagesOfSearch != null }">
                        <%--<c:if test="${numFound > 6 } ">--%>
                            <ul class="pager">
                                <li class="previous" id="previous"><a href="#"><span aria-hidden="true">&larr;</span> 上一页</a></li>
                                <li class="next" id="next"><a href="#">下一页 <span aria-hidden="true">&rarr;</span></a></li>
                            </ul>
                        <%--</c:if>--%>
                    </c:when>
                    <c:otherwise>
                        对不起，没有找到您需要的结果！
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="rightContent">
            <div class="list-group">
                <li class="list-group-item">
                    <span class="glyphicon glyphicon-align-right" aria-hidden="true"></span>
                    <span class="badge">${numFound }</span>
                    图片分类
                </li>
                <c:forEach var="cataloge" items="${cataloges }">
                    <a href="#" class="list-group-item">${cataloge.catalogeName }</a>
                </c:forEach>
            </div>
        </div>
        <div style="clear: both;"></div>
    </div>

    <jsp:include page="bottom.jsp"/>

    <script type="text/javascript">
      $('#previous').click(function () {
         alert('没有了');
      });

      $('#next').click(function () {
          alert('没有了');
      });

      function getJSONData(pn) {
        var $searchContent = $("#_searchContent").text();

        $.getJSON("tosearch/" + $searchContent + "/" + pn, function(data) {
          var $_searchImageContent = $("#_searchImageContent");
          $_searchImageContent.empty();

          for (var i = 1; i <= 12; i++) {
            $_searchImageContent.append('<div class="media _imagetent"></div>');
          }

          for (var j = 0; j < 12; j++) {
            $("._imagetent").eq(j).append('<div class="media-left media-middle _imageContent"> <a href="' + data[j].image_id + '/detail">')
                .append('<img class="media-object" src="' +  data[j].image_location
                    +'">').append('</p></div>')
                    .append('<div class="media-body"><h4 class="media-heading">' + data[j].image_title
                    + '</h4>' + data[j].image_description).append('</div></div>');
          }

        });
        pn++;
      };

    </script>

</body>
</html>
