function ecef = sat_nav_pos(nav, t, sys)

% input: nav, epoch, prn
%   nav: GPS, BDS, QZSS 각 위성의 궤도 파라미터가 포함된 구조체 변수
%   t: 위치를 구하고자 하는 시점, [YYYY, MM, DD, hh, mm, ss]
%   sys: 위치를 구하고자 하는 위성 시스템
%        'GPS'
%        'BDS'
%        'QZSS'
%
% output: ecef
%   ecef: ECEF 상에서 표현된 위성의 위치 및 속도 벡터, [x, y, z, vx, vy, vz]', (km, km, km, km/s, km/s, km/s)



orbit = get_orbit_element_at_t(nav, t, sys);

ECI = kepler_6_para2eci(orbit);

ecef = ECI2ECEF_(ECI, t);





end











