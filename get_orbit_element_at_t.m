function orbit = get_orbit_element_at_t(nav, t, sys)

% input: nav, epoch, prn
%   nav: GPS, BDS, QZSS 각 위성의 궤도 파라미터가 포함된 구조체 변수
%   t: 위치를 구하고자 하는 시점, [YYYY, MM, DD, hh, mm, ss]
%   sys: 위치를 구하고자 하는 위성 시스템
%        'GPS'
%        'BDS'
%        'QZSS'
%
% output: orbit
%   orbit: t 시점의 실제 비행각을 포함한 궤도 요소 벡터, [a, e, i, RAAN, w, nu]', (km, non, deg, deg, deg, deg)



switch sys
    case 'GPS'
        eph = nav.GPS;
    case 'BDS'
        eph = nav.BDS;
    case 'QZSS'
        eph = nav.QZSS;
end




fac = 180/(pi);

toc = eph.toc; % t_oc, [YYYY, MM, DD, hh, mm, ss]

M0 = eph.M0*fac;
e = eph.e;
a = eph.a*10^-3; %km
RAAN = eph.OMEGA*fac;
i = eph.i*fac;
w = eph.omega*fac;

nu = propagation_of_nu(a, e, t, toc, M0);

orbit = [a, e, i, RAAN, w, nu]';


end

