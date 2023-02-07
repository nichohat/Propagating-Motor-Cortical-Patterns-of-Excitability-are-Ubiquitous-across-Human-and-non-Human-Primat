function [BetaOrient, BetaSpeed] = computeOS(trialbetawf, trialmbetawf, inputArguments)
segment = computeAttenuation(trialmbetawf, inputArguments.MaxEnd , inputArguments.MaxBegin);
baores = zeros(inputArguments.numofTrials, 2);
baoval = []; baorsq = [];baomap = {};bestbao = [];bestrsq = [];
disp('Computing Beta Propagation Angle...');
for tr = 1:inputArguments.numofTrials
seltrial = tr;
seldata = trialbetawf{seltrial};
[nos,~] = size(segment{seltrial});
trialsegment = [];nosrev = 0;
for ns = 1:nos
    tempnan = isnan(segment{seltrial}(ns,:));
    if sum(tempnan)==0
        nosrev = nosrev+1;
        trialsegment(ns,:) = segment{seltrial}(ns,:);
    end
end

if ~isempty(trialsegment)
for n = 1:nosrev
    thresh = trialsegment(n,3)-0.1:-0.1:trialsegment(n,4)+0.1;
    if ~isempty(thresh)
        for th = 1:length(thresh)
            bat = computeSegBAT(seldata(:,trialsegment(n,1):trialsegment(n,2)), thresh(th), inputArguments.availChannels, inputArguments.ElectrodeMap);
            [baoval(n, th), baorsq(n, th), baomap{n,th}] = computeSegBAO(bat, 16, size(inputArguments.ElectrodeMap));
        end
        [~, highRloc] = max(baorsq(n,:));
        regmat{n} = baomap{n,highRloc};
        bestbao(n) = baoval(n, highRloc);
        bestrsq(n) = baorsq(n, highRloc);
    end
end

[~, maxrsqloc] = max(bestrsq);
baores(tr,:) = [bestbao(maxrsqloc) bestrsq(maxrsqloc)];
baoregmat{tr} = regmat{maxrsqloc};

else
    baoregmat{tr} = [];
end
end

BetaOrient = baores;
BetaSpeed = compSpeed(baoregmat, inputArguments);
