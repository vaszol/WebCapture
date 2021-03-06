<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 25.10.15
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
    <link rel="stylesheet" href="css/video.css">
  </head>
  <body>

hello!<br/>
<div id="allow">▲ ▲ ▲ Разрешите использовать камеру ▲ ▲ ▲ <br/> ( Сверху текущей страницы )</div>


<table>
  <tr>
    <td class="item">
      <span> video </span>
      <video id="video" width="320" height="240" autoplay="autoplay" ></video>
    </td>
    <td class="item">
      <span> canvas </span>
      <canvas id="canvas" width="320" height="240"  ></canvas>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <input id="button" type="button" value="Жми!" />
    </td>
  </tr>
    <tr>
        <td colspan="2">
            <a href="tablet.jsp">
                <img src="image/paint.jpg">
            </a>
        </td>
    </tr>
</table>

<script>
  window.onload = function () {
    var canvas = document.getElementById('canvas');
    var video = document.getElementById('video');
    var button = document.getElementById('button');
    var allow = document.getElementById('allow');
    var context = canvas.getContext('2d');
    var videoStreamUrl = false;
// функция которая будет выполнена при нажатии на кнопку захвата кадра
    var captureMe = function () {
      if (!videoStreamUrl) alert('То-ли вы не нажали "разрешить" в верху окна, то-ли что-то не так с вашим видео стримом')
// переворачиваем canvas зеркально по горизонтали (см. описание внизу статьи)
//      context.translate(canvas.width, 0);
//      context.scale(-1, 1);
// отрисовываем на канвасе текущий кадр видео
      context.drawImage(video, 0, 0, video.width, video.height);
// получаем data: url изображения c canvas
      var base64dataUrl = canvas.toDataURL('image/png');
      context.setTransform(1, 0, 0, 1, 0, 0); // убираем все кастомные трансформации canvas
// на этом этапе можно спокойно отправить  base64dataUrl на сервер и сохранить его там как файл (ну или типа того)
// но мы добавим эти тестовые снимки в наш пример:
      var img = new Image();
      img.src = base64dataUrl;
      window.document.body.appendChild(img);
    }
    button.addEventListener('click', captureMe);

// navigator.getUserMedia  и   window.URL.createObjectURL (смутные времена браузерных противоречий 2012)
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    window.URL.createObjectURL = window.URL.createObjectURL || window.URL.webkitCreateObjectURL || window.URL.mozCreateObjectURL || window.URL.msCreateObjectURL;
//// запрашиваем разрешение на доступ к поточному видео камеры
    navigator.getUserMedia({video: true}, function (stream) {
//// разрешение от пользователя получено
//// скрываем подсказку
      allow.style.display = "none";
//// получаем url поточного видео
      videoStreamUrl = window.URL.createObjectURL(stream);
//// устанавливаем как источник для video
      video.src = videoStreamUrl;
    }, function () {
      console.log('что-то не так с видеостримом или пользователь запретил его использовать :P');
    });
  };
</script>

  </body>
</html>
