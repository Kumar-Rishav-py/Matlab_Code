clc
clear all
close all

field = rand(1000,1000);
bx = 500;
by = 500;
dis = 400;

hold on
scatter(bx, by, 'ro', 'filled'); 
x = randi([0, 1000], 1, 20);
y = randi([0, 1000], 1, 20);

d = sqrt((bx - x).^2 + (by - y).^2); 

far = d > dis;
near = d <= dis;

scatter(x(far), y(far), 'bo', 'filled');
scatter(x(near), y(near), 'go', 'filled'); 
legend('tower', 'far field', 'near field') 
hold off
pt = 40;
c = 3e8;
f = 9e8;
lambda = c / f;

pr = (pt * lambda^2) ./ (4 * pi * d).^2;

pr_db = 10 * log10(pr); 

disp('Received Power (dB):');
disp(pr_db);
hold on;
scatter(x, y, 100, pr_db, 'filled');
colorbar
