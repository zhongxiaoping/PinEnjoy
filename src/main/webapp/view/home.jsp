<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="static/css/home.css">
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>${homeAccount.accountNickname }的主页</title>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="wrap">
      <div class="leftContent">
        <div class="userInfo">
          <div class="userInfoImg">
            <img src="${homeAccount.accountThumb }" class="img-circle">
            <p id="userNickname" class="help-block">${homeAccount.accountNickname }</p>
            <button type="button" class="btn btn-default btn-lg" style="border: none;" id="_focus">
              <span class="glyphicon glyphicon-heart" aria-hidden="true"> 关注</span>
            </button>
            <input hidden="hidden" type="text" value="${homeAccount.accountId }" id="homeAccountId">
          </div>
          <div class="userInfoContent">
            <div class="userInfoSpilt">
              <a href="#">${homeAccount.accountSubscribeCount }</a><p>关注</p>
            </div>
            <div class="userInfoSpilt">
              <a href="#">${homeAccount.accountFansCount }</a><p>粉丝</p>
            </div>
            <div>
              <a href="#">${homeAccount.accountUploadImageCount }</a><p>图片</p>
            </div>
          </div>
        </div>
        <div class="collectImageInfo">
          <div class="collectImageInfoTop">
            <span>收藏的图片</span>
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
          </div>
          <div class="collectImageInfoImg">
            <c:choose>
              <c:when test="${collectImages != null }">
                <c:forEach var="image" items="${collectImages }">
                  <a href="image/${image.imageId }/detail"><img src="" class="img-rounded"></a>
                </c:forEach>
              </c:when>
              <c:otherwise>
                您没有收藏的图片
              </c:otherwise>
            </c:choose>
          </div>
          <button type="button" class="btn btn-default btn-block" location.href=''>
            更多
          </button>
        </div>
        <div class="guestInfo">
          <div class="guestInfoTop">
            <span>最近访客</span>
            <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
          </div>
          <c:choose>
            <c:when test="${guestAccounts != null }">
              <c:forEach var="guest" items="${guestAccounts }">
                <div class="media">
                  <div class="media-left media-middle guestImg">
                    <img class="media-object" src="${guest.guestAccountThumb }">
                  </div>
                  <div class="media-body">
                    <a href="home/${guest.guestAccountId }"><h4 class="media-heading">${guest.guestAccountNickname }</h4></a>
                    <p class="help-block"><fmt:parseDate value="${guest.guestLastVisitedTime }"/></p>
                  </div>
                </div>
              </c:forEach>
            </c:when>
            <c:otherwise>
              您最近没有访客
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <div class="rightContent">
        <button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#_uploadImage">
          <span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span> 上传图片
        </button>
        <div class="recommendInfo">
          <div class="recommendTitle">
            <h4><span class="glyphicon glyphicon-fire" aria-hidden="true"></span> Pin 每日推荐</h4>
          </div>
          <div class="recommendImage">
            <div class="recommendImageUser">
              <div style="float: left;margin-right: 7px">
                <img src="${recommendImage.imageAccountThumb }" class="img-circle">
              </div>
              <input hidden="hidden" value="${recommendImage.imageId }" type="text" id="recommentIdContent">
              <div class="help-block" style="float: left;">
                <a><span>${recommendImage.imageAccountNickname }</span></a>
                上传于 ${recommendImage.imageUploadTime}
              </div>
            </div>
            <img src="${recommendImage.imageLocation }" alt="">
          </div>
          <div class="recommendTool">
            <button type="button" class="btn btn-default" aria-label="Left Align" id="collectImage">
              <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> ${recommendImage.imageCollectCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align" id="">
              <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> ${recommendImage.imageShareCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align" id="downloadImage">
              <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> ${recommendImage.imageDownloadCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align" id="thumbUp">
              <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ${recommendImage.imageLikeCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align" id="thumbDown">
              <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span> ${recommendImage.imageDislikeCount }
            </button>
          </div>
        </div>
        <div class="dynamicInfo">
          <div id="moreDynamicContent">
            <div class="dynamicInfoContent">
              <div class="dynamicImage">
                <img src="${dynamicImage.imageLocation }" alt="${dynamicImage.imageTitle }" class="img-rounded">
              </div>
              <div class="dynamicImageDescription">
                <a href="image/${dynamicImage.imageId }/detail"><h4>${dynamicImage.imageTitle }</h4></a>
                <p>${dynamicImage.imageDescription }</p>
                <p class="help-block">上传于 <fmt:formatDate value="${dynamicImage.imageUploadTime }" pattern="yyyy-MM-dd HH:mm"/></p>
              </div>
              <div style="clear: both;"></div>
              <div class="dynamicInfoTool">
                 <span class="glyphicon glyphicon-bookmark" aria-hidden="true"> ${dynamicImage.imageCollectCount }</span>
                 <span class="glyphicon glyphicon-share-alt" aria-hidden="true"> ${dynamicImage.imageShareCount }</span>
                 <span class="glyphicon glyphicon-download-alt" aria-hidden="true"> ${dynamicImage.imageDownloadCount }</span>
                 <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> ${dynamicImage.imageLikeCount }</span>
                 <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> ${dynamicImage.imageDislikeCount }</span>
              </div>
            </div>
          </div>
          <div class="dynamicLoading">
            <button type="button" class="btn btn-default btn-lg btn-block" id="moreDynamic">
              <span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> 更多我的动态
            </button>
          </div>
        </div>
      </div>
      <div style="clear: both;"></div>
    </div>

    <jsp:include page="bottom.jsp"/>
    <jsp:include page="uploadImage.jsp"/>

    <script type="text/javascript">
      $(function () {
        var dynamicPageNo = 1;
        var homeAccountNickname = $('#userNickname').text();
        $('#moreDynamic').click(function() {
          $.getJSON('image/' + homeAccountNickname + '-' + dynamicPageNo + '/dynamic', function(data) {
            var dataRoot = data.data;
            var totalCount = data.totalCount;

            if (totalCount == 0) {
              alert('已经没有了...');
            } else {
              for (var i = 0; i < totalCount; i++) {
                var $date = new Date(dataRoot[i].imageUploadTime);
                $('#moreDynamicContent').append('<div class="dynamicInfoContent">' + '<div>' + '<div class="dynamicImage">'
                + '<img src="' + dataRoot[i].imageLocation + '" alt="' + dataRoot[i].imageTitle + '" class="img-rounded">' + '</div>'
                + '<div class="dynamicImageDescription">' + '<a href="image/' + dataRoot[i].imageId + '/detail">' + '<h4>' + dataRoot[i].imageTitle + '</h4></a>'
                + '<p>' + dataRoot[i].imageDescription + '</p>' + '<p class="help-block">' + '上传于 ' + '' + $date.getFullYear()
                + '-' + $date.getMonth() + '-' + $date.getDay() + ' ' + $date.getHours() + ':' + $date.getMinutes() + '</p>'
                + '</div></div>' + '<div style="clear: both;"></div>' + '<div class="dynamicInfoTool">'
                + '<span class="glyphicon glyphicon-bookmark" aria-hidden="true"> ' + dataRoot[i].imageCollectCount + '</span>'
                + '<span class="glyphicon glyphicon-share-alt" aria-hidden="true"> ' + dataRoot[i].imageShareCount + '</span>'
                + '<span class="glyphicon glyphicon-download-alt" aria-hidden="true"> ' + dataRoot[i].imageDownloadCount + '</span>'
                + '<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"> ' + dataRoot[i].imageLikeCount + '</span>'
                + '<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"> ' + dataRoot[i].imageDislikeCount + '</span>'
                + '</div></div>');

              }
            }
            dynamicPageNo++;
          });
        });
      });

      $('#_focus').click(function () {
        $.get('account/' + $('#homeAccountId').val() + '/subscribe', function(result) {
          $('#_focus').text('已关注');
          alert(result);
        });
      });

      $('#collectImage').click(function () {
        $.get('image/' + $('#recommentIdContent').val() + '/collect', function(result) {
          alert(result);
        });
      });

      $('#downloadImage').click(function () {
        location.href = "image/" + $('#recommentIdContent').val() + "/download";
      });

      $('#thumbUp').click(function () {
        $.get('image/' + $('#recommentIdContent').val() + '/like', function(result) {
          alert(result);
        });
      });

      $('#thumbDown').click(function () {
        $.get('image/' + $('#recommentIdContent').val() + '/dislike', function(result) {
          alert(result);
        });
      });
    </script>

</body>
</html>