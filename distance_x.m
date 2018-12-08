% Poincare map for angle of attack in stable walker

rng(0);

% Model Parameters
g = 9.81;
k = 20000;
m = 80;
l0 = 1;
dx0 = 5;
y0 = 1;
Esys = m*g*l0 + m/2*dx0^2;
a0 = 68 * pi/180;

% fixed initial conditions
x0=0;
dy0=0;


% model = "problem_3_fixed";
model = "problem_3_adaptive";

% create Poincare map
nH0 = 41;
ground_max = 0.15;
ground_height_vec = linspace(0.00001,ground_max,nH0);

if model == "problem_3_fixed"
    distance_vec = NaN*ground_height_vec;
else
    distance_vec_timed = NaN*ground_height_vec;
end


for hIdx = 1:nH0
    
    ground_height = ground_height_vec(hIdx);
    ground_pos = 0.2*ground_height;
    ground_neg = ground_height;
    
    sim(model)

    
   if ~isempty(x_com)
            if model == "problem_3_fixed"
                distance_vec(hIdx)=x_com; 
            else
                distance_vec_timed(hIdx) = x_com;
            end
    end
    
end %endfor



