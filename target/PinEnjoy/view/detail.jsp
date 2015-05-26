<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName()+":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <link rel="stylesheet" href="static/css/reset.css">
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>详情页</title>
    <style type="text/css">
      .wrap {
        margin: 35px 180px;
      }
      .mainContent {
        width: 700px;
        float: left;
      }
      .displayContent {
        border: solid 1px #adadad;
      }
      .imageContent {
        background-color: #adadad;
        height: 500px;
        padding: 0 35px;
      }
      .middleContent {
        border-top: solid 1px #adadad;
      }
      .middleContent .middleContentLeft {
        margin: 0 250px 0 35px;
      }
      .middleContent button {
        border: none;
      }
      .descriptionContent {
        border-top: solid 1px #adadad;
      }
      .resumeContent {
        margin-top: 30px;
        border: solid 1px #adadad;
      }
      .storeContent {
        margin-top: 30px;
        border: solid 1px #adadad;
        height: 70px;
      }
      .storeContent .storeContentLeft {
        border-right: solid 1px #adadad;
        width: 330px;
        height: 70px;
        float: left;
      }
      .storeContent .storeContentRight {
        padding: 20px 100px;
        float: right;
      }
      .sideContent {
        width: 250px;
        height: 400px;
        float: right;
        border: solid 1px #adadad;
      }
      .sideContent .sideContentTop {
        padding: 7px 15px;
      }
      .sideContent .sideContentDown {
        padding: 7px 15px;
        margin-top: 310px;
      }
      .dropLayer {
        margin-top: 30px;
      }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="content">
      <div class="wrap">
        <div class="mainContent">
          <div class="displayContent">
            <div class="imageContent">
               <img src="${currentImage.imageLocation }" title="${currentImage.imageTitle }">
            </div>
            <div class="middleContent">
              <span class="middleContentLeft">
                <button type="button" class="btn btn-default" aria-label="Left Align" onclick="like('like')">
                  <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                </button>
                <button type="button" class="btn btn-default" aria-label="Left Align" onclick="like('dislike');">
                  <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
                </button>
              </span>
              <button type="button" class="btn btn-default" aria-label="Left Align" onclick="image/${currentImage.imageId}/download">
                <span class="glyphicon glyphicon-save" aria-hidden="true"> 下载</span>
              </button>
              <button type="button" class="btn btn-default" aria-label="Left Align">
                <span class="glyphicon glyphicon-share-alt" aria-hidden="true"> 分享</span>
              </button>
              <button type="button" class="btn btn-default" aria-label="Left Align">
                <span class="glyphicon glyphicon-time" aria-hidden="true"> 阅后即焚</span>
              </button>
              <c:if test="${currentImage.imageIsAutoDelete }">
                <span class="glyphicon glyphicon-hourglass" aria-hidden="true"> 阅后即焚</span>
              </c:if>
            </div>
            <div class="descriptionContent">
              <div>
                ${currentImage.imageTitle }
              </div>
              <div>
                ${currentImage.imageUploadTime }
              </div>
              <div>
                ${currentImage.imageDescription }
              </div>
            </div>
          </div>
          <div class="storeContent">
            <div class="storeContentLeft">
              <a href="home/{imageAccount.accountId }"><img src="${imageAccount.accountThumb }"></a>
              ${imageAccount.accountNickname }xxxxxxxxx
              <button type="button" class="btn btn-info" aria-label="Left Align">
                <span class="glyphicon glyphicon-star" aria-hidden="true"> 关注</span>
              </button>
            </div>
            <div class="storeContentRight">
              <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#generatePin">
                生成Pin报告
              </button>
            </div>
          </div>
          <div class="resumeContent">
            <img src="${imageAccount.accountThumb }">
            <div class="ds-thread" data-thread-key="Ping" data-title="请替换成文章的标题" data-url="请替换成文章的网址"></div>
          </div>
        </div>
        <div class="sideContent">
           <div>
             <div class="sideContentTop">
                cxxxx
             </div>
             <div class="sideContentDown">
              <button type="button" class="btn btn-default btn-block"> 更多</button>
             </div>
           </div>
        </div>
        <div style="clear: both"/>
        <div class="dropLayer">
          <h3>相关推荐</h3>
          <div>
            <ul>
            <c:forEach items="${recommendedImages }" var="image">
              <li onclick="location.href='image/${image.imageId}/detail';">
                <img src="${image.imageLocation }" alt="${image.imageTitle }">
                <div class="post-info">
                  <div class="post-basic-info">
                      <h3><a href="#">${image.imageTitle }</a></h3>
                      <span><a href="#"><label></label>${image.imageCatalogeName }</a></span>
                      <p>${image.imageDescription }</p>
                  </div>
                  <div class="post-info-rate-share">
                      <div id="function_rate"></div>
                      <div class="download">
                        <a href="image/${image.imageId }/download"><span></span></a>
                      </div>
                  </div>
                </div>
              </li>
            </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="generatePin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
            ...
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>


    <jsp:include page="bottom.jsp"/>

    <script type="text/javascript">
      var duoshuoQuery = {short_name:"tianexping"};
      $(function () {
        var ds = document.createElement('script');
        ds.type = 'text/javascript';ds.async = true;
        ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
        ds.charset = 'UTF-8';
        (document.getElementsByTagName('head')[0]
        || document.getElementsByTagName('body')[0]).appendChild(ds);

      });

      function like(data) {
        if (data == 'dislike') {

        } else if (data == 'like') {

        }
      }

    </script>

</body>
</html>
