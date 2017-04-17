
FitnessFunction = @simple_fitness;
numberOfVariables = 1;
functiontolerance = 1e-6;

%default : Maxgeneration:100; MaxStallgeneration: 50; Maxtime: infinity;
%FunctionTolerance: 1e-6

% test different function tolerance(functiontolerance:1e-6, 2* 1e-6, 3*1e-6 )
while functiontolerance <= 3*1e-6
    k = 1;
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    ...'ConstraintTolerance',1e-3, ...
    'FunctionTolerance', functiontolerance,...
    'MaxGenerations', 100,...
    'MaxStallGenerations',50);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with function tolerance = ' num2str(functiontolerance)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    k = k+ 1;
    functiontolerance = functiontolerance + (k-1) * 1e-6;
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
end

