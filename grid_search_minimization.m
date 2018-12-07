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

% cretae Poincare map

nk = 26;

k_min = 11000;
k_max = 39000;
kVec = linspace(k_min, k_max, nk);

ny0 = 26;

y0_min = l0*sin(a0) + eps;
y0_max = 1.5;
y0Vec = linspace( y0_min, y0_max, ny0);

y1Mat = NaN*zeros(nk,nk);

TARGET_Y = 1.05;

for kIdx = 1:nk
    
    k = kVec(kIdx);
    
    for yIdx = 1:ny0

        dx0 = sqrt(2/m*(Esys-m*g*y0));
        y0 = y0Vec(yIdx);

        sim('problem_1');

        if ~isempty(y1)
            if dx>=0
                if y1 > 0.5
                    y1Mat(kIdx,yIdx)=y1; 
                end
            end
        end
    end
end

[min_col, idx_rows] = min(abs(TARGET_Y-y1Mat));
% [min_glob, idx_col] = min(min_col);
% idx_row = idx_rows(idx_col);

% For linear stiffness, minimum was found at aIdx = 11, yIdx = 12, a0 =
% 70.2632

y1K = zeros(1,ny0);
for ii = 1:ny0
    y1K(ii) = y1Vec(idx_rows(ii),ii);
end



return