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
    <link rel="stylesheet" href="static/css/home.css">
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>${homeAccount.accountNickname }的主页</title>
    <style type="text/css">
      .wrap {
        margin: 40px 250px 0 230px;
      }
      .leftContent {
        float: right;
        width: 220px;
      }
      .userInfo {
        border: solid 1px #adadad;
        height: 250px;
        border-radius: 8px;
      }
      .bgInfo {
        background: url("static/image/sys/bgInfo.jpg");
        height: 110px;
      }
      .userInfo img {
        width: 70px;
        height: 50px;
        vertical-align: middle;
      }
      .userInfoContent {
        margin-top: 8px;
        margin-left: 30px;
        text-align: center;
      }
      .userInfoContent div {
        display: inline-block;
        margin-right: 12px;
        padding-right: 12px;
      }
      .userInfoContent .userInfoSpilt {
        border-right: solid 1px #adadad;
      }
      .rightContent {
        float: left;
        width: 600px;
      }
      .recommendInfo {
        margin-top: 35px;
        border: solid 1px #adadad;
        height: 230px;
        border-radius: 8px;
      }
      .recommendTitle {
        height: 25px;
        line-height: 25px;
        padding-left: 10px;
        border-bottom: solid 1px #adadad;
      }
      .recommendImage {
        height: 160px;
        padding: 10px;
      }
      .recommendImage .recommendImageUser {
        height: 50px;

      }
      .recommendImageUser img {
        height: 25px;
        width: 25px;

      }
      .recommendTool {
        height: 35px;
        border-top: solid 1px #adadad;
      }
      .recommendTool button {
        border: none;
        width: 116px;
      }
      .dynamicInfo {

      }
      .dynamicInfoContent {
        margin-top: 30px;
        border: solid 1px #adadad;
        height: 210px;
        border-radius: 8px;
        padding: 15px;
      }
      .dynamicInfoContent .dynamicImage {
        height: 160px;
        float: left;
        margin-right: 20px;
      }
      .dynamicInfoContent .dynamicImageDescription {
        float: left;
      }
      .dynamicImage img {
        height: 150px;
        width: 170px;
      }
      .dynamicInfoContent .dynamicInfoTool {
        border-top: solid 1px #adadad;
      }
      .dynamicInfoTool span {
        margin-left: 55px;
        margin-top: 10px;
      }
      .dynamicLoading {
        margin-top: 15px;
      }
      .collectImageInfo {
        border: solid 1px #adadad;
        margin-top: 30px;
        height: 300px;
        padding: 5px 10px 15px 10px;
        border-radius: 8px;
      }
      .collectImageInfo .collectImageInfoTop {
        height: 30px;
      }
      .collectImageInfo .collectImageInfoImg {
        height: 220px;

      }
      .collectImageInfoImg img {
        width: 42px;
        height: 42px;
      }
      .guestInfo {
        border: solid 1px #adadad;
        margin-top: 30px;
        height: 300px;
        border-radius: 8px;
      }
      .guestInfo .guestInfoTop {
        height: 30px;
        padding: 5px;
      }
      .guestImg img {
        width: 60px;
        height: 60px;
      }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="wrap">
      <div class="leftContent">
        <div class="userInfo">
          <div class="bgInfo">
          </div>
          <img src="${homeAccount.accountThumb }" class="img-circle">
          <div class="userInfoContent">
            <div class="userInfoSpilt">
              ${homeAccount.accountSubscribeCount }<p>关注</p>
            </div>
            <div id="userNickname">

            </div>
            <div class="userInfoSpilt">
              ${homeAccount.accountFansCount }<p>粉丝</p>
            </div>
            <div>
              ${homeAccount.accountUploadImageCount }<p>图片</p>
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
          <c:forEach var="guest" items="${guestAccounts }">
            <div class="media">
              <div class="media-left media-middle guestImg">
                <a href="#">
                  <img class="media-object" src="${image.guestAccountThumb }">
                </a>
              </div>
              <div class="media-body">
                <h4 class="media-heading">${image.guestAccountNickname }</h4>
              </div>
            </div>
          </c:forEach>
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
              <div class="help-block" style="float: left;">
                <a><span>${recommendImage.imageAccountNickname }</span></a>
                上传于 ${recommendImage.imageUploadTime}
              </div>
            </div>
            <img src="${recommendImage.imageLocation }" alt="">
          </div>
          <div class="recommendTool">
            <button type="button" class="btn btn-default" aria-label="Left Align">
              <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> ${recommendImage.imageCollectCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align">
              <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span> ${recommendImage.imageShareCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align">
              <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> ${recommendImage.imageDownloadCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align">
              <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ${recommendImage.imageLikeCount }
            </button>
            <button type="button" class="btn btn-default" aria-label="Left Align">
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
                <p class="help-block">上传于 ${dynamicImage.imageUploadTime }</p>
              </div>
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
          <div class="dynamicLoading">
            <button type="button" class="btn btn-default btn-lg btn-block" id="moreDynamic">
              <span class="glyphicon glyphicon-transfer" aria-hidden="true"></span> 更多我的动态
            </button>
          </div>
        </div>
      </div>
      <div style="clear: both;"></div>
    </div>

    <div class="modal fade" id="editProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
          </div>
          <div class="modal-body">
            <div class="input-group">
              <span class="input-group-addon" id="basic-addon1">昵称</span>
              <input type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
            </div>
            <div class="form-group">
              <label for="thumbImage">选择图片</label>
              <input type="file" id="thumbImage">
              <p class="help-block">请选择要上传的图片作为头像</p>
            </div>
            <div class="input-group">
              <span class="input-group-addon">邮箱</span>
              <input type="text" class="form-control" placeholder="邮箱" aria-describedby="basic-addon1">
            </div>
            <div class="input-group">
              <span class="input-group-addon">年龄</span>
              <input type="text" class="form-control" placeholder="年龄" aria-describedby="basic-addon1">
            </div>
            <div class="input-group">
              <span class="input-group-addon">性别</span>
              <input type="text" class="form-control" placeholder="性别" aria-describedby="basic-addon1">
            </div>
            <div class="input-group">
              <span class="input-group-addon">签名</span>
              <input type="text" class="form-control" placeholder="个人简介" aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary">保存修改</button>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="bottom.jsp"/>
    <jsp:include page="uploadImage.jsp"/>

    <script type="text/javascript">
      $(function () {
        var dynamicPageNo = 1;
        var homeAccountNickname = $('#userNickname').text();
        $('#moreDynamic').click(function() {
          alert(homeAccountNickname);
          $.getJSON('image/' + homeAccountNickname + '-' + dynamicPageNo + '/dynamic', function(data) {
            var dataRoot = data.data;
            var totalCount = data.totalCount;

            if (totalCount == 0) {
              alert('已经没有了...');
            } else {
              for (var i = 0; i < totalCount; i++) {
                $('#moreDynamicContent').append('<div class="dynamicInfoContent">' + '<div>' + '<div class="dynamicImage">'
                + '<img src="' + dataRoot[i].imageLocation + '" alt="' + dataRoot[i].imageTitle + '" class="img-rounded">' + '</div>'
                + '<div class="dynamicImageDescription">' + '<a href="image/' + dataRoot[i].imageId + '/detail">' + '<h4>' + dataRoot[i].imageTitle + '</h4></a>'
                + '<p>' + dataRoot[i].imageDescription + '</p>' + '<p class="help-block">' + '上传于 ' + dataRoot[i].imageUploadTime + '</p>'
                + '</div></div>' + '<div style="clear: both;"></div>' + '<div class="dynamicInfoTool">'
                + '<span class="glyphicon glyphicon-bookmark" aria-hidden="true">' + dataRoot[i].imageCollectCount + '</span>'
                + '<span class="glyphicon glyphicon-share-alt" aria-hidden="true">' + dataRoot[i].imageShareCount + '</span>'
                + '<span class="glyphicon glyphicon-download-alt" aria-hidden="true">' + dataRoot[i].imageDownloadCount + '</span>'
                + '<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">' + dataRoot[i].imageLikeCount + '</span>'
                + '<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">' + dataRoot[i].imageDislikeCount + '</span>'
                + '</div></div>');

              }
            }
            dynamicPageNo++;
          });
        });
      });
    </script>

</body>
</html>