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

% create Poincare map

nk = 51;

k_min = 5000;
k_max = 55000;
kVec = linspace(k_min, k_max, nk);
y1Vec = NaN*kVec;

ground = 0.00001;


for kIdx = 1:nk
    
    k = kVec(kIdx);
    
    sim('problem_1.slx')
    
    if ~isempty(y1)
        if dx>=0 
            if y1 > 0.5
                y1Vec(kIdx)=y1; 
            end
        end
        
    end
    
end 
