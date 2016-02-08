clear all
C = 2.7712;k = 4.7716e-4;T0 = 20;
%eq1 = exp(C-k*x) + T0 eq = 
t_ = 3600;
t = 0:0.1:5*t_;

%y=x.*(x>=0 & x<1)+2*x.*(x>=1 & x<=2);

T_bath = (exp(C-k*(t - 0*t_)) + T0).*(t>=0*t_ & t< 1*t_) + (exp(C-k*(t - 1*t_)) + T0).*(t>=1*t_ & t< 2*t_) + (exp(C-k*(t - 2*t_)) + T0).*(t>=2*t_ & t< 3*t_) + (exp(C-k*(t - 3*t_)) + T0).*(t>=3*t_ & t< 4*t_) + (exp(C-k*(t - 4*t_)) + T0).*(t>=4*t_ & t< 5*t_);
plot(t,T_bath);
xlabel('t/s');
ylabel('T/¡æ');