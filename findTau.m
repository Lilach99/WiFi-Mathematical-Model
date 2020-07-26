% % estimate tau according to the equation in the article - intersection of 2
% % functions - here we assume n=2, so that p = tau
% 
% x = 0:0.01:1; % range for optional tau - it's a probability
% f = 2*(1-2*x);
% g = 16*x.*(1-2*x) + 15*(x.^2).*(1-(2.*x).^6);
% plot(x, f, x, g);
% a = find(f==g);
% tau = x(a);


% find tau according to a WiLD modeling thesis
% s <= backoff stage
% TX <= tranmission happens
% p = tau <= 2 stations
R = 14;                                      % number of retries
i = 0:1:R;                                   % retry values
CWmin = 15;
W = CWmin + 1;
backoff_stages = 0:1:6;
beta_i = [(2.^backoff_stages * W - ones(1, 7))/2, ones(1, 8)*(2^6*W-1)/2];
% now find the intersection:
p = 0:0.01:0.99;
unit_vector = ones(size(p));
f = ones(size(p)) ./ (1 + (1-p)./(unit_vector-p.^(R+1)) + transpose(power(p(:), i) * transpose(beta_i)));
g = p;
plot(p, f, p, g);
a = find(f == g);
tau = p(a);

