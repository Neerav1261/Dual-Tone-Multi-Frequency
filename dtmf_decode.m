%This function takes user_input : which is a number and SNR as an input
%For this purpose just call the function and it will promt for the same
function symbol = dtmf_decode()
    user_input = input('Enter a signle digit : ' , 's');
    SNR = input('Enter SNR : ');
    output = TouchToneDialler(user_input,SNR); %Output Signal
    sound(output); %playing sound of the output signal
    %Plotting the Output of TouchToneDialler
    subplot(2,1,1);
    plot(output);
    title('Output Signal');xlabel('Samples');ylabel('Signal');

    Fs = 8000;            % Sampling frequency                          
    L = length(output);   % Length of signal
    % Taking fft of signal and considering only the +ve band
    Y = fft(output); 
    P2 = abs(Y/L);
    P1 = P2(1:floor(L/2)+1);
    f = Fs*(0:(L/2))/L;
    %Plotting the Output of TouchToneDialler in frequency domain to identify
    %the peak
    subplot(2,1,2);
    plot(f,P1);
    title('Output in f domain');xlabel('freq(Hz)');ylabel('|Signal(f)|');
    % Calling self made function GetNumberPressed to know which number is pressed
    disp(GetNumberPressed(P1,f));
end