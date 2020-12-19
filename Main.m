%-------------------------------------------------------------------%
%  Binary Particle Swarm Optimization (BPSO) demo version           %
%-------------------------------------------------------------------%


%---Input------------------------------------------------------------
% feat     : feature vector (instances x features)
% label    : label vector (instances x 1)
% N        : Number of particles
% max_Iter : Maximum number of iterations
% c1       : Cognitive factor
% c2       : Social factor

%---Output-----------------------------------------------------------
% sFeat    : Selected features 
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Binary Particle Swarm Optimization 
clc, clear, close 
% Benchmark data set 
load ionosphere.mat;

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho,'Stratify',false);

% Parameter setting
N        = 10; 
max_Iter = 100;
c1       = 2; 
c2       = 2; 
% Binary Particle Swarm Optimization 
[sFeat,Sf,Nf,curve] = jBPSO(feat,label,N,max_Iter,c1,c2,HO);

% Plot convergence curve
plot(1:max_Iter,curve); 
xlabel('Number of Iterations');
ylabel('Fitness Value');
title('BPSO'); grid on;




