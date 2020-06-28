function [state_out, y] = fir(state_in, x);

% [state_out, y] = fir(state_in, x);
%
% Executes the FIR block.
%
% Inputs:
%	state_in	Input state
%	x		Samples to process
% Outputs:
%	state_out	Output state
%	y		Processed samples

% Get state
s = state_in;
y = zeros(size(x));

% Move samples into tail of buffer
for i =0: length(x)-1,
    s.buff(s.n_t+1)=x(i+1);
    s.n_t=bitand(s.n_t+1, s.Mmask);
    ptr = bitand(s.n_t+s.Mmask, s.Mmask);
    
    sum = 0.0;

% Filter samples and move into output
for l = 0:length(s.h)-1,
    sum = sum+s.buff(ptr+1)*s.h(l+1);
        ptr = bitand(ptr+s.Mmask, s.Mmask);
end
end
    for i = 0: length(x-1)
        y(i+1)=sum;
    end
    
% Return updated state
state_out = s;