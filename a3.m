tData = 0:1:1023;
vData = (1 / 10000) .* x .* (x - 1023) + 5 .* sin(x / 8) .* cos(x / 19);

FitnessFunction = @simple_fitness;
numberOfVariables = 1;
options = optimoptions(@ga,'display','off');
[x,fval] = ga(FitnessFunction,numberOfVariables,[],[],[],[],0,1023,[],options);
disp(x);
disp(fval);