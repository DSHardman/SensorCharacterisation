%% Section 1: load files & filter signal

ProbedPoints = readtable('B/retestb.txt');
%ProbedPoints = table2array(ProbedPoints);

T = readtable('B/retestb.log'); %file to read

samplerate = 10; %Hz
T = table2cell(T);

response = zeros(size(T,1),9);

for i = 1:size(T,1)
    results = cell2mat(T(i,:));
    response(i,:) = results;
end

fresponse = zeros(size(response,1),size(response,2)-1);
%filter noise from signal
for i = 1:8
    fresponse(:,i) = pwc_tvdrobust(response(:,i), 10.0, 0);
    i
end


%% Section 3: create array of sample locations

locations = zeros(size(ProbedPoints,1), 1);
for i = 1:size(ProbedPoints,1)
    secs = seconds(table2array(ProbedPoints(i,3))-table2array(ProbedPoints(1,3)));
    locations(i) = round(190 + secs*10);
   
end
%% Section 4: create 4 arrays of sensor signals

rawfiltered = zeros(size(ProbedPoints,1),8);
c3filtered = zeros(size(ProbedPoints,1),8, 3);
relativefiltered = zeros(size(ProbedPoints,1),8);
rawunfiltered = zeros(size(ProbedPoints,1),8);
relativeunfiltered = zeros(size(ProbedPoints,1),8);

for i = 1:size(ProbedPoints)
    for j = 1:8
        rawfiltered(i,j) = fresponse(locations(i), j);
        c3filtered(i,j,:) = [fresponse(locations(i)-50, j) fresponse(locations(i)+50, j) fresponse(locations(i), j)];
        relativefiltered(i,j) = calc_relative(fresponse, locations(i), j);
        rawunfiltered(i,j) = response(locations(i), j);
        relativeunfiltered(i,j) = calc_relative(response, locations(i), j);
    end
end

%%

function data = calc_relative(response, location, j)
    baseline = (response(location+50,j)+response(location-50,j))/2;
    data = response(location, j) - baseline;
end