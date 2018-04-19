userootfunction [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition: Locate roots
%   [root,fx,ea,iter]=falsePosition(func,xl,xu,es,iter)
%   finds an estimate of a root for an inputed function.
%   The funtion will run to the desired accuracy (es).
%   xl and xu are connected by asecant line, and wherever that secant line crosses the x axis is the new
%   root estimate and replaces either xl or xu. 
%   Then the function will run again with the root estimation as one of the bounds/brackets.
%   Run this function until it is as accurate as desired.
%   Inputs
%       func=the function being evaluated
%       xl=the lower bound
%       xu=the upper bound
%       es=desired relative error
%       iter=desired number of iterations
%   Outputs
%       root=the estimated root location
%       fx=the function evaluated at the root location
%       ea=the approximate relative error
%       iter=how many iterations were performed
%Created by:Jacob Schlagel
%Created on February 19 2018
%MECH105
if nargin<3 %If the user does not put enough inputs, they will have to try again.
    error('Not enough inputs')
end
if nargin<4 % If user only puts 3 inputs, automatically assign es and maxiter.
    es=0.0001;
    maxiter=200;
end
if nargin<5 % If user only inputs 4 arguments, automatically assign maxiter.
    maxiter=200;
end
iter=0; %The following 3 lines provide starting values for variables.
ea=100;
xr=xl;
while (1) %Indicates the loop will run until terminated.
    oldxr=xr; % Assigns the old root so the error can be found later.
    xr=xu-(double((func(xu))*(xl-xu))/double((func(xl))-double(func(xu))));%Calculates the new root.
    iter=iter+1; %Adds a count on the iterations.
    if xr ~= 0 %As long as the estimated root is not zero, the function will evaluate the approximated error.
      ea = abs((xr - oldxr)/xr) * 100;
    end
    testfornewinterval = func(xl) * func(xr); %This line finds which brackets to use for the next root.
    if testfornewinterval < 0 %If the test comes back negative, the root just calculated will be assigned as the new upper bound.
        xu = xr;
    elseif testfornewinterval > 0
        xl = xr; %If the test is positive, the root just calculated will be assigned as the new lower bound.
    else
        ea = 0; %If the test is zero, then the estimated error is zero because the root has been calculated.
    end
    if ea <= es || iter >= maxiter %If the estimated error is less than the desired error or the iterations exceeds the maxiter, the while loop will end.
      break
    end
end
root = xr %The final root that was calculated from the function 
fx = double(func(xr)) %The value of the inputed function at the final root value.
howmanytimes=iter %How many iterations the loop went through.

