function s = moc(p,q)
% Measure of Concordance (MoC)
% From:
% Characterization and evaluation of similarity measures for pairs of clusterings
% Pfitzner, D., Leibbrandt, R. & Powers, D. Knowl Inf Syst (2009) 19: 361. https://doi.org/10.1007/s10115-008-0150-6
%
% By Pablo Andretta Jaskowiak (09/18/19)
% The source code is provided as is.
% If you decide to use it, please cite the repository
% https://academia.stackexchange.com/questions/14010/how-do-you-cite-a-github-repository

if nargin < 2 || min(size(p)) > 1 || min(size(q)) > 1 || numel(p) ~= numel(q)
   error('First two arguments must be two vectors with the same length.');
end

%number of clusters (k) for p and q
pk = length(unique(p));
qk = length(unique(q));

%cluster labels for p and q
cp = unique(p);
cq = unique(q);

s = 0;

for i=1:pk
    %find object ids for the ith cluster
    objp = find(p==cp(i));
    for j=1:qk
        %find object ids for the jth cluster
        objq = find(q==cq(j));
        
        %find object ids that are in both clusters...
        fij = length(intersect(objp,objq));
       
        %number of objects in cluster pi and qj
        pi  = length(objp);
        qj  = length(objq);
        
        %apply the formula...
        s = s + (fij^2 / (pi * qj));
    end
end

%normalize.
s = (s-1) / (sqrt(pk*qk)-1);

end