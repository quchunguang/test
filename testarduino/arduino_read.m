s = serial('/dev/ttyUSB1');  %定义串口对象
set(s,'BaudRate',115200);  %设置波特率s
fopen(s);  %打开串口对象s

interval = 1000;
passo = 1;
t = 1;
x = 0;
while(t<interval)
    b = str2num(fgetl(s));  %用函数fget(s)从缓冲区读取串口数据，当出现终止符（换行符）停止。
    x = [x,b];              %所以在Arduino程序里要使用Serial.println()
    plot(x);
    grid
    t = t+passo;
    drawnow;
end
fclose(s);                  %关闭串口对象s