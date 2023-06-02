function DCM = eci2ecef_DCM(t)

% input: t
%   t: 위치를 구하고자 하는 시점, [YYYY, MM, DD, hh, mm, ss]
%
% output: DCM
%   DCM: eci에서 ecef로 변환 하는 행렬

fac = pi/180;

leapsecond = 18;

UTC = datetime(t) - seconds(leapsecond);

jd = juliandate(UTC);

GMST = siderealTime(jd)*fac;

DCM = [cos(GMST), sin(GMST), 0;
    -sin(GMST), cos(GMST), 0;
    0 ,0 ,1];


end