
FitnessFunction = @simple_fitness;
numberOfVariables = 1;
stallgenerations =10;

%default : Maxgeneration:100; MaxStallgeneration: 50; Maxtime: infinity;
%FunctionTolerance: 1e-6

% test different stallgenerations(stallgeneration: 10,30,50)
while stallgenerations <= 50
    options = optimoptions(@ga,...
    'display','off', ...
    ... 'PlotFcn',@gaplotbestf, ...
    ...'CrossoverFraction',cross,...
    ...'MutationFcn',{@mutationadaptfeasible,1,mut},...
    'FunctionTolerance', 1e-6,...
    'MaxGenerations', 100,...
    'MaxStallGenerations',stallgenerations);
    ... 'PopulationSize', 50
    ... );
    ... IntCon = [1];
    szStr=['Performance for Genetic Algorithm with Max Stallgenerations = ' num2str(stallgenerations)];
    tic
        disp(szStr);
        [x,fval,exitflag,output] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],1, options);
    toc
    stallgenerations = stallgenerations + 20;
    disp(output);
    disp(['Max found x = ' num2str(x)]);
    disp(['Max found f_max = ' num2str(-fval)]);
    disp('-------------------------------------------------');
end
