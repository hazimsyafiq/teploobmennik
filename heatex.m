function heatex(c1, c2, v1_in, v2_in, v1_out, flow_arrgmnt)
    Cmin = min(c1,c2);
    Cmax = max(c1,c2);
    epsilon = c1 * (v1_in - v1_out) / Cmin * (v1_in - v2_in)
    Z = Cmin/Cmax;
    
    if flow_arrgmnt == 1 % control flow
        NTU0 = 1/(Z-1)*log(1-epsilon/(1-(epsilon*Z)))
    elseif flow_arrgmnt == 2 % parallel flow
        NTU0 = -log(-epsilon-epsilon*Z+1)/(Z+1)
    elseif flow_arrgmnt == 3 % cross flow Cmax mixed
        NTU0 = -log(1+(log(1-epsilon*Z))/Z)
    elseif flow_arrgmnt == 4 % cross flow Cmin mixed
        NTU0 = -log(Z*log(1-epsilon)+1)/Z
    elseif flow_arrgmnt == 5 % all heat exchangers
        NTU0 = -log(1-epsilon)
    end
end
