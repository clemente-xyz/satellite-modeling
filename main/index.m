
% DEFINITION AND PLOTING OF THE EARTH:
%-----------------------------------------
load('topo.mat','topo','topomap1');

[xe,ye,ze]=sphere(); %Definition of the sphere.

r=6371; %Earth Radio

cla reset

props.AmbientStrength = 0.1;

props.DiffuseStrength = 1;

props.SpecularColorReflectance = .5;

props.SpecularExponent = 20;

props.SpecularStrength = 1;

props.FaceColor= 'texture';

props.EdgeColor = 'none';

props.FaceLighting = 'phong';

props.Cdata = topo;

surface(r*(xe),r*(ye),r*(ze),props); %Plotting of the Earth.

light('position',[-1 0 1]);

light('position',[-1.5 0.5 -0.5], 'color', [.6 .2 .2]);

%surf(r*(xe),r*(ye),r*(ze));
%-----------------------------------------

% DEFINITION AND PLOTING OF THE TANGENT PLANE:
%-----------------------------------------
syms X Y

[xp,yp]= meshgrid(-9000:1000:9000);

zp=6371^2/sqrt(38589641)-1000.*xp./sqrt(38589641)-1000.*yp./sqrt(38589641); %Plotting of the Earth.

ZPlano=inline('6371^2/sqrt(38589641)-1000*X/sqrt(38589641)-1000*Y/sqrt(38589641)');

hold on

mesh(xp,yp,zp); %Plane equation. 
%-----------------------------------------

% DEFINITION AND PLOTING OF SATELLITES:
%-----------------------------------------------------------------------------------------------------------
hold on

[t1, r1]=ode45('movtierrasat',[0 200], [8667.7, 2865.8, 4426.2, -5483.600, -3619.800, 2415.600]); %SATELLITE 1, integration

[t2, r2]=ode45('movtierrasat',[0 200], [-8809, 2593.8, -4731.2, -4613.600, 3702.800, -3576.600]); %SATELLITE 2, integration

[t3, r3]=ode45('movtierrasat',[0 200], [7667.7, -2865.8, -4351.2, -4500.900, 3621.200, -4415.600]); %SATELLITE 3, integration

[t4, r4]=ode45('movtierrasat',[0 200], [-8419.7, 3465.8, -4232.4, -5242.900, 3621.100, -2815.600]); %SATELLITE 4, integration

[t5, r5]=ode45('movtierrasat',[0 200], [8667.7, 2865.8, 4426.2, -5483.600, -3619.800, 2415.600]); %SATELLITE 5, integration

[t6, r6]=ode45('movtierrasat',[0 200], [-8367.7, -2265.8, -4426.2, 5483.600, 3619.800, -2415.600]); %SATELLITE 6, integration

[t7, r7]=ode45('movtierrasat',[0 200], [8598.7, 1765.8, 4310.9, -4683.600, 5519.800, 3615.600]); %SATELLITE 7, integration

hLine1 = line('XData',r2(1), 'YData',r2(2),'ZData',r2(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);   

hLine = line('XData',r1(1), 'YData',r1(2),'ZData',r1(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);  

hLine3 = line('XData',r3(1), 'YData',r3(2),'ZData',r3(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);

hLine4 = line('XData',r4(1), 'YData',r4(2),'ZData',r4(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);

hLine5 = line('XData',r5(1), 'YData',r5(2),'ZData',r5(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);

hLine6 = line('XData',r6(1), 'YData',r6(2),'ZData',r6(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);

hLine7 = line('XData',r7(1), 'YData',r7(2),'ZData',r7(3),'Marker','o', 'MarkerSize',6, 'LineWidth',2);

% plot3(r1(:,1), r1(:,2), r1(:,3)) %Trajectory plot, SATELLITE 1

% plot3(r2(:,1), r2(:,2), r2(:,3)) %Trajectory plot, SATELLITE 2

% plot3(r3(:,1), r3(:,2), r3(:,3)) %Trajectory plot, SATELLITE 3

% plot3(r4(:,1), r4(:,2), r4(:,3)) %Trajectory plot, SATELLITE 4

% plot3(r5(:,1), r5(:,2), r5(:,3)) %Trajectory plot, SATELLITE 5

% plot3(r6(:,1), r6(:,2), r6(:,3)) %PTrajectory plot, SATELLITE 6

% plot3(r7(:,1), r7(:,2), r7(:,3)) %Trajectory plot, SATELLITE 7

hold on

i = 1;                                      

while true
    if ZPlano(r1(i,1),r1(i,2))<r1(i,3) 
        set(hLine,'Color','r')

    else
        set(hLine,'Color','b')

    end   

    if ZPlano(r2(i,1),r2(i,2))<r2(i,3)
        set(hLine1,'Color','r')

    else
        set(hLine1,'Color','b')

    end

    if ZPlano(r3(i,1),r3(i,2))<r3(i,3)
        set(hLine3,'Color','r')

    else
        set(hLine3,'Color','b')

    end

    if ZPlano(r4(i,1),r4(i,2))<r4(i,3)
        set(hLine4,'Color','r')

    else
        set(hLine4,'Color','b')

    end

    if ZPlano(r5(i,1),r5(i,2))<r5(i,3)
        set(hLine5,'Color','r')

    else
        set(hLine5,'Color','b')

    end

    if ZPlano(r6(i,1),r6(i,2))<r6(i,3)
        set(hLine6,'Color','r')

    else
        set(hLine6,'Color','b')

    end

    if ZPlano(r7(i,1),r7(i,2))<r7(i,3)
        set(hLine7,'Color','r')

    else
        set(hLine7,'Color','b')

    end

    set(hLine1, 'XData',r2(i,1), 'YData',r2(i,2),'ZData',r2(i,3)) % SATELLITE 1

    set(hLine, 'XData',r1(i,1), 'YData',r1(i,2),'ZData',r1(i,3))  % SATELLITE 2 

    set(hLine3, 'XData',r3(i,1), 'YData',r3(i,2),'ZData',r3(i,3)) % SATELLITE 3

    set(hLine4, 'XData',r4(i,1), 'YData',r4(i,2),'ZData',r4(i,3)) % SATELLITE 1

    set(hLine5, 'XData',r5(i,1), 'YData',r5(i,2),'ZData',r5(i,3))  % SATELLITE 2 

    set(hLine6, 'XData',r6(i,1), 'YData',r6(i,2),'ZData',r6(i,3)) % SATELLITE 3

    set(hLine7, 'XData',r7(i,1), 'YData',r7(i,2),'ZData',r7(i,3)) % SATELLITE 3

    drawnow                     

    pause(0.1)     

    axis([-20000 20000 -20000 20000 -20000 20000])

    i = rem(i+1,600)+1;               

    if ~ishandle(hLine), break; end        

end