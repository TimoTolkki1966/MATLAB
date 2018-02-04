[y,FS]=audioread('./test2.wav');


Length = length(y);
t=(0:Length)/FS;
figure;
ft=y(:,1);
plot(t(1:200),ft(1:200));hold on;
xlabel('Time');ylabel('Amplitude');


Min = ft(1);
Max = ft(1);
M = 16;
for i = 1:200
    if(ft(i) < Min)
        Min = ft(i);
    end
    if(ft(i) > Max)
        Max = ft(i);
    end
end


det = (Max - Min)/M;
m = zeros(M);
for i = 1:M
    m(i) = Min + i*det;%???????
end

%V?????
V = zeros(1,200);
node = [Min,m(1:M-1),Max];
for i = 1:200
    for j = 1:M
        if(node(j) < ft(i) && ft(i) <= node(j+1))
            %????
            V(i) = node(j);
        end
    end
end
plot(t(1:200), V(1:200),'r'),grid on;