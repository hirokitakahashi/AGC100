function s = AGC100_init(device)
% Initialize communication with AGC100.
% usage: s = AGC100_init(device)
%   device = device name such as 'COM1'
%   s = serial port object
s = serial(device, 'BaudRate', 115200,'Terminator','CR/LF');
fopen(s);