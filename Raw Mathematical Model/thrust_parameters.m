load thrust_parameters.mat

for i=1:81 
    if a(i,2)==0
        a(i,5)=0;
    else a(i,5)= a(i,3)/(a(i,2)*2*pi/60);
    end
end    

load Thrust_PWM
Thrust_vs_PWM(:,1)=Thrust_vs_PWM(:,1)*4.44822;

for j=1:81 
    if Thrust_vs_PWM(j,2)<1500
        Thrust_vs_PWM(j,3)=-Thrust_vs_PWM(j,3);
    end
end