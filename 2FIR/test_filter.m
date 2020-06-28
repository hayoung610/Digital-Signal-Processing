% test_filter.m
%
% Tests the response of the filter using our stepped CW method.
%
% This script assumes that f_ideal and H_ideal hold the 
% frequency samples (in Hz) and ideal response of your filter, 
% respectively.

% Options for stepped CW function
ops.f0 = 100;
ops.f1 = 4000;
ops.N = 32;
ops.Tpad = 0.3;
ops.Test = 0.4;
%ops.Ton = ops.Test/5;
ops.Ton = ops.Test/4;

% Options for delay estimation
ops.dmax = 0.2;
ops.Tn = 0.01;

input('Put in audio loopback mode and press [enter]:', 's');

% Estimate the delay
d = audio_delay(ops);
ops.delay = d;
if (d < 0),
    error('Negative delay?');
end

% Get freq response
[H_lb, f_lb] = audio_xfer(ops);

input('Put in filter mode and press [enter]:', 's');

[H_f, f_f] = audio_xfer(ops);

% Remove effects of computer hardware
H_m = H_f./H_lb;

plot(f*8000, abs(H), f_f, abs(H_m));
