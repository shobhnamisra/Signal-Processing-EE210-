function [hf] = hfunc(M,ts)
%HFUNC Summary of this function goes here
%   Detailed explanation goes here

global Tf


t = 0:ts:Tf;

hf = (1/M)*ones(1, length(t) - 2);
hf(length(t)-1) = 0;

%plot(t, hf, 'r');

%ylim([0,1.2/M + M.^0.5]);
