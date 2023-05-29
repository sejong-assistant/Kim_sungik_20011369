function v_orbit = solveVelocityInPerifocalFrame(a, e, nu)
% input: a, e, nu
%   a: 장반경, km
%   e: 이심률
%   nu: 실제 비행각, deg
%
% output: v_orbit
%   v_orbit: 궤도 평면상 위성의 속도 벡터 3x1, km/s

mu = 398600.4415;

fac = pi/180;

nu = nu*fac;

p = a*(1-e^2);

v_orbit = [-sqrt(mu/p)*sin(nu); sqrt(mu/p)*(e+cos(nu)); 0];



end