% plot for minimization

clf;
hold on;

load('p2vars.mat')

last_valid = 26;

plot(y0Vec(idx_rows(1:last_valid)), kVec(1:last_valid),'LineWidth',2);
xlabel('yi (meters)','fontsize',18);
ylabel('k(yi)','fontsize',18);
title('Stiffness as a function of yi','fontsize',21);
xlim([0.98*y0Vec(idx_rows(last_valid)), y0Vec(idx_rows(1))*1.02]);

p1 = [y0Vec(idx_rows(4)), kVec(4)];
p2 = [y0Vec(idx_rows(last_valid-2)), kVec(last_valid-2)];

y_slope = (p2(2) - p1(2)) / (p2(1) - p1(1));
y_intercept = p2(2) - y_slope*p2(1);

line_ = y_slope*y0Vec;
line_ = line_ + y_intercept;

save('p3vars.mat','y_slope','y_intercept')

plot(y0Vec, line_,'LineWidth',2);