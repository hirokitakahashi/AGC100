function [p, stat] = AGC100_get_pressure(s)
% Get pressure reading from AGC100.
% usage: [p, stat] = AGC100_get_pressure(s)
%   s = Serial port object. This needs to be open in advance.
%   p = Pressure reading value
%   stat = status indicator

ret = query(s, 'PR1', '%s\n', '%s\n');

if sprintf('%x', ret(1)) == '6'
    % positive acknowledgement received
    ret = query(s, char(hex2dec('5')), '%s', '%s\n'); % send 'CTRL-E' WITHOUT termination and read WITH termination.
else
    error('positive ack not received!')
end

t = regexp(ret, '(\d), ([\de+]+)', 'tokens');
if length(t{:}) == 2
    p = str2double(t{:}{2});
    stat = str2double(t{:}{1});
else
    error('responce in unexpected format!')
end

    