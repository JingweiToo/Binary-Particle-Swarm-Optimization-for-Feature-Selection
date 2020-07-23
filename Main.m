%-------------------------------------------------------------------------%
%  Binary Particle Swarm Optimization (BPSO) source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%


%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling
% N:     Number of particles
% T:     Maximum number of iterations
% c1:    Cognitive factor
% c2:    Social factor
% Vmax:  Maximum velocity
% Wmax:  Maximum bound on inertia weight
% Wmin:  Minimum bound on inertia weight
% *Note: k-value of KNN & hold-out setting can be modified in jFitnessFunction.m
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------

%% Binary Particle Swarm Optimization 
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
N=10; T=100; c1=2; c2=2; Vmax=6; Wmax=0.9; Wmin=0.4; 
% Binary Particle Swarm Optimization 
[sFeat,Sf,Nf,curve]=jBPSO(feat,label,N,T,c1,c2,Wmax,Wmin,Vmax); 
% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of Iterations');
ylabel('Fitness Value'); title('BPSO'); grid on;






