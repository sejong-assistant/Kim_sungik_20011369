function out = cross_pro(v1, v2)

% input: 열벡터 또는 행벡터
% output: 열벡터


if size(v1,1) == 1
    v1 = v1';
end

if size(v2,1) == 1
    v2 = v2';
end



vec2mat = [...
    0, -v1(3), v1(2);...
    v1(3), 0, -v1(1);...
    -v1(2), v1(1), 0;...
    ];



out = vec2mat*v2;
