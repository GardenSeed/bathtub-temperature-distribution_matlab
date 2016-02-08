function [ t_out ] = ffl4( t_input )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%0时刻温度状态,为便于计算，设定边界，即最外层的方块其实都不存在，为了方便计算而添加
%= 20 * ones(22,12,10);
%t0(3:20,3:10,3:10) = 40;
%立flag表示哪些位置是浴缸，那些位置是水，水用-1表示
flag  = ones(22,12,10);
flag(3:20,3:10,3:10) = -1;
%常数量设定
B_w = 0.0006;B_y = 0.00007;
p_w = 1;  p_y = 1.2;
C_w = 4.2;C_y = 1.5; 
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
for i = 3:20
    for j = 3:10
        for k = 3:9
            temp =        (t_in(i - 1,j,k) - t_in(i,j,k))./(dart_x / (flag(i - 1,j,k).*(B_y - B_w) + B_w + B_y) + (dart_x / (flag(i,j,k).*(B_y - B_w) + B_w + B_y)));
            temp = temp + (t_in(i + 1,j,k) - t_in(i,j,k))./(dart_x / (flag(i + 1,j,k).*(B_y - B_w) + B_w + B_y) + (dart_x / (flag(i,j,k).*(B_y - B_w) + B_w + B_y)));
            temp = temp + (t_in(i,j - 1,k) - t_in(i,j,k))./(dart_x / (flag(i,j - 1,k).*(B_y - B_w) + B_w + B_y) + (dart_x / (flag(i,j,k).*(B_y - B_w) + B_w + B_y)));
            temp = temp + (t_in(i,j + 1,k) - t_in(i,j,k))./(dart_x / (flag(i,j + 1,k).*(B_y - B_w) + B_w + B_y) + (dart_x / (flag(i,j,k).*(B_y - B_w) + B_w + B_y)));
            temp = temp + (t_in(i,j,k - 1) - t_in(i,j,k))./(dart_x / (flag(i,j,k - 1).*(B_y - B_w) + B_w + B_y) + (dart_x / (flag(i,j,k).*(B_y - B_w) + B_w + B_y)));
            temp = temp + (t_in(i,j,k + 1) - t_in(i,j,k))./(dart_x / (flag(i,j,k + 1).*(B_y - B_w) + B_w + B_y) + (dart_x / (flag(i,j,k).*(B_y - B_w) + B_w + B_y)));
            t_o(i,j,k) =  t_in(i,j,k) + temp.*(dart_t/(dart_x.*((flag(i,j,k).*(p_y - p_w) + p_w + p_y)*(1/2))*(flag(i,j,k).*(C_y - C_w) + C_w + C_y)*(1/2)));
        end
    end
end
t_out = t_o;
end

