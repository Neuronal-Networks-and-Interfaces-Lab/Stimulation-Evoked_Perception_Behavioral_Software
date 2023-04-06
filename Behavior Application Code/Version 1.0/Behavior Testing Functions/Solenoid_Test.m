a = arduino("COM4", "ProMini328_5V");

writeDigitalPin(a,'D11',1);
writeDigitalPin(a,'D11',0);
pause(2);

writeDigitalPin(a,'D11',1);
writeDigitalPin(a,'D11',0);
pause(2);

writeDigitalPin(a,'D11',1);
writeDigitalPin(a,'D11',0);
pause(2);

% clear at the end of the behavior with the stop button
clear a
