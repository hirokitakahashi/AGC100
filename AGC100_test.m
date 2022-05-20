device = 'COM4'; % change according to your environment. Check the device manager to find out the assigned name for AGC100.
s = AGC100_init(device);
[p, stat] = AGC100_get_pressure(s);
disp(p)
%%
AGC_close(s);