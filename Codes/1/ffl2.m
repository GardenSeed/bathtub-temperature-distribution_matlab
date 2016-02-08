function [ t_out ] = ffl2( t_input )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%0时刻温度状态,为便于计算，设定边界，即最外层的方块其实都不存在，为了方便计算而添加
%= 20 * ones(22,12,10);
%t0(3:20,3:10,3:10) = 40;
%立flag表示哪些位置是浴缸，那些位置是水，水用-1表示
flag  = -ones(22,12,10);
flag(1:22,1:12,10) = 1;
%常数量设定
B_w = 0.0006;B_a = 0.00000245;
p_w = 1;  p_a = 0.0129;
C_w = 4.2;C_a = 1.005; 
dart_t = 1;dart_x = 0.1;
%设计公式
t_in = t_input;
t_in(2,1:12,1:10) = t_in(3,1:12,1:10);
t_in(21,1:12,1:10) = t_in(20,1:12,1:10);
t_in(1:22,2,1:10) = t_in(1:22,3,1:10);
t_in(1:22,11,1:10) = t_in(1:22,10,1:10);
t_in(1:22,2:12,2) = t_in(1:22,2:12,3);
t_in(1:22,1:12,10) = t_in(1:22,1:12,9);
t_o = t_in;
for k = 3:9
    for j = 3:10
        for i = 3:20
            l = 12 - k;
            temp =        (t_in(i - 1,j,l) - t_in(i,j,l))./(dart_x / (flag(i - 1,j,l).*(B_a - B_w) + B_w + B_a) + (dart_x / (flag(i,j,l).*(B_a - B_w) + B_w + B_a)));
            temp = temp + (t_in(i + 1,j,l) - t_in(i,j,l))./(dart_x / (flag(i + 1,j,l).*(B_a - B_w) + B_w + B_a) + (dart_x / (flag(i,j,l).*(B_a - B_w) + B_w + B_a)));
            temp = temp + (t_in(i,j - 1,l) - t_in(i,j,l))./(dart_x / (flag(i,j - 1,l).*(B_a - B_w) + B_w + B_a) + (dart_x / (flag(i,j,l).*(B_a - B_w) + B_w + B_a)));
            temp = temp + (t_in(i,j + 1,l) - t_in(i,j,l))./(dart_x / (flag(i,j + 1,l).*(B_a - B_w) + B_w + B_a) + (dart_x / (flag(i,j,l).*(B_a - B_w) + B_w + B_a)));
            temp = temp + (t_in(i,j,l - 1) - t_in(i,j,l))./(dart_x / (flag(i,j,l - 1).*(B_a - B_w) + B_w + B_a) + (dart_x / (flag(i,j,l).*(B_a - B_w) + B_w + B_a)));
            temp = temp + (t_in(i,j,l + 1) - t_in(i,j,l))./(dart_x / (flag(i,j,l + 1).*(B_a - B_w) + B_w + B_a) + (dart_x / (flag(i,j,l).*(B_a - B_w) + B_w + B_a)));
            t_o(i,j,l) =  t_in(i,j,l) + temp.*(dart_t/(dart_x.*((flag(i,j,l).*(p_a - p_w) + p_w + p_a)*(1/2))*(flag(i,j,l).*(C_a - C_w) + C_w + C_a)*(1/2)));
        end
    end
end
t_out = t_o;
end

