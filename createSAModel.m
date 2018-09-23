function SA = createSAModel()
%% Make SA Model 
% return these param

% requirement of the model (variable, limits, and function)
SA.req.variables = {'x', 'y'}; %assuming that x,y are x1 and x2
SA.req.limits = {[-10; 10], [-10; 10]}; %limits
SA.req.function = @(x,y) -abs(sin(x)*cos(y)*exp(abs(1-(sqrt(x^2+y^2 ))/pi))); %function that need to test

% settings of the model
SA.set.coolingRate = 0.99; % cooling rate is the dumping temperature (for the decreases of temp)
SA.set.maxAcceptTemp = 5; % maximum number iterations on same temperature with accept condition  
SA.set.maxFailedTemp = 10; % maximum number iteration on same temperature with failed condition
SA.set.stopTemp = 0.1; % condition of end iteration

% initial start of the model
SA.start.temperature = 1000;
SA.start.position = [0, 0];
    
[x, y] = meshgrid(-10:0.25:10);
surf(x,y, SA.req.function(x,y), 'FaceColor', 'interp', 'EdgeColor','none');

end