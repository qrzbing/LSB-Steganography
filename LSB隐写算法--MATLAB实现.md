LSB隐写算法--MATLAB实现

LSB隐写原理: 

首先将需要隐写的文件用二进制流的方式读取并保存在字符串S当中，然后顺序提取BMP图片的像素点，每一个像素点包含K(R、G、B)三种颜色，每一种颜色能够嵌入1bit信息，每一个像素点就能够嵌入3bit的信息。

隐写部分:

```matlab
Kr=Kr-mod(Kr,2)+S[i];
Kg=Kg-mod(Kg,2)+S[i+1];
Kb=Kb-mod(Kb,2)+S[i+2];
```

提取部分:

```matlab
S=S+mod(Kr,2);
S=S+mod(Kg,2);
S=S+mod(Kb,2);
```

