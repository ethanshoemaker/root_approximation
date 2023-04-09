clear
clc
close all

f=@(x) exp(x)*5*x^2; %original function
f1=@(x) exp(x)*10*x+exp(x)*5*x^2; %first derivative

p0 = 5; %initial p value

t = 10^(-5); %acceptable tolerance

p = p0-(f(p0)/f1(p0)); %p1

N=100;
error = [];

for i = 1:N;
    if abs(p-p0) < t;
        error = [error abs(p-p0)];
        break
    elseif abs(p-p0) > t;
        error = [error abs(p-p0)];
        p0 = p;
        p = p0-(f(p0)/f1(p0));
    end
end

if i == N;
    fprintf('Failed to find a solution after %d iterations. Consider trying a new starting point, p0',N)
else
    fprintf('Solution is %f and converges in %d iterations', p, i-1)
    iteration = 0:1:length(error)-1;
    figure();
    plot(iteration,error)
    title('Absolute Value of Error vs # of Iterations')
    xlabel('Iteration')
    ylabel('|error|')
end