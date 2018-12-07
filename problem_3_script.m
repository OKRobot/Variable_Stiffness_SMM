% Model Parameters
g = 9.81;
k = 20000;
m = 80;
l0 = 1;
dx0 = 5;
y0 = 1;
Esys = m*g*l0 + m/2*dx0^2;
a0 = 68 * pi/180;

% load('p3vars.mat'); % backup
y_slope = -2.4939*10^5;
y_intercept = 3.0509*10^5;

% fixed initial conditions
x0=0;
dy0=0;

% cretae Poincare map

ny0 = 51;

y0_min = l0*sin(a0) + eps;
y0_max = 1.3;
y0Vec = linspace( y0_min, y0_max, ny0);

y1Vec = NaN*y0Vec;

ground = 0.00001;


for yIdx = 1:ny0
    
    y0 = y0Vec(yIdx);
    k = y_slope*y0 + y_intercept;
    dx0 = sqrt(2/m*(Esys-m*g*y0)); % unchanged in this model
    
    sim('problem_1.slx')
    
    if ~isempty(y1)
        if dx>=0 
            if y1 > 0.5
                y1Vec(yIdx)=y1; 
            end
        end
        
    end
    
end %endfor

y1Vec_fixed = NaN*y0Vec;
k = 20000;
for yIdx = 1:ny0
    y0 = y0Vec(yIdx);
    dx0 = sqrt(2/m*(Esys-m*g*y0));
    
    sim('problem_1.slx')
    
    if ~isempty(y1)
        if dx>=0 
            if y1 > 0.5
                y1Vec_fixed(yIdx)=y1; 
            end
        end
        
    end
    
end