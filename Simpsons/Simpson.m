function I = Simpson(x,y)
%Simpsons 1/3 Rule 
%Created by: Jacob Schlagel
%Created on: April 6 2018
%MECH105
%Input an array of evenly spaced x values and an array of their corresponding y values. 
%Simpson will find the numerical integral of the inputted data. If there
%are not an even number of intervals, the trapezoidal rule will be applied.
%   Inputs
%       x=array of x values
%       y=array of y values
%   Outputs
%       I=Integral

%Record the length of inputted matrices.
n=length(x);
m=length(y);
if m~=n
    error('Matrix sizes do not match')
end


%Determine if matrix x is evenly spaced.
spacing=diff(x);
if all(spacing~=spacing(1))
    error('x array values must have equal spacing')    
end


%Determine if there are an odd or even number of segments.
Intervals=n-1;
Test=mod(Intervals,2);


%Find the segment of the Simpsons 1/3 equation that gets multiplied by 4.
Oddvalues=2:2:(n-1);
Odds=4*sum(y(Oddvalues));


%Find the segment of the Simpsons 1/3 equation that gets multiplied by 2.
Evenvalues=3:2:(n-2);
Evens=2*sum(y(Evenvalues));


%If there are an even number of segments, use only Simpsons 1/3.
if Test == 0
    I=((x(n)-x(1)))*((y(1)+Odds+Evens+y(n))/((n-1)*3));
else 
    %If there are an odd number of segments, use the trapezoidal rule as
    %well.
    warning('The Trapezoidal Rule was used')

    I1=((x(n-1)-x(1)))*((y(1)+Odds+Evens+y(n-1))/((n-2)*3)); %Simspons 1/3
    I2=((y(n)+y(n-1))/2)*(x(n)-x(n-1)); %Trapezoid Rule
    I=I1+I2;
end
end

