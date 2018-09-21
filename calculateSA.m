function newSAModel = calculateSA(model)
    %% this function is implementation of the Simulated Annealing Algorithm
    % searching the global optimum value 
    % return the global optimum and it's position value (x,y)
   
    % Initialization
    newSAModel.position = model.start.position; %define start position
    newSAModel.minValue = model.req.function(newSAModel.position(1),newSAModel.position(2)); %calculate the result 
    
    currentMinValue = newSAModel.minValue;
    currentPosition = newSAModel.position;
    T = model.start.temperature;
    
    while (T > model.set.stopTemp)
       acceptEnergy = 0;
       failedEnergy = 0;
       
       % T scheduling
       while (acceptEnergy < model.set.maxAcceptTemp) || (failedEnergy < model.set.maxFailedTemp)
           newPosition = randomize(currentPosition, model);
           newMinValue = model.req.function(newPosition(1),newPosition(2));
           
           if(newMinValue < currentMinValue)
               % newMinValue is better, so replace the old one by the new
               % one 
               currentMinValue = newMinValue;
               currentPosition = newPosition;
               acceptEnergy = acceptEnergy + 1;
           else
              % newMinValue is not better, so it is accepted conditionally
              delta = newMinValue - currentMinValue;
              p = exp(-delta/T);
              
              if (rand <= p) 
                %if random number is less than the probability 
                %accept the new one
                currentMinValue = newMinValue;
                currentPosition = newPosition;                 
              end
              
              failedEnergy = failedEnergy +1;
           end
           
           %update the best solution
           if (newMinValue < newSAModel.minValue)
               newSAModel.position = newPosition; % new position is set as best so far 
               newSAModel.minValue = newMinValue; % new value is set as best so far
           end

       end
       
       %cooldown, decrease the temperature
       T = T*model.set.coolingRate;
       
    end
    

end