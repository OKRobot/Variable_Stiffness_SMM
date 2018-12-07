% Poincare map for angle of attack in stable walker

rng(1);

% Model Parameters
g = 9.81;
k = 20000;
m = 80;
L = 1;

% model = "smm_two_legs_distance";
% model = "smm_two_legs_aperture_distance";
model = "smm_two_legs_timed_distance";

% angle of attack
% attack = 75 * pi / 180;
attack = 72 * pi / 180;

aperture = 45 * pi / 180;

% parameters that determine Esys
l0 = 0.9937;
% dx0 = 1.0; % low energy
dx0 = 1.123; % Start at 1.123 m/s
% dx0 = 1.3; % high energy

y0 = l0;
a01 = 90 * pi / 180;
a02 = attack;
% Esys relative to ground
Esys = m*g*l0 + (1/2)*k*(L-l0)^2 + (1/2)*m*(dx0^2);

% Make sure dynamics and mechanics are consistent
assert(k*(L-l0) < m*g, "Leg must fall from peak");
assert(L*sin(attack) < l0, "Second leg must be off ground at beginning");

% fixed initial conditions
x0=0;
dy0=0;
ground = 0.00001;

% Can't be lower than the length of the leg
ymax = L;
% Bounded by leg falling from peak or second leg being off ground
ymin = max(L-(m*g/k), L*sin(attack)); 

% create Poincare map
nH0 = 51;
ground_max = 0.03;
ground_height_vec = linspace(0.00001,ground_max,nH0);

if model == "smm_two_legs_distance"
    distance_vec = NaN*ground_height_vec;
elseif model == "smm_two_legs_aperture_distance"
    distance_vec_aperture = NaN*ground_height_vec;
else
    distance_vec_timed = NaN*ground_height_vec;
end


for hIdx = 1:nH0
    
    ground_height = ground_height_vec(hIdx);
    ground_pos = 0.2*ground_height;
    ground_neg = ground_height;
    
    sim(model)
     
%     if(running)
% %         disp(running);
%         continue
%     end
    
   if ~isempty(x_com)
%         if dx_com>=0
            if model == "smm_two_legs_distance"
                distance_vec(hIdx)=x_com; 
            elseif model == "smm_two_legs_aperture_distance"
                distance_vec_aperture(hIdx) = x_com;
            else
                distance_vec_timed(hIdx) = x_com;
            end
%         end
    end
    
end %endfor



