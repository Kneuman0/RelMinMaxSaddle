clc
clear
clear all


disp('Kyle Neuman');
disp('Tom Shields');
disp('Math 205: Calc III');
disp('Carroll Community College');
disp('10/23/15');
disp(' ');
disp('Question 1');
fprintf('see attached graphs\n')
[x1,y1]= meshgrid(-3:1/100:3, -3:1/100:3);
functionZ = (.5 - x1.^2 + y1.^2).*exp(1 - x1.^2 - y1.^2);

% level curves graph
figure(1)
contour(x1, y1, functionZ, 12)

% 3-D graph
figure(2);
meshc(x1, y1, functionZ)

fprintf('\nQuestion 2\n');
syms x y
f = (.5 - x^2 + y^2).*exp(1 - x^2 - y^2)

% first partials
fxPrime = diff(f, x);
fyPrime = diff(f, y);

% second partials
fxDoublePrime = diff(fxPrime, x);
fyDoublePrime = diff(fyPrime, y);

% mixed partial
fxy = diff(fxPrime, y);

% first partial derivatives solved as a system of equations for x and y
disp('critcal values found for x and y')
[xVar, yVar] = solve(fxPrime, fyPrime)

% plotting critical points
[dx1, dy1] = gradient(functionZ);
figure(3)
contour(x1, y1, functionZ, 12)
hold on
plot(single(xVar), single(yVar), '*b')


% determine type of critical point and prints to console
% iterates though each cricital point and returns unique value for each
index = length(xVar);
for i = 1:index
    % numerical solution for second partial derivative of x
    fxDoublePrime1 = subs(fxDoublePrime, [x, y], [xVar(i), yVar(i)]);
    % numerical solution for second partial derivative of y
    fyDoublePrime1 = subs(fyDoublePrime, [x, y], [xVar(i), yVar(i)]);
    % mixed partial derivative
    fxyValue = subs(fxy, [x,y], [xVar(i), yVar(i)]);
    % value of z at critical point
    zValue1 = subs(f, [x, y], [xVar(i), yVar(i)]);
    % d value for (fxx*fyy)-(fxy)^2
    d = fxDoublePrime1 * fyDoublePrime1 - (fxyValue)^2;
    if d < 0
        fprintf('(%s, %s, %s) is a saddlePoint\n\n',char(xVar(i)), ...
            char(yVar(i)), char(zValue1))
    elseif fxDoublePrime1 > 0
        fprintf('(%s, %s, %s) is a relative minimum\n\n', char(xVar(i)),...
            char(yVar(i)), char(zValue1))
    elseif fxDoublePrime1 < 0
        fprintf('(%s, %s, %s) is a relative maximum\n\n', char(xVar(i)),...
            char(yVar(i)), char(zValue1))
    else
        disp('d = 0 and therefore cannot be determined\n\n');
    end
end

fprintf('\nI did it professor Shields!!!! With this code you should be\n')
fprintf('able to plug any function in for f and it will tell you the critical points')

