robustness = zeros(7,1);

for k = 1:7
    missingpairs = nchoosek(1:8, k);
    allmissing = zeros(size(missingpairs,1),size(missingpairs,2)+2);

    for i = 1:size(missingpairs, 1)
        [Amean, Bmean] = meanerrors(missingpairs(i,:),...
            Acleanrelfil, Bcleanrelfil, Acleanprobed, Bcleanprobed);
        allmissing(i,:) = [missingpairs(i,:) Amean Bmean];
    end


    robustness(k) = (length(find(allmissing(:,end)<allmissing(:,end-1))))/...
        size(allmissing,1);
end

plot(robustness);

function [Amean, Bmean] = meanerrors(miss, Adata, Bdata, Aprobe, Bprobe)
    Aerrors = zeros(length(Adata),1);
    for i = 1:length(Adata)
        data = Adata(i, :);
        for j = 1:length(miss)
            data(1,miss(j)) = 0;
        end
        [pred, ~, ~] = Anet(data);
        Aerrors(i) = sqrt((pred(1)-Aprobe(i,1))^2 + ...
            (pred(2)-Aprobe(i,2))^2);
    end
    Amean = mean(Aerrors);

    Berrors = zeros(length(Bdata),1);
    for i = 1:length(Bdata)
        data = Bdata(i, :);
        for j = 1:length(miss)
            data(1,miss(j)) = 0;
        end   
        [pred, ~, ~] = Bnet(data);
        Berrors(i) = sqrt((pred(1)-Bprobe(i,1))^2 + ...
            (pred(2)-Bprobe(i,2))^2);
    end
    Bmean = mean(Berrors);
end