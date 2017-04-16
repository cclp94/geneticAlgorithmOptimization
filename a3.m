FitnessFunction = @simple_fitness;
numberOfVariables = 1;
cross = 0;
mut = 1;
while cross <= 1
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    'CrossoverFraction',cross,...
    'MutationFcn',{@mutationadaptfeasible,1,mut},...
    'FunctionTolerance', 0);
    ... 'MaxGenerations', 20, ...
    ... 'MaxStallGenerations',20, ...
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with cross = ' num2str(cross) ' and Mutation = ' num2str(mut)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[], options);
    toc
    cross = cross + 0.1;
    mut = mut - 0.1;
    disp(output);
    disp('-------------------------------------------------');
end