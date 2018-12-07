% For plotting results of distance_x

clf;
hold on;

plot_range = find(~isnan(distance_vec) == 1);
plot_range_timed = find(~isnan(distance_vec_timed) == 1);
% plot_range_timed_69 = find(~isnan(distance_vec_timed_69) == 1);

plot(ground_height_vec(plot_range), distance_vec(plot_range), 'Marker', 'x','MarkerSize',10);
plot(ground_height_vec(plot_range), distance_vec_timed(plot_range_timed), 'Marker', 'o','MarkerSize',10);
% plot(ground_height_vec(plot_range), distance_vec_timed_69(plot_range_timed_69), 'Marker', 's');


% title("Distance to fall for varying ground heights for attack = " + attack * 180/pi);
% title("Distance to fall for varying ground heights for aperture = " + aperture * 180/pi);
title("Distance travelled versus ground height noise",'fontsize',18);
xlabel("Ground height varies from [-x, x/5]",'fontsize',15);
ylabel("Distance reached",'fontsize',15)
legend('Fixed attack = 68', 'Stiffness varies with time');
