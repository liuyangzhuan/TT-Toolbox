function y=vie_green3d(x)
    global N
    d=max(size(x,2),size(x,1))/3;

    xxs=x(1:d);
    yys=x(d+1:2*d);
    zzs=x(2*d+1:3*d);

%     xxs=x(1:3:3*d);
%     yys=x(2:3:3*d);
%     zzs=x(3:3:3*d);

    
    xs=0;
    ys=0;
    zs=0;
    xo=0;
    yo=0;
    zo=0;    
    for ii=1:d
    %   % normal ordering   
    %   xo = xo + mod(xxs(ii)-1,2)*2^(ii-1);  
    %   xs = xs + floor((xxs(ii)-1)/2)*2^(ii-1);  
    %   yo = yo + mod(yys(ii)-1,2)*2^(ii-1);  
    %   ys = ys + floor((yys(ii)-1)/2)*2^(ii-1);  
    %   zo = zo + mod(zzs(ii)-1,2)*2^(ii-1);  
    %   zs = zs + floor((zzs(ii)-1)/2)*2^(ii-1);    

      % bit-reversal ordering 
      xo = xo + mod(xxs(ii)-1,2)*2^(ii-1);  
      xs = xs + floor((xxs(ii)-1)/2)*2^(d-ii);  
      yo = yo + mod(yys(ii)-1,2)*2^(ii-1);  
      ys = ys + floor((yys(ii)-1)/2)*2^(d-ii);  
      zo = zo + mod(zzs(ii)-1,2)*2^(ii-1);  
      zs = zs + floor((zzs(ii)-1)/2)*2^(d-ii);            
    end
    oo = [xo/N, yo/N, zo/N];
    ss = [xs-N/2, ys-N/2, zs-N/2];
    
    
    k = ss';
    cx = (3+sin(2*pi*oo(1))*sin(2*pi*oo(2))*sin(2*pi*oo(3)))/100;
    xk = oo*k;
    kr = xk+cx*sqrt(sum((k).^2));
    y = exp(2*pi*1i*kr);    
    
end