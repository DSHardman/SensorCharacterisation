T = readtable('RandomProbe/Logging.log'); %file to read

samplerate = 10; %Hz
T = table2cell(T);

response = zeros(size(T,1),8);

for i = 1:size(T,1)
    results = cell2mat(T(i,:));
    response(i,:) = results;
end

for i = 1:8
    response(:,i) = pwc_tvdrobust(response(:,i), 10.0, 0);
    i
end

%%
%{
allresponses = zeros(5000,51,8);

for i = 1:2500
    start = round(176+(i-1)*100.149660);
    for j = 1:8
        allresponses(i,:, j) = response(start:start+50,j);
    end
end

for i = 2501:5000
    start = round(150550+(i-2501)*100.160064);
    for j = 1:8
        allresponses(i,:, j) = response(start:start+50,j);
    end
end
%}