function [sFeat,Sf,Nf,curve] = jBPSO(feat,label,N,max_Iter,c1,c2,HO)
Wmax = 0.9;
Wmin = 0.4; 
Vmax = 6;

fun = @jFitnessFunction; 
dim = size(feat,2); 
X   = zeros(N,dim);
V   = zeros(N,dim); 
for i = 1:N
  for d = 1:dim
    if rand() > 0.5
      X(i,d) = 1;
    end
  end
end
fit  = zeros(1,N); 
fitG = inf;
for i = 1:N
  fit(i) = fun(feat,label,X(i,:),HO);
  if fit(i) < fitG
    Xgb  = X(i,:);
    fitG = fit(i);
  end
end
Xpb  = X; 
fitP = fit; 

curve = inf; 
t = 1; 
%---Iterations start-------------------------------------------------
while t <= max_Iter
  w = Wmax - (Wmax - Wmin) * (t / max_Iter);
  for i = 1:N
    for d = 1:dim
      r1    = rand();
      r2    = rand();
      VB    = V(i,d) * w + c1 * r1 * (Xpb(i,d) - X(i,d)) + ...
              c2 * r2 * (Xgb(d) - X(i,d)); 
      VB(VB > Vmax) = Vmax;  VB(VB < -Vmax) = -Vmax; 
      V(i,d) = VB; 
      TF     = 1 / (1 + exp(-V(i,d)));
      if TF > rand()
        X(i,d) = 1;
      else
        X(i,d) = 0;
      end
    end
    fit(i) = fun(feat,label,X(i,:),HO);
    if fit(i) < fitP(i)
      Xpb(i,:) = X(i,:);
      fitP(i)  = fit(i);
    end
    if fitP(i) < fitG
      Xgb  = Xpb(i,:);
      fitG = fitP(i);
    end
  end
  curve(t) = fitG; 
  fprintf('\nIteration %d Best (BSPO)= %f',t,curve(t))
  t = t + 1;
end
Pos   = 1:dim;
Sf    = Pos(Xgb == 1);
Nf    = length(Sf);
sFeat = feat(:,Sf); 
end



