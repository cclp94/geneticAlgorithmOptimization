 function y = simple_fitness(x)
    y = (1 / 10000) * x * (x - 1023) - 5 * sin(x / 8) * cos(x / 19);

end

