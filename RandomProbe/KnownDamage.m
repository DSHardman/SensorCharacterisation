meanmaxmin1 = zeros(7,6);
meanmaxmin2 = zeros(7,6);

for k = 1:7
    missingpairs = nchoosek(1:8, k);
    allmissing = zeros(size(missingpairs,1),size(missingpairs,2)+4);
    
    for i = 1:size(missingpairs, 1)
        presentsensors = [];
        for j = 1:8
            if ~ismember(j,missingpairs(i,:))
                presentsensors = [presentsensors; j];
            end
        end
        [Cmean, Cmedian] = trainnetwork(presentsensors,Crelativefiltered,CProbedPoints);
        [Dmean, Dmedian] = trainnetwork(presentsensors,Drelativefiltered,DProbedPoints);
        
        allmissing(i,:) = [missingpairs(i,:) Cmean Dmean Cmedian Dmedian];
        fprintf('%d/%d\n',i,k);
    end

    meanmaxmin1(k,:) = [mean(allmissing(:,end-3))...
        max(allmissing(:,end-3)) min(allmissing(:,end-3))...
        mean(allmissing(:,end-2)) max(allmissing(:,end-2))...
        min(allmissing(:,end-2))];
    meanmaxmin2(k,:) = [mean(allmissing(:,end-1))...
        max(allmissing(:,end-1)) min(allmissing(:,end-1))...
        mean(allmissing(:,end)) max(allmissing(:,end))...
        min(allmissing(:,end))];
    fprintf('%d complete\n',k);
end