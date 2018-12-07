% For plotting poincare maps


clf;
equals_line = linspace(0.96,1.4,51);
hold on;
plot_range = find(~isnan(y1Vec) == 1);
plot_range_fixed = find(~isnan(y1Vec_fixed) == 1);
plot(equals_line,equals_line);
plot(y0Vec(plot_range),y1Vec(plot_range), 'LineWidth',2,'Color','r');
plot(y0Vec(plot_range_fixed), y1Vec_fixed(plot_range_fixed),'LineWidth',2,'Color','b');
xlabel("y0 (m)");
ylabel("y1 (m)");
title("Poincare map");
% title("Poincare map of bipedal walking model with aperture: " + aperture*180/pi + " and system energy: " + Esys);
