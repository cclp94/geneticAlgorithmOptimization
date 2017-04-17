
FitnessFunction = @simple_fitness;
numberOfVariables = 1;
generations = 190;

%default : Maxgeneration:100; MaxStallgeneration: 50; Maxtime: infinity;
%FunctionTolerance: 1e-6

% test different generations(generation: 10,100,190)
%while generations <= 190
    options = optimoptions(@ga,...
    'display','iter', ...
    ...'PlotFcn',@gaplotbestf, ...
    'PlotFcn',@gaplotrange,...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    ...'ConstraintTolerance',1e-3, ...
    'FunctionTolerance', 1e-6,...
    'MaxGenerations', generations,...
    'MaxStallGenerations',50);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with Max generations = ' num2str(generations)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    %generations = generations + 90;
    disp(output);
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
%end

