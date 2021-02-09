function A = RegulaFalsi(x0,x1)
    syms x;
    y=1;
    f=1-exp(exp(-y^(0.78))-1/x1*y^(-0.22))-x0; %Enter the Function here
    % n=input('Enter the number of decimal places:');
    epsilon = 10^-(3+1)
    
    for i=1:100
        f0=vpa(subs(f,x,x0));
        f1=vpa(subs(f,x,x1));
        y=x1-((x1-x0)/(f1-f0))*f1; 
        err=abs(y-x1);
        if err<epsilon
            break
        end
        f2=vpa(subs(f,x,y));
        if (f1)*(f2)<1
            x0=y;
            x1=x1;
        else
            x0=x0;
            x1=y;
        end
    end
    A = y - rem(y,10^-n);
    fprintf('The Root is : %f \n',y);
end
