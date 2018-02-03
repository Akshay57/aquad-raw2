    
pause(2);
for i = 1:position_g.Length
    B =20; %setting boundaries for robot motion
    plot3([B B -1*B -1*B B B B -1*B -1*B B],[B -1*B -1*B B B B -1*B -1*B B B],[B B B B B -1*B -1*B -1*B -1*B -1*B]) 
    hold on; 
    plot3([-1*B -1*B],[-1*B -1*B],[B -1*B])
    hold on;
    % setting robot body dimensions
    centre = [position_g.Data(i,1);position_g.Data(i,2);position_g.Data(i,3)]; 
    a =2; %side lenght og robot
    p1_b = [centre(1)+a;centre(2)+a;centre(3)];
    p2_b = [centre(1)+a;centre(2)-a;centre(3)];
    p3_b = [centre(1)-a;centre(2)-a;centre(3)];
    p4_b = [centre(1)-a;centre(2)+a;centre(3)]; 
    % setting rotational jacobian J = R(si)R(theta)R(phi) 
    c_p=cos(position_g.Data(i,4));
    c_t=cos(position_g.Data(i,5));
    c_s=cos(position_g.Data(i,6));
    s_p=sin(position_g.Data(i,4));
    s_t=sin(position_g.Data(i,5));
    s_s=sin(position_g.Data(i,6));
   
    J1=[c_s*c_t    -s_s*c_p+s_p*s_t*c_s     s_s*s_p+s_t*c_s*c_p;
        s_s*c_t     c_s*c_p+s_p*s_t*s_s    -c_s*s_p+s_t*s_s*c_p;
         -s_t            s_p*c_t                 c_p*c_t       ];
    p1 = J1*p1_b;
    p2 = J1*p2_b;
    p3 = J1*p3_b;
    p4 = J1*p4_b;
    %plotting robot after coordinate transformation
    polygonx = [p1(1) p2(1) p3(1) p4(1) p1(1)];
    polygony = [p1(2) p2(2) p3(2) p4(2) p1(2)];
    polygonz = [p1(3) p2(3) p3(3) p4(3) p1(3)];
    plot3(polygonx,polygony,polygonz','-*');
    C = [1.0000 0.000 1.000];
    fill3(polygonx,polygony,polygonz,C);
    hold off;
    pause(0.1);
end

     