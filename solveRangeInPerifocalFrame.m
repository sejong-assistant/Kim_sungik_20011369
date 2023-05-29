function r_orbit = solveRangeInPerifocalFrame(a, e, nu)
% input: a, e, nu
%   a: 장반경, km
%   e: 이심률
%   nu: 실제 비행각, deg
%
% output: r_orbit
%   r_orbit: 궤도 평면상 위성의 위치 벡터 3x1, km

fac = pi/180;

nu = nu*fac;

r = ( a*(1-e^2) )/( 1+e*cos(nu) );

r_orbit = [r*cos(nu); r*sin(nu); 0];

end