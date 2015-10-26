/**
 * Created by vas on 26.10.2015.
 */
var plugin = document.getElementById("wacom-plugin"); //�������� ������
var canvas = document.getElementById("main"); //�������� ������� �������
var context = canvas.getContext("2d"); //�������� �������� ��� ���������

context.lineCap = "round"; //����� ���������� ����� - ��������
context.lineJoin = "round"; //����� ������ ����� - ��������
context.strokeStyle = "#6DA3BD"; //���� �����

//���������� ��� �������� ���������� ��������� (��� ��������� �����)
var oldX = 0;
var oldY = 0;

var mousedown = false; //����, ���� ������� ����� �� �������

canvas.onmousedown = function(e) {
    mousedown = true; //������������� ���� ��� ������ ��������� (������ ������)
    oldX = e.pageX; //������������� ��������� �������� ��� ���������� ���������
    oldY = e.pageY;
    onMouseMove(e); //���������� �� ������� ��������� (����� �������� � ������� �����)
}

canvas.onmousemove = onMouseMove;

function onMouseMove(e) {
    if(!mousedown) return;
    if(plugin) { //���������, ���� �� ������ ��������
        context.lineWidth = 25 * plugin.pressure; //������ ������ ����� ��������� �� ���� �������
    } else {
        context.lineWidth = 25; //���� ������� ������ ����� � ������� �� ���������
    }
    context.beginPath(); //��������� ����
    context.moveTo(oldX, oldY); //������� � ���������� �����������
    context.lineTo(e.pageX, e.pageY); //�������� ����� � �������
    context.stroke(); //������ �����
    oldX = e.pageX; //������������� ���������� ����������� ������
    oldY = e.pageY;
}

canvas.onmouseup = function() {
    mousedown = false; //����� ������
}