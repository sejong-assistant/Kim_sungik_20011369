function az = azimuth(ENU)

% input: ENU
%   ENU: 행이 시각이고 열이 E, N, U로 구성된 nx3 위성 ENU 위치 행렬, km
%        [E1, N1, U1;
%         E2, N2, U2;
%         E3, N3, U3 ...]
%
% output: az
%   az: 1xn az 벡터, deg

fac = 180/pi;

num_data = size(ENU,1);

for i = 1:num_data

    az(i) = atan2(ENU(i,1), ENU(i,2));

    if az(i) < 0
        az(i) = az(i) + 2*pi;
    end

    az(i) = az(i)*fac;
end

end



