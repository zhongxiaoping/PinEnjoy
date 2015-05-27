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
    <link rel="stylesheet" href="static/css/detail.css">
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>详情页</title>
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
            <input hidden="hidden" id="currentId" value="${currentImage.imageId }"/>
            <div class="middleContent">
              <span class="middleContentLeft">
                <button type="button" class="btn btn-default" aria-label="Left Align" id="_likeAsy">
                  <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                </button>
                <button type="button" class="btn btn-default" aria-label="Left Align" id="_disLikeAsy">
                  <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>
                </button>
              </span>
              <c:if test="${currentImage.imageIsAutoDelete }">
                <button type="button" class="btn btn-default" aria-label="Left Align">
                  <span class="glyphicon glyphicon-time" aria-hidden="true"> 阅后即焚</span>
                </button>
              </c:if>
              <button type="button" class="btn btn-default" aria-label="Left Align" id="_download">
                <span class="glyphicon glyphicon-save" aria-hidden="true"> 下载</span>
              </button>
              <button type="button" class="btn btn-default" aria-label="Left Align">
                <span class="glyphicon glyphicon-share-alt" aria-hidden="true"> 分享</span>
              </button>
            </div>
            <div class="descriptionContent">
              <h4>${currentImage.imageTitle }</h4>
              <p class="help-block">上传于 ${currentImage.imageUploadTime }</p>
              <div class="decriptionContentDown">
                ${currentImage.imageDescription }
              </div>
            </div>
          </div>
          <div class="storeContent">
            <div class="storeContentLeft">
              <div class="storeContentI">
                <a href="home/{imageAccount.accountId }"><img src="${imageAccount.accountThumb }" class="img-circle"></a>
                ${imageAccount.accountNickname }
              </div>
              <div class="storeContentB">
                <button type="button" class="btn btn-info" aria-label="Left Align" id="_focus">
                  <span class="glyphicon glyphicon-star" aria-hidden="true"> 关注</span>
                </button>
              </div>
            </div>
            <div class="storeContentRight">
              <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#generatePin">
                生成Pin报告
              </button>
            </div>
          </div>
          <div class="resumeContent">
            <div class="ds-thread" data-thread-key="Ping" data-title="请替换成文章的标题" data-url="请替换成文章的网址"></div>
          </div>
        </div>
        <div class="sideContent">
           <div>
             <div class="sideContentTop">
                <c:forEach var="image" items="${otherImages}">
                  <a href="image/${image.imageId }/detail"><img src="image.imageLocation" class="img-rounded"></a>
                </c:forEach>
             </div>
             <div class="sideContentDown">
                <button type="button" class="btn btn-default btn-block" location.href='home/${imageAccount.accountId }'>
                  更多
                </button>
             </div>
           </div>
        </div>
        <div style="clear: both"/>
        <div class="dropLayer">
          <h3>相关推荐</h3>
          <div class="recommendsImage">
            <c:forEach items="${recommendedImages }" var="image">
              <div class="recommendsImageContent">
                <div class="recommendsImageUser">
                  ${image.imageAccountNickname } 上传
                </div>
                <div class="recommendsImageImg">
                  <img src="${image.imageLocation }">
                </div>
                <div>
                  <button type="button" class="btn btn-default btn-block" location.href="image/${image.imageId }/detail">
                    详细
                  </button>
                </div>
              </div>
            </c:forEach>
          </div>
          <div style="clear: both;"></div>
        </div>
        <div class="downLayer">
          <h3>Pin热单</h3>
          <div class="hotImage">
            <c:forEach var="image" items="${hotImages }">
              <div class="hotImageContent">
                <div class="hotImageImg">
                  <a href="image/${image.imageId }/detail"><img src="${image.imageLocation }"></a>
                </div>
                <div class="hotImageRating">
                  <div class="hotImageRatingContent">

                  </div>
                  <div class="hotImageDownload">
                    <a href="image/${image.imageId }/download"><span></span></a>
                  </div>
                </div>
                <div style="clear: both;"></div>
              </div>
            </c:forEach>
          </div>
          <div style="clear: both"></div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="generatePin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">${currentImage.imageTitle }的详细参数</h4>
          </div>
          <div class="modal-body">
                heheheeheheehheehehehhe
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

      $('#_download').click(function() {
        $.get('image/' + $('#currentId').val() + '/download', function(result){
          alert(result);
        });
      });
      $('#_likeAsy').click(function() {
        $.get('image/' + $('#currentId').val() + '/like', function(result){
          $('#_likeAsy').css('disabled', 'disabled');
          alert(result);
        });
      });
      $('#_disLikeAsy').click(function() {
        $.get('image/' + $('#currentId').val() + '/dislike', function(result){
          $('#_disLikeAsy').css('disabled', 'disabled');
          alert(result);
        });
      });
      $('#_focus').click(function() {
        $.get($('account/' + '#currentId').val() + '/subscribe', function(result) {
          $('#currentId span').innerHTML('已关注');
          $('#currentId').css('id', '_unfocus');
          alert(result);
        })
      });
      $('#_unfocus').click(function() {
        $.get($('account/' + '#currentId').val() + '/unsubscribe', function(result) {
          $('#currentId span').innerHTML('关注');
          $('#currentId').css('id', '_focus');
          alert(result);
        })
      });
    </script>

</body>
</html>
