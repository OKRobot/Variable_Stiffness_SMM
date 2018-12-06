% Model Parameters
g = 9.81;
k = 20000;
m = 80;
l0 = 1;
Esys = m*g*1 + m/2*5^2;
a0 = 68 * pi/180;

% fixed initial conditions
x0=0;
dy0=0;

% cretae Poincare map

ny0 = 20;

y0Vec = linspace( l0*sin(a0), 1.4, ny0);
y1Vec = NaN*y0Vec;

y0 = 1.1;
dx0 = sqrt(2/m*(Esys-m*g*y0));

ground = 0.00001;

return

for yIdx = 1:ny0
    
    y0 = y0Vec(yIdx)
    dx0 = sqrt(2/m*(Esys-m*g*y0));
    
    sim('smm')
    
    if ~isempty(y1)
        if dx>=0, y1Vec(yIdx)=y1; end
    end
    
end %endfor


