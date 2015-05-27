<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/css/uploadify.css"/>
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
</head>
<body>

    <div class="modal fade" id="_uploadImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">请选择要上传的图片</h4>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <input type="hidden" id="_accountNickname" value="${currentAccount.accountNickname }"/>
                <input type="hidden" id="sessionId" value="${pageContext.session.id}"/>
              </div>
              <div class="form-group">
                <label for="_accountTitle" class="control-label">图片标题</label>
                <input type="text" class="form-control" id="_accountTitle">
              </div>
              <div class="form-group">
                <label for="_imageDescription" class="control-label">图片描述</label>
                <textarea class="form-control" id="_imageDescription"></textarea>
              </div>
              <div>
                <input type="file" id="_uploadFile">
              </div>
              <select class="selectpicker" data-style="btn-primary" id="_imageCatalogeName">
                <c:forEach var="cataloge" items="${cataloges }">
                  <option>${cataloge.catalogeName }</option>
                </c:forEach>
              </select>
              <span style="height: 55px; margin-left: 25px;vertical-align: middle;">
                <input type="checkbox" value="1" id="_imageIsAutoDelete"> 阅后即焚？
              </span>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#_uploadFile').uploadify('cancel','*')">取消上传</button>
            <button type="button" class="btn btn-primary" onclick="$('#_uploadFile').uploadify('upload','*')" data-loading-text="上传中...">开始上传</button>
            <button type="button" class="btn btn-primary" onclick="$('#_uploadFile').uploadify('stop','*')" disabled="disabled" id="_stopUpload">停止上传</button>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      $(function() {
        $("#_uploadFile").uploadify({
          'uploader' : '<%=basePath%>/image/upload',
          'height' : 27,
          'width' : 50,
          'buttonText' : '浏 览',
          'buttonCursor' : 'hand',
          'auto' : false,
          'multi' : false,
          'method' : 'post',
          'swf' : 'static/js/uploadify.swf',
          'cancelImg' : 'static/image/sys/close.jpg',
          'fileTypeDesc' : 'jpg、png、gif、bmp',
          'fileTypeExts' : '*.jpg;*.png;*.gif;*.bmp;*.doc;*.txt',
          'fileSizeLimit' : '50MB',
          'fileObjName' : 'imageFile',
          'progressData' : 'all', // 'percentage''speed''all'//队列中显示文件上传进度的方式：all-上传速度+百分比，percentage-百分比，speed-上传速度
          'preventCaching' : true,//若设置为true，一个随机数将被加载swf文件URL的后面，防止浏览器缓存。默认值为true
          'timeoutuploadLimit' : 1, //能同时上传的文件数目
          'removeCompleted' : true,
          'removeTimeout' : 3,//上传完成后多久删除队列中的进度条，默认为3，即3秒。
          'requeueErrors' : true,//若设置为True，那么在上传过程中因为出错导致上传失败的文件将被重新加入队列。
          'successTimeout' : 30,//表示文件上传完成后等待服务器响应的时间。不超过该时间，那么将认为上传成功。默认是30，表示30秒。
          'uploadLimit' : 999,
          'onUploadStart' : function(file) {
            alert($('#_accountNickname').val());
            $('#_uploadFile').uploadify("settings", "formData", {
              'imageAccountNickname' : $('#_accountNickname').val(),
              'jsessionid' : $("#_sessionId").val(),
              'imageTitle':$('#_accountTitle').val(),
              'imageDescription' : $('#_imageDescription').val(),
              'imageCatalogeName' : $("#_imageCatalogeName").find("option:selected").val(),
              'imageIsAutoDelete' : document.getElementById("_imageIsAutoDelete").checked,
              'imageAutoDeleteTime' : ''
            });
            $("#_stopUpload").removeAttr("disabled");
          },
          'onUploadSuccess' : function(file, data, response) {
            //alert(file.name + " upload success !");
            alert(data + "----" + response);
            $("#_stopUpload").attr("disabled",true);
          }
        });
      });
    </script>

</body>
</html>
