<%--
  Created by IntelliJ IDEA.
  User: vas
  Date: 26.10.2015
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title> Wacom Javascript API </title>
</head>
<body style="margin:0; padding: 0;">
<table border="1">
  <tr>
    <td>
      <canvas id="main" width="500" height="500"></canvas>
      <embed name="wacom-plugin" id="wacom-plugin"
             type="application/x-wacom-tablet" HIDDEN="TRUE"></embed>
      <script type="text/javascript">
        //по загрузке страницы подключаем скрипт wacom.js
        window.onload = function() {
          var el = document.createElement("script");
          el.type = "text/javascript";
          el.src = "wacom.js?"+Math.random();
          document.getElementsByTagName("head")[0].appendChild(el);
        }
      </script>
    </td>
    <td>
      <- оставьте подпись </br>
      с помощью подключенного </br>
      графического планшета </br>
      <button type="button"value="Вернуться к управлению" onclick="history.back();">
        <img src="image/GoBack.png" alt="" style="vertical-align:middle">
        Вернуться к управлению
      </button>
    </td>
  </tr>
</table>
</body>
</body>
</html>
