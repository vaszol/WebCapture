/**
 * Created by vas on 26.10.2015.
 */
window.onload = function () {
    var canvas = document.getElementById('canvas');
    var video = document.getElementById('video');
    var button = document.getElementById('button');
    var allow = document.getElementById('allow');
    var context = canvas.getContext('2d');
    var videoStreamUrl = false;
// ������� ������� ����� ��������� ��� ������� �� ������ ������� �����
    var captureMe = function () {
        if (!videoStreamUrl) alert('��-�� �� �� ������ "���������" � ����� ����, ��-�� ���-�� �� ��� � ����� ����� �������')
// �������������� canvas ��������� �� ����������� (��. �������� ����� ������)
//      context.translate(canvas.width, 0);
//      context.scale(-1, 1);
// ������������ �� ������� ������� ���� �����
        context.drawImage(video, 0, 0, video.width, video.height);
// �������� data: url ����������� c canvas
        var base64dataUrl = canvas.toDataURL('image/png');
        context.setTransform(1, 0, 0, 1, 0, 0); // ������� ��� ��������� ������������� canvas
// �� ���� ����� ����� �������� ���������  base64dataUrl �� ������ � ��������� ��� ��� ��� ���� (�� ��� ���� ����)
// �� �� ������� ��� �������� ������ � ��� ������:
        var img = new Image();
        img.src = base64dataUrl;
        window.document.body.appendChild(img);
    }
    button.addEventListener('click', captureMe);

// navigator.getUserMedia  �   window.URL.createObjectURL (������� ������� ���������� ������������ 2012)
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    window.URL.createObjectURL = window.URL.createObjectURL || window.URL.webkitCreateObjectURL || window.URL.mozCreateObjectURL || window.URL.msCreateObjectURL;
//// ����������� ���������� �� ������ � ��������� ����� ������
    navigator.getUserMedia({video: true}, function (stream) {
//// ���������� �� ������������ ��������
//// �������� ���������
        allow.style.display = "none";
//// �������� url ��������� �����
        videoStreamUrl = window.URL.createObjectURL(stream);
//// ������������� ��� �������� ��� video
        video.src = videoStreamUrl;
    }, function () {
        console.log('���-�� �� ��� � ������������ ��� ������������ �������� ��� ������������ :P');
    });
};