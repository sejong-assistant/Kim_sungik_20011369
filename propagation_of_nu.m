function nu = propagation_of_nu(a, e, t, toc, M0)

% input: a, e, t, t0, M0
%   a: 장반경, km
%   e: 이심률, non
%   t: 위치를 구하고자 하는 시점, [YYYY, MM, DD, hh, mm, ss]
%   toc: 항법 메시지 파라미터가 주어진 시각, [YYYY, MM, DD, hh, mm, ss]
%   M0: t0에서의 Mean anomaly, deg
%
% output: nu
%   nu: t에서의 실제 비행각, deg

fac = pi/180;

mu = 398600.4415;

dt = datetime(t) - datetime(toc);

[h, m, s] = hms(dt);

d_seconds = h*3600 + m*60 + s;

% propagation

n = sqrt(mu/(a^3));

M = n*d_seconds + M0*fac;
E = M;

while(1)

    E_old = E;

    E = M + e*sin(E);
    if abs(E-E_old)<=10^-9
        break
    end
end


nu = 2*atan2(tan(E/2)*sqrt(1+e),sqrt(1-e));

if nu<0
    nu = nu+2*pi;
end

nu = nu*(180/pi);

end