%Base function to run the program. This file must be saved inside the MATLAB folder of your documents

function dr= mov_satearth(t,r)
    dr=zeros(6,1);
    G=6.67384*10^(-17);
    ms=1000;
    mt=5972*10^24;
    
    mu=-G*(mt+ms);
    
    dr(1)=r(2);
    dr(2)=mu.*r(1)./((r(1).^2+r(3).^2+r(5).^2)^(3/2));
    dr(3)=r(4);
    dr(4)=mu.*r(3)./((r(1).^2+r(3).^2+r(5).^2)^(3/2));
    dr(5)=r(6);
    dr(6)=mu.*r(5)./((r(1).^2+r(3).^2+r(5).^2)^(3/2));
