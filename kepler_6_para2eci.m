function ic = kepler_6_para2eci(orbit)

% input: orbit
%   orbit: keplerian 6 parameter 열벡터, [a, e, i, RAAN, w, nu]', (km, non, deg, deg, deg, deg)
%
% output: ic
%   ic: ECI 좌표계에서 표현된 위성 위치 및 속도 열벡터, [x, y, z, vx, vy, vz]', (km, km, km, km/s, km/s, km/s)

a = orbit(1);
e = orbit(2);
i = orbit(3);
RAAN = orbit(4);
w = orbit(5);
nu = orbit(6);


DCM = PQW2ECI(i, RAAN, w);


r_o = solveRangeInPerifocalFrame(a, e, nu);

v_o = solveVelocityInPerifocalFrame(a, e, nu);


r_ic = DCM*r_o;
v_ic = DCM*v_o;



ic = [r_ic; v_ic];


end











