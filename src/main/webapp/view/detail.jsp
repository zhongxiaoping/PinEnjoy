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
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>详情页</title>
    <style type="text/css">
      body{
        font-family: 'Open Sans', sans-serif;
        background:#F0EFEE;
      }
      .wrap{
        width:66%;
        margin:0 auto;
      }
      .artical-content h3 a{
        font: 400 28px/28px 'Open Sans', sans-serif;
        color: #626262;
        text-align: left;
        font-weight: 400;
        padding: 0.9em 0 0;
        display: block;
      }
      .artical-content p{
        font: normal 16px/26px 'Open Sans', sans-serif,Helvetica,sans-serif;
        color: #9b9b9b;
        padding: 17px 0px;
        font-weight: 400;
      }
      .artical-content img{
        width:100%;
      }
    </style>
</head>
<body>

    <jsp:include page="bar_common.jsp"/>

    <div class="content">
      <div class="wrap">
        <div class="single-page">
          <div class="single-page-artical">
            <div class="artical-content">
              <img src="${currentImage.location }" title="xxx" style="height:550px;">
              <div class="panel panel-default" style="background-color:#f9f9f9;margin-top:15px;border:none;width:350px;float:left;">
                <div class="panel-body">
                  <img src="${uploadAccount.thumb }" alt="${currentImage.title }" class="img-rounded" style="width:45px;height:45px;">
                  <span style="margin-left:10px;margin-right:20px;">${currentImage.username }</span><span> 上传于 ${currentImage.uploadTime }</span>
                  <div style="margin-left:55px;">
                    <button type="button" class="btn btn-default btn-sm" data-toggle="button" aria-pressed="false" autocomplete="off"
                            onclick="location.href='image/${image.imageId}/subscribe';">
                      关注
                    </button>
                  </div>
                </div>
              </div>
              <div style="float: right;margin-top:15px;">
                <div>
                  <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right: 20px;">
                    <span class="glyphicon glyphicon-tags" aria-hidden="true"> ${currentImage.cataloge }</span>
                  </button>
                  <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right: 20px;">
                    <span class="glyphicon glyphicon-save" aria-hidden="true"> 下载</span>
                  </button>
                  <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right: 20px;">
                    <span class="glyphicon glyphicon-share-alt" aria-hidden="true"> 分享</span>
                  </button>
                  <c:if test="${currentImage.autoDelete }">
                    <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right: 20px;">
                      <span class="glyphicon glyphicon-hourglass" aria-hidden="true"> 阅后即焚</span>
                    </button>
                  </c:if>
                </div>
                <div style="margin-top: 25px;">
                  <button type="button" id="collecting" data-loading-text="收藏中..." class="btn btn-primary" autocomplete="off"
                          onclick="location.href='image/${image.imageId}/collect';">
                    收藏 <span class="badge">4</span>
                  </button>
                </div>

              </div>
              <div style="clear:both;">
                <h3>${currentImage.title }</h3>
                <p>${currentImage.describe }</p>
              </div>
            </div>
            <div style="margin-bottom: 30px;float: right;">
              <button type="button" class="btn btn-default" aria-label="Left Align" onclick="location.href='image/${image.imageId}/like';">
                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
              </button>
              <button type="button" class="btn btn-default" aria-label="Left Align" onclick="location.href='image/${image.imageId}/dislike';">
                <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
              </button>
            </div>
          </div>
          <div class="ds-thread" data-thread-key="Ping" data-title="请替换成文章的标题" data-url="请替换成文章的网址"></div>
        </div>

        <div>
          <p>您可能还喜欢：</p>
          <div class="row">
            <div class="col-sm-6 col-md-4">
              <div class="thumbnail">
                <img src="static/image/user/taylor_thumb.jpg" alt="..." style="width:200px; height=200px;">
                <div class="caption">
                  <h3>Thumbnail label</h3>
                  <p>cccccc</p>
                  <div style="margin-bottom:20px; margin-top:10px;margin-left:20px;">
                    <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right: 20px;">
                      <span class="glyphicon glyphicon-tags" aria-hidden="true"> 分类</span>
                    </button>
                    <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right: 20px;">
                      <span class="glyphicon glyphicon-user" aria-hidden="true"> 用户</span>
                    </button>
                  </div>
                  <a href="#" class="btn btn-primary" role="button" style="margin-left:80px;">详情</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      var duoshuoQuery = {short_name:"tianexping"};
      (function() {
        var ds = document.createElement('script');
        ds.type = 'text/javascript';ds.async = true;
        ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
        ds.charset = 'UTF-8';
        (document.getElementsByTagName('head')[0]
        || document.getElementsByTagName('body')[0]).appendChild(ds);
      })();
      $('#collecting').on('click', function () {
        var $btn = $(this).button('loading')
        // business logic...
        $btn.button('reset')
      });
    </script>

</body>
</html>
