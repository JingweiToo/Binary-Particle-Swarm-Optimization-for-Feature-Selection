%-------------------------------------------------------------------------%
%  Binary Particle Swarm Optimization (BPSO) source codes demo version    %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%                                                                         %

function [sFeat,Sf,Nf,curve]=jBPSO(feat,label,N,T,c1,c2,Wmax,Wmin,Vmax)
%---Inputs-----------------------------------------------------------------
% feat:  features
% label: labelling
% N:     Number of particles
% T:     Maximum number of iterations
% c1:    Cognitive factor
% c2:    Social factor
% Vmax:  Maximum velocity
% Wmax:  Maximum bound on inertia weight
% Wmin:  Minimum bound on inertia weight
%---Outputs----------------------------------------------------------------
% sFeat: Selected features
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------


fun=@jFitnessFunction; 
D=size(feat,2); X=zeros(N,D); V=zeros(N,D); 
for i=1:N
  for d=1:D
    if rand() > 0.5
      X(i,d)=1;
    end
  end
end
fit=zeros(1,N); fitG=inf;
for i=1:N
  fit(i)=fun(feat,label,X(i,:));
  if fit(i) < fitG
    Xgb=X(i,:); fitG=fit(i);
  end
end
Xpb=X; fitP=fit; 
% Pre
curve=inf; t=1; 
figure(1); clf; axis([1 100 0 0.2]); xlabel('Number of Iterations');
ylabel('Fitness Value'); title('Convergence Curve'); grid on;
%---Iterations start-------------------------------------------------------
while t <= T
  w=Wmax-(Wmax-Wmin)*(t/T);
  for i=1:N
    for d=1:D
      r1=rand(); r2=rand();
      VB=V(i,d)*w+c1*r1*(Xpb(i,d)-X(i,d))+c2*r2*(Xgb(d)-X(i,d)); 
      VB(VB > Vmax)=Vmax; VB(VB < -Vmax)=-Vmax; V(i,d)=VB; 
      TF=1/(1+exp(-V(i,d)));
      if TF > rand()
        X(i,d)=1;
      else
        X(i,d)=0;
      end
    end
    fit(i)=fun(feat,label,X(i,:));
    if fit(i) < fitP(i)
      Xpb(i,:)=X(i,:); fitP(i)=fit(i);
    end
    if fitP(i) < fitG
      Xgb=Xpb(i,:); fitG=fitP(i);
    end
  end
  curve(t)=fitG; 
  pause(1e-20); hold on;
  CG=plot(t,fitG,'Color','r','Marker','.'); set(CG,'MarkerSize',5);
  t=t+1;
end
Pos=1:D; Sf=Pos(Xgb==1); Nf=length(Sf); sFeat=feat(:,Sf); 
end



