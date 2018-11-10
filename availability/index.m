syms X Y

[xp,yp]= meshgrid(-9000:1000:9000);

zp=6371^2/sqrt(38589641)-1000.*xp./sqrt(38589641)
-1000.*yp./sqrt(38589641);

ZPlano=inline(’6371^2/sqrt(38589641)-1000*X/sqrt(38589641)-1000*Y/sqrt(38589641)’);

hold on

mesh(xp,yp,zp);

hold on

[t1, r1]=ode45(’movtierrasat’,[0 200], [8667.7, 2965.8,-4226.2, 4883.600, 3219.800, 3415.600]);
[t2, r2]=ode45(’movtierrasat’,[0 200], [-8309, 2993.8,-4231.2, -4313.600, 4592.800, -3876.600]);
[t3, r3]=ode45(’movtierrasat’,[0 200], [-7567.7, 2565.8,-4351.2, -4330.900, 3921.200, 4695.600]);
[t4, r4]=ode45(’movtierrasat’,[0 200], [-8719.7, -3065.8,-3032.4, -4542.900, -3921.100, 3915.600]);
[t5, r5]=ode45(’movtierrasat’,[0 200], [3667.7, -3265.8,4426.2, 4483.600, 8219.800, -3415.600]);
[t6, r6]=ode45(’movtierrasat’,[0 200], [-4367.7, -3265.8,-8426.2, -3483.600, -4319.800, 4415.600]);
[t7, r7]=ode45(’movtierrasat’,[0 200], [8598.7, 1765.8, 4310.9, -4683.600, 5519.800, 3615.600]);

hLine1 = line(’XData’,r2(1), ’YData’,r2(3),’ZData’,r2(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);
hLine = line(’XData’,r1(1), ’YData’,r1(3),’ZData’,r1(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);
hLine3 = line(’XData’,r3(1), ’YData’,r3(3),’ZData’,r3(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);
hLine4 = line(’XData’,r4(1), ’YData’,r4(3),’ZData’,r4(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);
hLine5 = line(’XData’,r5(1), ’YData’,r5(3),’ZData’,r5(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);
hLine6 = line(’XData’,r6(1), ’YData’,r6(3),’ZData’,r6(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);
hLine7 = line(’XData’,r7(1), ’YData’,r7(3),’ZData’,r7(5),’Marker’,’o’, ’MarkerSize’,6,’LineWidth’,2);

hold on

availabletime1=[];
availabletime2=[];
availabletime3=[];
availabletime4=[];
availabletime5=[];
availabletime6=[];
availabletime7=[];

i = 1;

while true
    if ZPlano(r1(i,1),r1(i,3))<r1(i,5) 
        set(hLine,'Color','r')
        tiemposdisp1(i)=1;
    else 
        set(hLine,'Color','b')
        tiemposdisp1(i)=0;
    end
    
    if ZPlano(r2(i,1),r2(i,3))<r2(i,5)
        set(hLine1,'Color','r')
        tiemposdisp2(i)=2;
    else
        set(hLine1,'Color','b')
        tiemposdisp2(i)=0;
    end
    
    if ZPlano(r3(i,1),r3(i,3))<r3(i,5)
        set(hLine3,'Color','r')
        tiemposdisp3(i)=3;
    else
        set(hLine3,'Color','b')
        tiemposdisp3(i)=0;
    end
    
    if ZPlano(r4(i,1),r4(i,3))<r4(i,5)
        set(hLine4,'Color','r')
        tiemposdisp4(i)=4;
    else
        set(hLine4,'Color','b')
        tiemposdisp4(i)=0;
    end
    
    if ZPlano(r5(i,1),r5(i,3))<r5(i,5)
        set(hLine5,'Color','r')
        tiemposdisp5(i)=5;
    else
        set(hLine5,'Color','b')
        tiemposdisp5(i)=0;
    end
    
    if ZPlano(r6(i,1),r6(i,3))<r6(i,5)
        set(hLine6,'Color','r')
        tiemposdisp6(i)=6;
    else
        set(hLine6,'Color','b')
        tiemposdisp6(i)=0;
    end
    
    if ZPlano(r7(i,1),r7(i,3))<r7(i,5)
        set(hLine7,'Color','r')
        tiemposdisp7(i)=7;
    else
        set(hLine7,'Color','b')
        tiemposdisp7(i)=0;
    end
    
    
    set(hLine1, 'XData',r2(i,1), 'YData',r2(i,3),'ZData',r2(i,5)) 
    set(hLine, 'XData',r1(i,1), 'YData',r1(i,3),'ZData',r1(i,5))  
    set(hLine3, 'XData',r3(i,1), 'YData',r3(i,3),'ZData',r3(i,5)) 
    set(hLine4, 'XData',r4(i,1), 'YData',r4(i,3),'ZData',r4(i,5)) 
    set(hLine5, 'XData',r5(i,1), 'YData',r5(i,3),'ZData',r5(i,5))  
    set(hLine6, 'XData',r6(i,1), 'YData',r6(i,3),'ZData',r6(i,5))
    set(hLine7, 'XData',r7(i,1), 'YData',r7(i,3),'ZData',r7(i,5)) 

    drawnow                     
    
    pause(0.1)     
    
    axis([-20000 20000 -20000 20000 -20000 20000])

    i = rem(i+1,600);               
    if ~ishandle(hLine), break; end        
end

for j=1:i-1
    if tiemposdisp1(j)==1
        plot(j,tiemposdisp1,'Color','k','Marker','.');
        hold on
    end
    if tiemposdisp2(j)==2        
        plot(j,tiemposdisp2,'Color','k','Marker','.');
        hold on
    end
    
    if tiemposdisp3(j)==3
        plot(j,tiemposdisp3,'Color','k','Marker','.');
        hold on
    end
    if tiemposdisp4(j)==4
        plot(j,tiemposdisp4,'Color','k','Marker','.');
        hold on
    end
    if tiemposdisp5(j)==5
        plot(j,tiemposdisp5,'Color','k','Marker','.');
        hold on
    end
    if tiemposdisp6(j)==6
        plot(j,tiemposdisp6,'Color','k','Marker','.');
        hold on
    end
    if tiemposdisp7(j)==7
        plot(j,tiemposdisp7,'Color','k','Marker','.');
        hold on
    end
    
    eje_x=xlabel('\textbf{Iteraciones}') ;
    set(eje_x,'Interpreter','latex', 'fontsize', 20);
    eje_y=ylabel('\textbf{Disponibilidad}') ;
    set(eje_y,'Interpreter','latex', 'fontsize', 20);
end