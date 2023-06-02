function ecef = ECI2ECEF_(eci, t)

% input: eci, t
%   eci: t에서의 위성의 eci 위치 및 속도 열벡터, [x, y, z, vx, vy, vz]', (km, km, km, km/s, km/s, km/s)
%   t: 위치를 구하고자 하는 시점, [YYYY, MM, DD, hh, mm, ss]
%
% output: ecef
%   ecef: t에서의 위성의 ecef 위치 및 속도 열벡터, [x, y, z, vx, vy, vz]', (km, km, km, km/s, km/s, km/s)

omega_e = 7.2921151467e-5; % rad/s


w_ie = [0 0 omega_e]';

DCM = eci2ecef_DCM(t);


pos = eci(1:3);
vel = eci(4:6);


pos = DCM*pos;
vel = DCM*( vel - DCM'*cross_pro(w_ie, pos) );



ecef = [pos; vel];

end






