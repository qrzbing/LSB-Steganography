% author: QRZ
% date: 2017/11/19

%test1%
hide_pic='hide.jpg'; % read hide picture
M='secret.txt';	

hid_data='hidden1.jpg';
[L,M]=lsbhide(hide_pic,M);
L=lsbget(M,L,hid_data);