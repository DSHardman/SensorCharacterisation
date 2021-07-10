%% Section 1: load files & filter signal

ProbedPoints = readtable('D/D_RandomLocations.txt');
ProbedPoints = table2array(ProbedPoints);

T = readtable('D/D_Logging.log'); %file to read

T = table2cell(T);

response = zeros(size(T,1),8);

for i = 1:size(T,1)
    results = cell2mat(T(i,:));
    response(i,:) = results;
end

%response = response(1:502733,:); %cut out data after testing has finished

fresponse = zeros(size(response));
%filter noise from signal
for i = 1:8
    fresponse(:,i) = pwc_tvdrobust(response(:,i), 10.0, 0);
    i
end

%% Section 2: manual input

figure()
hold on
for i = 1:8
    plot(response(1:1500,i))
end

x = zeros(501,1);
[x(1), ~] = ginput(1);

for i = 1:499
    i
    hold off
    for j = 1:8
        plot(response(round(x(i)+950):round(x(i)+1050),j))
        hold on
    end
    [xn, ~] = ginput(1);
    x(i+1) = xn + x(i) + 949;
    
end

500
hold off
for j = 1:8
    plot(response(round(x(i)+850):round(x(i)+950),j))
    hold on
end
[xn, ~] = ginput(1);
x(501) = xn + x(500) + 849;

%% Section 3: create array of sample locations

locations = zeros(5000, 1);

locations(1) = round(x(1));

for i = 2:4990
    ref1 = fix((i-1)/10) + 1;
    ref2 = i - (ref1-1)*10 - 1;
    
    locations(i) = round(x(ref1) + (ref2/10)*(x(ref1+1)-x(ref1)));
end

for i = 4991:5000
    locations(i) = round(x(500) + ((i-4991)/9)*(x(501)-x(500)));
end

%% Section 4: create 4 arrays of sensor signals

rawfiltered = zeros(5000,8);
c3filtered = zeros(5000,8, 3);
relativefiltered = zeros(5000,8);
rawunfiltered = zeros(5000,8);
relativeunfiltered = zeros(5000,8);

for i = 1:5000
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