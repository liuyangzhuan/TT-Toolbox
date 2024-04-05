function y=vie_green3d(x)
    global wavelen ppw
    d=max(size(x,2),size(x,1))/3;
    ds = wavelen/ppw;
    waven=2*pi/wavelen;
    % ds=0.01;
    zdist=2;

    xxs=x(1:d);
    yys=x(d+1:2*d);
    zzs=x(2*d+1:3*d);

    % xxs=x(1:3:3*d);
    % yys=x(2:3:3*d);
    % zzs=x(3:3:3*d);

    
    xs=0;
    ys=0;
    zs=0;
    xo=0;
    yo=0;
    zo=0;    
    for ii=1:d
      % normal ordering   
      xo = xo + mod(xxs(ii)-1,2)*2^(ii-1);  
      xs = xs + floor((xxs(ii)-1)/2)*2^(ii-1);  
      yo = yo + mod(yys(ii)-1,2)*2^(ii-1);  
      ys = ys + floor((yys(ii)-1)/2)*2^(ii-1);  
      zo = zo + mod(zzs(ii)-1,2)*2^(ii-1);  
      zs = zs + floor((zzs(ii)-1)/2)*2^(ii-1);    

    %   % bit-reversal ordering 
    %   xo = xo + mod(xxs(ii)-1,2)*2^(ii-1);  
    %   xs = xs + floor((xxs(ii)-1)/2)*2^(d-ii);  
    %   yo = yo + mod(yys(ii)-1,2)*2^(ii-1);  
    %   ys = ys + floor((yys(ii)-1)/2)*2^(d-ii);  
    %   zo = zo + mod(zzs(ii)-1,2)*2^(ii-1);  
    %   zs = zs + floor((zzs(ii)-1)/2)*2^(d-ii);  


    end
    oo = [xo*ds, yo*ds, zo*ds];
    ss = [xs*ds, ys*ds, zs*ds+zdist];
    r =sqrt(sum((oo-ss).^2));
    if(r~=0)
%         y=1/r;  % static kernel
        y = exp(-1i*waven*r)/r; % high-frequency kernel
    else
        y=0;
    end
 
end