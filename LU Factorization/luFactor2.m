%% Homework 16
% Jacob Schlagel
function [L,U,P] = luFactor2(A)
%This function factors a square matrix. 
%   Input a square matrix and recieve a factored matrix as long with the
%   pivot matrix.
%Input
%   A=square matrix
%Outputs
%   L=Lower triangle matrix
%   U=Upper triangle matrix
%   P=Pivot matrix
[m,n]=size(A);
if m~=n
    error('Matrix must have square dimensions')
end
if nargin~=1
    error('Only enter 1 input')
end
P=eye(m); %The next three lines set initial variables for each matrix.
U=A;
L=eye(m);
for it=1:(n-1)
    column=U(it:m,it);
    [~,I]=max(abs(column)); %Finds the maximum value in the first column.    
    
    if I~=1 %If the maximum value is not in the top corner, the matrix has to be pivotted.
        
        U = swap(U,it,I+it-1);

        P = swap(P,it,I+it-1);
        
        if it >= 2
        L2=L;
        L(I+it-1,1:(it-1))=L2(it,1:(it-1));
        L(it,1:(it-1))=L2(I+it-1,1:(it-1));
        end
    end
    
    for g=(it+1):m
        L1=(U(g,it))/(U(it,it));
        manrow=L1*U(it,:);
        U(g,:)=U(g,:)- manrow;
        L(g,it)=L1;
    end 
    
end
end
function [Unew] = swap(A,r1,r2)
Unew=A;
Unew(r1,:)=A(r2,:);
Unew(r2,:)=A(r1,:);
end





