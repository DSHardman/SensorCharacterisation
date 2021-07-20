robustness = zeros(7,1);

meanmaxmin = zeros(7,6);

for k = 1:7
    missingpairs = nchoosek(1:8, k);
    allmissing = zeros(size(missingpairs,1),size(missingpairs,2)+2);
    
    for i = 1:size(missingpairs, 1)
        [Cmean, Dmean] = meanerrors(missingpairs(i,:),...
            Crelativefiltered, Drelativefiltered, CProbedPoints, DProbedPoints);
        allmissing(i,:) = [missingpairs(i,:) Cmean Dmean];
    end

    robustness(k) = mean(allmissing(:,end))/mean(allmissing(:,end-1));
    meanmaxmin(k,:) = [mean(allmissing(:,end-1))...
        max(allmissing(:,end-1)) min(allmissing(:,end-1))...
        mean(allmissing(:,end)) max(allmissing(:,end))...
        min(allmissing(:,end))];
    k
end

robustness = [2.0065/2.1624; robustness];
plot(robustness);

function [Amean, Bmean] = meanerrors(miss, Adata, Bdata, Aprobe, Bprobe)
    Aerrors = zeros(length(Adata),1);
    for i = 1:length(Adata)
        data = Adata(i, :);
        for j = 1:length(miss)
            data(1,miss(j)) = 0;
        end
        [pred, ~, ~] = Cnet(data);
        Aerrors(i) = sqrt((pred(1)-Aprobe(i,1))^2 + ...
            (pred(2)-Aprobe(i,2))^2);
    end
    Amean = median(Aerrors);

    Berrors = zeros(length(Bdata),1);
    for i = 1:length(Bdata)
        data = Bdata(i, :);
        for j = 1:length(miss)
            data(1,miss(j)) = 0;
        end   
        [pred, ~, ~] = Dnet(data);
        Berrors(i) = sqrt((pred(1)-Bprobe(i,1))^2 + ...
            (pred(2)-Bprobe(i,2))^2);
    end
    Bmean = median(Berrors);
end