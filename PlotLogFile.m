T = readtable('RandomProbe/Logging.log'); %file to read

%define resistors in potential divider
res = 1.2e3;

samplerate = 10; %Hz
T = table2cell(T);

response = zeros(size(T,1),8);

for i = 1:size(T,1)
    results = cell2mat(T(i,:));
    response(i,:) = results;
end

for i = 1:8
    response(:,i) = converttores(response(:,i), res);
end

figure();
for i = [0 1 2 3 4 5 6 7]
    plot(0:1/samplerate:(size(response,1) - 1)/samplerate, response(:,i+1),...
        'LineWidth', 2, 'DisplayName', string(i));
    hold on
end
legend();
xlabel('Time (s)')
ylabel('Resistance (Ohms)')
ylim([0 10000])
xlim([35030 35090])

function dataout = converttores(data, kres)
    dataout = zeros(size(data));
    for i = 1:length(data)
        if data(i) > 1015
            dataout(i) = NaN;
            continue
        end
        dataout(i) = (data(i)*kres)/(1023-data(i));
    end
end
