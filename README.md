# Binary Particle Swarm Optimization for Feature Selection

[![View Binary Particle Swarm Optimization for Feature Selection on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/71470-binary-particle-swarm-optimization-for-feature-selection)
[![License](https://img.shields.io/badge/license-BSD_3-yellow.svg)](https://github.com/JingweiToo/Binary-Particle-Swarm-Optimization-for-Feature-Selection/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/badge/release-1.3-green.svg)](https://github.com/JingweiToo/Binary-Particle-Swarm-Optimization-for-Feature-Selection)

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/2fa023c1-a960-4a76-a5b2-97e934432bc7/050df323-5c85-4a6b-a5e1-f5ea32858dfa/images/screenshot.PNG)


## Introduction
* Simple binary particle swarm optimization ( BPSO ) for feature selection tasks, which can select the potential features to improve the classification accuracy
* The `Main` file demos an example on how to use BPSO with classification error rate ( computed by KNN ) as the fitness function for feature selection problem using benchmark data-set


## Input
* *`feat`*     : feature vector ( Instances *x* Features )
* *`label`*    : label vector ( Instances *x* 1 )
* *`N`*        : number of particles
* *`max_Iter`* : maximum number of iterations
* *`c1`*       : cognitive factor
* *`c2`*       : social factor


## Output
* *`sFeat`*    : selected features
* *`Sf`*       : selected feature index
* *`Nf`*       : number of selected features
* *`curve`*    : convergence curve


### Example
```code
% Benchmark data set 
load ionosphere.mat;

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho);

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
```


## Requirement
* MATLAB 2014 or above
* Statistics and Machine Learning Toolbox


## Cite As
```code
@article{too2019new,
  title={A new co-evolution binary particle swarm optimization with multiple inertia weight strategy for feature selection},
  author={Too, Jingwei and Abdullah, Abdul Rahim and Mohd Saad, Norhashimah},
  journal={Informatics},
  volume={6},
  number={2},
  pages={21},
  year={2019},
  publisher={Multidisciplinary Digital Publishing Institute}
}


@article{too2019emg,
  title={EMG feature selection and classification using a Pbest-guide binary particle swarm optimization},
  author={Too, Jingwei and Abdullah, Abdul Rahim and Mohd Saad, Norhashimah and Tee, Weihown},
  journal={Computation},
  volume={7},
  number={1},
  pages={12},
  year={2019},
  publisher={Multidisciplinary Digital Publishing Institute}
}
```

