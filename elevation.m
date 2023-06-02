function el = elevation(ENU, el_mask)

% input: ENU, el_mask
%   ENU: 행이 시각이고 열이 E, N, U로 구성된 nx3 위성 ENU 위치 행렬, km
%        [E1, N1, U1;
%         E2, N2, U2;
%         E3, N3, U3 ...]
%   el_mask: 최소 위성 앙각, deg
%
% output: el
%   el: 1xn el 벡터, deg


fac = 180/pi;

num_data = size(ENU, 1);

for i = 1:num_data
    el(i) = asin(ENU(i,3)/norm(ENU(i,:)))*fac;

    if el(i) < el_mask
        el(i) = nan;
    end

end

end