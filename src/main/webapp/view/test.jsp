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
</head>
<body>


    <div class="dynamicInfo">
      <div class="dynamicInfoContent">
        <div>
          <div class="dynamicImage">
            <img src="xxx" alt="xxx" class="img-rounded">
          </div>
          <div class="dynamicImageDescription">
            <a href="image/xx/detail"><h4>xx</h4></a>
            <p>xx</p>
            <p class="help-block">上传于 xx</p>
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
          <span class="glyphicon glyphicon-transfer" aria-hidden="true" ></span> 更多我的动态
        </button>
      </div>
    </div>




<script type="text/javascript">

  var dynamicPageNo = 1;
  var homeAccountNickname = 'tianyiming';
  $('#moreDynamic').click(function() {
    $.ajax({url:"image/tianyiming-1/dynamic", dataType:"json", success:function(data) {
      alert('dadad');
      var dataRoot = data.data;
        for (var i = 0; i < 3; i++) {
          if (dataRoot[i].imageId != null) {
            $('#dynamicInfo').appendChild('<div class="dynamicInfoContent">' + '<div>' + '<div class="dynamicImage">'
            + '<img src="" alt="" class="img-rounded">' + '</div>'
            + '<div class="dynamicImageDescription">' + '<a href="">' + '<h4>' + '</h4></a>'
            + '<p>' + '</p>' + '<p class="help-block">' + '上传于 ' + dataRoot[i].imageUploadTime + '</p>'
            + '</div></div>' + '<div style="clear: both;"></div>' + '<div class="dynamicInfoTool">'
            + '<span class="glyphicon glyphicon-bookmark" aria-hidden="true">' + dataRoot[i].imageCollectCount + '</span>'
            + '<span class="glyphicon glyphicon-share-alt" aria-hidden="true">' + dataRoot[i].imageShareCount + '</span>'
            + '<span class="glyphicon glyphicon-download-alt" aria-hidden="true">' + dataRoot[i].imageDownloadCount + '</span>'
            + '<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">' + dataRoot[i].imageLikeCount + '</span>'
            + '<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">' + dataRoot[i].imageDislikeCount + '</span>'
            + '</div></div>');
          }
        }

    }
    });
    /*$.getJSON("image/" + homeAccountNickname +"%1" + "/dynamic", function(data) {
      alert(data);
      var dataRoot = data.data;
      if (dataRoot != null) {
        for (var i = 0; i < 3; i++) {
          if (dataRoot[i].imageId != null) {
            $('#dynamicInfo').appendChild('<div class="dynamicInfoContent">' + '<div>' + '<div class="dynamicImage">'
            + '<img src="" alt="" class="img-rounded">' + '</div>'
            + '<div class="dynamicImageDescription">' + '<a href="">' + '<h4>' + '</h4></a>'
            + '<p>' + '</p>' + '<p class="help-block">' + '上传于 ' + dataRoot[i].imageUploadTime + '</p>'
            + '</div></div>' + '<div style="clear: both;"></div>' + '<div class="dynamicInfoTool">'
            + '<span class="glyphicon glyphicon-bookmark" aria-hidden="true">' + dataRoot[i].imageCollectCount + '</span>'
            + '<span class="glyphicon glyphicon-share-alt" aria-hidden="true">' + dataRoot[i].imageShareCount + '</span>'
            + '<span class="glyphicon glyphicon-download-alt" aria-hidden="true">' + dataRoot[i].imageDownloadCount + '</span>'
            + '<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true">' + dataRoot[i].imageLikeCount + '</span>'
            + '<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true">' + dataRoot[i].imageDislikeCount + '</span>'
            + '</div></div>');
          }
        }
      } else {
        alert('已经没有了...');
      }
      dynamicPageNo++;
    });*/

  });

</script>

</body>
</html>