T0 = 35.9783;
T_h = 33;
T_d = zeros(1,51);
T_d(1) = T0;
for i = 1:50
    T_d(i + 1)  = T_d(i)*0.95 + 0.05*T_h;
end
for i = 1:50
    plot(i,T_d(i),'*')
    hold on
end