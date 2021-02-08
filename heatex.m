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
    
    UavgA0 = NTU0 * Cmin;
    %{
    mt1_0 = m1*
    mt2_0
    mt1_in0
    mt1_in
    mt2_in0
    mt2_in
    %}
    r = mt1_0/mt2_0;
    UavgA = Uavg0*(1+r)/((mt1_in0/mt1_in)^0.78 + r*(mt2_in0/mt2_in)^0.78);
    NTU = UavgA/Cmin;

    if flow_arrgmnt == 1 % control flow
        epsilon1 = (1-exp(-NTU*(1-Z))) / (1-Z*exp(-NTU*(1-Z)))
    elseif flow_arrgmnt == 2 % parallel flow
        epsilon1 = (1-exp(-NTU*(1+Z))) / (1+Z)
    elseif flow_arrgmnt == 3 % cross flow Cmax mixed
        eta = NTU^(-0.22);
        epsilon1 = 1-exp(exp(-NTU*Z*eta)-1/Z*eta)
    elseif flow_arrgmnt == 4 % cross flow Cmin mixed
        return
    elseif flow_arrgmnt == 5 % all heat exchangers
        epsilon1 = 1-exp(-NTU)
    end

    v1 = v1_in + epsilon1*Cmin/c1 * (v2_in-v1_in)
    Q = c1*(v1_out-v1_in)
    v2 = v2_in-(Q/c2)
    
end
