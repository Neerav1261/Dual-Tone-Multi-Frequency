%This Function takes fft signal and frequency axis and gives which key is
%pressed
function out = GetNumberPressed(P1,f)
%sorting the fft signal and then picking the peak frequencies
[temp,index] = sort(P1, 'descend'); 
n = temp(1:3);
picker = index(1:3);
freq = [ f(picker(1)) , f(picker(2))];
%Comparing these peaks with the Keypad Frequencies to get key pressed
%Column 1 - 1,4,7,*
if max(freq)>1150 && max(freq)<1260
    if max(freq(freq<max(freq)))>650 && max(freq(freq<max(freq)))<740
        out = '1';
    elseif max(freq(freq<max(freq)))>740 && max(freq(freq<max(freq)))<810
        out = '4';
    elseif max(freq(freq<max(freq)))>810 && max(freq(freq<max(freq)))<900
        out = '7';
    elseif max(freq(freq<max(freq)))>900 && max(freq(freq<max(freq)))<1000
        out = '*';
    end
end
%Column 2 - 2,5,8,0
if max(freq)>1260 && max(freq)<1400
    if max(freq(freq<max(freq)))>650 && max(freq(freq<max(freq)))<740
        out = '2';
    elseif max(freq(freq<max(freq)))>740 && max(freq(freq<max(freq)))<810
        out = '5';
    elseif max(freq(freq<max(freq)))>810 && max(freq(freq<max(freq)))<900
        out = '8';
    elseif max(freq(freq<max(freq)))>900 && max(freq(freq<max(freq)))<1000
        out = '0';
    end
end
%Column 3 - 3,6,9,#
if max(freq)>1420 && max(freq)<1520
    if max(freq(freq<max(freq)))>650 && max(freq(freq<max(freq)))<740
        out = '3';
    elseif max(freq(freq<max(freq)))>740 && max(freq(freq<max(freq)))<810
        out = '6';
    elseif max(freq(freq<max(freq)))>810 && max(freq(freq<max(freq)))<900
        out = '9';
    elseif max(freq(freq<max(freq)))>900 && max(freq(freq<max(freq)))<1000
        out = '#';
    end
end
end