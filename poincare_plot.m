% For plotting poincare maps


clf;
equals_line = linspace(0.96,1.4,51);
hold on;
plot_range = find(~isnan(y1Vec3) == 1);
plot_range_fixed = find(~isnan(y1Vec_fixed) == 1);
plot(equals_line,equals_line,'Color','g');
plot(y0Vec3(plot_range),y1Vec3(plot_range), 'LineWidth',2,'Color','r');
plot(y0Vec3(plot_range_fixed), y1Vec_fixed(plot_range_fixed),'LineWidth',2,'Color','b');
xlabel("y0 (m)",'fontsize',16);
ylabel("y1 (m)",'fontsize',16);
title("Poincare maps with varying" + newline + "and fixed stiffness",'fontsize',18);
legend('y=x','Adaptive k','Fixed k');
% title("Poincare map of bipedal walking model with aperture: " + aperture*180/pi + " and system energy: " + Esys);
