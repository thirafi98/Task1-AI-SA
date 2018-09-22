function newXY = randomize( XY , model)
    %% this function is to random the value of the XY but just one variable which changed
    % XY is the array of [ x , y]or [ x1, x2 ]
    % this function use the limit from the model and step modifier
    % the choose of x or y according the randi that return 1 or 2
     newXY = XY;
    % create random value 1 or 2 
     idx = randi(length(XY),1,1); 
     limits = model.req.limits{idx};
    %generate random value for the interval        
     x(idx) = XY(idx) + intervalRand(limits(1), limits(2));

    % fit to the limits
    % first take minimum value between the new random value and
    % upper limit, then take maximum between the new value and
    % lower limit:
     newXY(idx) = max(min(x(idx), limits(2)), limits(1)); 
    
end




