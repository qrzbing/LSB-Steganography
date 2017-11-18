function [L,M]=lsbhide(hide_pic,M)

pic_data=imread(hide_pic); % open hide picture

secret=fopen(M,'rb'); % open secret file
[M,L]=fread(secret,'ubit1');	% read secret file as bin array
% L is the length of seceret file
[n,m]=size(pic_data); % n is width,m is height*3
m=m/3;
% m*n is the max size to save secret
if (m*n*3<L)
	msg=msgbox('your hide picture is too small','size error','error','modal');
	pause(1);
	if (ishandle(msg))
		close(msg);
	end
end
latest_data=pic_data;
count=1;

for i=1:m % width
	for j=1:n % height
		for k=1:3 % RGB
			latest_data(i,j,k)=pic_data(i,j,k)-mod(pic_data(i,j,k),2)+M(count,1);
			if count==L
				break;
			end
			count=count+1;
		end
		if count==L
			break;
		end
	end
	if(L==count)
		break;
	end
end

imwrite(latest_data,'hidden1.jpg','bmp');

CC=M;
count1=1;
for i=1:m
	for j=1:n
		for k=1:3
			CC(count1)=latest_data(i,j,k)-pic_data(i,j,k);
			if count1==L
				break
			end
			count1=count1+1;
		end
		if count1==L
			break
		end
	end
	if count1==L
		break
	end
end