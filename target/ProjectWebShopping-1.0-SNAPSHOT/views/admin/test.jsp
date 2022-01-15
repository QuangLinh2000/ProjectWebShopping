<%--
  Created by IntelliJ IDEA.
  User: QUANGLINH
  Date: 1/12/2022
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/script/jquery-3.5.0.min.js"></script>

</head>
<body>
<form id="uploadForm" >
    <div class="form-group">
        <label  for="bandPicture">GRUP RESM?</label>
        <input type="file" accept="image/x-png,image/gif,image/jpeg" id="bandPicture" class="form-control" name="bandPicture">
        <input type="button" id="uploadImage" class="btn-success" value="Upload">
        <label id="uploadResult"></label>
    </div>
</form>
<script type="text/javascript">
    $(document).ready(function(){
        $('#uploadImage').click(function(){
            var form = $('#uploadform');
            form.submit();
            form.submit(function(){
                $.ajax({
                    type: 'Post',
                    url: '<%=request.getContextPath()%>/admin-add-product',
                    data: form.serialize(),
                    enctype: 'multipart/form-data',
                    success: function(result) {
                        $('#uploadResult').html(result);
                    }
                });
            });
        });
    });
</script>


</body>
</html>
