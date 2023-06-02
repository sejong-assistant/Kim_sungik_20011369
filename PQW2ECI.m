
function DCM = PQW2ECI(I, R, W)
% input: i, RAAN, w
%   i: 경사각, deg
%   RAAN: Right Ascension of Ascending Node, deg
%   w: argument of perigee, deg
%
% output: DCM
%   DCM: 궤도평면 -> ECI 좌표계 변환 행렬 3x3

fac = pi/180;

i = I*fac;
RAAN = R*fac;
w = W*fac;



DCM = [cos(RAAN)*cos(w)-sin(RAAN)*cos(i)*sin(w), -cos(RAAN)*sin(w)-sin(RAAN)*cos(i)*cos(w), sin(RAAN)*sin(i);...
    sin(RAAN)*cos(w)+cos(RAAN)*cos(i)*sin(w), -sin(RAAN)*sin(w)+cos(RAAN)*cos(i)*cos(w), -cos(RAAN)*sin(i);...
    sin(i)*sin(w), sin(i)*cos(w), cos(i)];

end