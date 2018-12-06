% Plot k versus y1

load('p1vars.mat');

clf;
hold on;
plot(kVec,y1Vec,'LineWidth',2);
xlabel('Stiffness(netwons per meter)','fontsize',18);
ylabel('Apex height (meters)','fontsize',18);
title('Stiffness versus apex height','fontsize',21);