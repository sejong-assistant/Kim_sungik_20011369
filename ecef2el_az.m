function EL_AZ = ecef2el_az(ecef_pos, station, el_mask)

% input: ecef_pos, station, el_mask
%   ecef_pos: 행이 시각이고 열이 x, y, z로 구성된 nx3 위성 ecef 위치 행렬, km
%             [x1, y1, z1;
%              x2, y2, z2;
%              x3, y3, z3 ...]
%   station: 위성을 관측하는 지상 기준국의 geodetic 위치, [lat, lon, h], (deg, deg, km)
%   el_mask: 최소 위성 앙각
%
% output: EL_AZ
%   EL_AZ: 행이 시각이고 열이 el, az로 구성된 nx2 행렬, (deg, deg)
%          [el1, az1;
%           el2, az2;
%           el3, az3  ...]



wgs84 = wgs84Ellipsoid('kilometer');

[E, N, U] = ecef2enu(ecef_pos(:,1), ecef_pos(:,2), ecef_pos(:,3), station(1), station(2), station(3), wgs84);

ENU = [E, N, U];

az = azimuth(ENU);
el = elevation(ENU, el_mask);

az(isnan(el)) = [];
el(isnan(el)) = [];

if isempty(el)
    az = nan;
    el = nan;
end

EL_AZ = [el', az'];

end







