function random = intervalRand(a, b)
    %% random interval
    % a is the upper limit
    % b is the lower limit
    random = a + (b-a).*rand(1,1);
    
end