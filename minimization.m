% Model parameters
g = 9.81;
k = 20000;
m = 80;
l0 = 1;




ey0 = 1;
edx0 = 5;
Esys = m*g*ey0 + m/2*edx0^2;

a0 = 68 * pi/180;

% Fixed initial conditions
x0=0;
dy0=0;

% Create Poincare map



ny0 = 40;
na0 = 40;

alow = 65 * pi / 180;
ahigh = 75 * pi / 180;

a0Vec = linspace(alow, ahigh, na0);
y0Vec = linspace(l0*sin(a0), Esys/(m*g),ny0);
y1Vec = NaN*zeros(na0, ny0);



% dx0 = sqrt(2/m*(Esys-m*g*y0));
for aIdx = 1:na0
    
    a0 = a0Vec(aIdx);
    for yIdx = 1:ny0-5


        y0 = y0Vec(yIdx);
        dx0 = sqrt(2/m*(Esys-m*g*y0));

        sim('problem_2a');

        if ~isempty(y1)
            if dx>=0, y1Vec(aIdx,yIdx)=y1; end
        end
    end
end

[min_col, idx_rows] = min(abs(1.05-y1Vec));
% [min_glob, idx_col] = min(min_col);
% idx_row = idx_rows(idx_col);

% For linear stiffness, minimum was found at aIdx = 11, yIdx = 12, a0 =
% 70.2632

y1Alpha = zeros(1,ny0);
for ii = 1:ny0
    y1Alpha(ii) = y1Vec(idx_rows(ii),ii);
end



return