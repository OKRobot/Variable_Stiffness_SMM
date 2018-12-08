% plot for minimization

clf;
hold on;

% load('p2vars.mat');

last_valid = 51;

plot(y0Vec(1:last_valid), kVec(idx_rows(1:last_valid)),'LineWidth',2);
xlabel('yi (meters)','fontsize',18);
ylabel('k(yi)','fontsize',18);
title('Stiffness as a function of yi','fontsize',21);
xlim([0.98*y0Vec(1), y0Vec(last_valid)*1.02]);

p1 = [y0Vec(3), kVec(idx_rows(3))];
p2 = [y0Vec(last_valid-11), kVec(idx_rows(last_valid-11))];

y_slope = (p2(2) - p1(2)) / (p2(1) - p1(1));
y_intercept = p2(2) - y_slope*p2(1);

line_ = y_slope*y0Vec;
line_ = line_ + y_intercept;

save('p3vars.mat','y_slope','y_intercept')

plot(y0Vec, line_,'LineWidth',2);
legend('k producing y1 = 1.05','linearization');