function [ t_out ] = ffl3( t_input )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%******************************************************************
%*��������汾�Ǿ�ϸ�������С�������С�趨Ϊ0.01m�Ĵ�С*            *
%*���뺯��Ӧ��Ϊ202*102*82 ����ɫ��ʶ����*                          *
%******************************************************************
%0ʱ���¶�״̬,Ϊ���ڼ��㣬�趨�߽磬�������ķ�����ʵ�������ڣ�Ϊ�˷����������
t_in = t_input;
%= 20 * ones(202,102,82);
%t0(12:191,12:91,12:71) = 40;
%��flag��ʾ��Щλ����ԡ�ף���Щλ����ˮ��ˮ��-1��ʾ
flag  = ones(202,102,82);
flag(12:191,12:91,12:71) = -1;
%�������趨
B_w = 0.0006;B_y = 0.00007;
p_w = 1;  p_y = 1.2;
C_w = 4.2;C_y = 1.5; 
dart_t = 1;dart_x = 0.01;
%��ƹ�ʽ
t_o = t_input;
t_o(1,1:102,1:82) = t_o(2,1:102,1:82);
t_o(202,1:102,1:82) = t_o(201,1:102,1:82);
t_o(1:202,1,1:82) = t_o(1:202,2,1:82);
t_o(1:202,102,1:82) = t_o(1:202,101,1:82);
t_o(1:202,1:102,1) = t_o(1:202,1:102,2);
t_o(1:202,1:102,82) = t_o(1:202,1:102,81);
for i = 2:201
    for j = 2:101
        for k = 2:81
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

