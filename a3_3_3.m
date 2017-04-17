
FitnessFunction = @simple_fitness;
numberOfVariables = 1;
max_time = 0.5;
%default : Maxgeneration:100; MaxStallgeneration: 50; Maxtime: infinity;
%FunctionTolerance: 1e-6

% test different max_time(max_time: 0.1,0.5,0.9)
%while max_time <= 2.5
    options = optimoptions(@ga,...
    'display','iter', ...
    ...'PlotFcn',@gaplotbestf, ...
    'PlotFcn',@gaplotrange,...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    ...'ConstraintTolerance',1e-3, ...
    ...'MaxTime',max_time,...
    'FunctionTolerance', 1e-6,...
    'MaxGenerations', 100,...
    'MaxStallGenerations',50);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with Max time = ' num2str(max_time)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
   % max_time = max_time + 1;
    disp(output);
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
%end



