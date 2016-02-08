function [ out ] = model2_1000( in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m = ffl2(in);
    for i = 1:1000
        m = ffl2(m);
    end
    out = m;
end



