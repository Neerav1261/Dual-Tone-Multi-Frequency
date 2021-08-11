%this function takes user_input - array of strings and SNR as input
%for this purpose use code to provide input
function phone_number = touch_tone_decoder(user_input,SNR)
    output = TouchToneDialler(user_input,SNR); %Output Signal
    sound(output); %playing sound of the output signal
    %Plotting the Output of TouchToneDialler
    plot(output);
    title('Output Signal');xlabel('Samples');ylabel('Signal');
    Fs = 8000;% Sampling frequency                         
    L = length(output);% Length of signal
    num = size(user_input);%get number of digits entered
    %for SNR more than 18
    if SNR>=18
        %splitting the signals into individual signals
        count = 0; row = 1; col = 1;
        for i = 1:L
            if abs(output(i)) < 0.3
                count = count+1;
            end
            if count>400 && abs(output(i))>0.3
                count = 0; row = row+1; col = 1;
                splitsignal(row,col) = output(i);
            end
            splitsignal(row,col) = output(i);
            col = col+1;
        end
        %individual signals fft is generated and compared to get key pressed
        [numRows,numCols] = size(splitsignal);
        for i = 2:numRows
            L1 = length(splitsignal(i,:));
            Y = fft(splitsignal(i,:));
            P2 = abs(Y/L1);
            P1 = P2(1:floor(L1/2)+1);
            f = Fs*(0:(L1/2))/L1;
            figure;
            subplot(2,1,1)
            plot(splitsignal(i,:));
            subplot(2,1,2);
            plot(f,P1);
            title('Output in f domain');xlabel('freq(Hz)');ylabel('|Signal(f)|');
            disp(GetNumberPressed(P1,f));
        end
    end
    %for SNR less than 18
    if SNR<18
        %splitting the signals into individual signals
        div = floor(L/num);
        count = 0; row = 1; col = 1;
        for i = 1:L
            if count == div
                count = 0; row = row+1; col = 1;
                splitsignal(row,col) = output(i);
            end
            splitsignal(row,col) = output(i);
            col = col+1;
            count = count+1;
        end
        %individual signals fft is generated and compared to get key pressed
        [numRows,numCols] = size(splitsignal);
        for i = 1:numRows-1
            L1 = length(splitsignal(i,:));
            Y = fft(splitsignal(i,:));
            P2 = abs(Y/L1);
            P1 = P2(1:floor(L1/2)+1);
            f = Fs*(0:(L1/2))/L1;
            figure;
            subplot(2,1,1)
            plot(splitsignal(i,:));
            subplot(2,1,2);
            plot(f,P1);
            title('Output in f domain');xlabel('freq(Hz)');ylabel('|Signal(f)|');
            disp(GetNumberPressed(P1,f));
        end
    end
end