function L=lsbget(M,L,hid_data)
% every 8 bin num change into an ASCII char


hid_pic=imread(hid_data);
[n1,m1]=size(hid_pic);
m1=m1/3;

ct=1;temp=M;
% get the secret information
for i=1:m1
	for j=1:n1
		for k=1:3
			temp(ct,1)=temp(ct,1)+mod(hid_pic(i,j,k),2);
			if temp(ct,1)==2
				temp(ct,1)=1;
			end
			if ct==L
				break;
			end
			ct=ct+1;
		end
		if ct==L
			break;
		end
	end
	if ct==L
		break;
	end
end
c=0; j=0;
fileID=fopen('output','w');
for i=1:L
    c=c+temp(i,1)*(2^j);
    j=j+1;
    if j==8
        j=0;
        fwrite(fileID,c,'char');
        c=0;
    end    
end
fclose(fileID);