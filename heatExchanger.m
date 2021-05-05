function HeatExchanger(th_in,th_out,tc_in,g_h,g_c,cr,k,b_h,b_c,d_h,d_c,v,a_h,a_c,tw,n_h,Bi_h,n_c,Bi_c,z_h,z_c,micro_h,micro_c,lamda_h,lamda_c,lamda_t,fp_h,fp_c)
  Q=cr*g_h*(th_in-th_out);
  tc_out=Q/(cr*g_h);
  beta_h=a_h/v;
  beta_c=a_c/v;
  fc_h=n_h*Bi_h*b_h;
  fc_c=n_c*Bi_c*b_c;
  f_h=beta_h*z_h*fc_h*Bi_h;
  f_c=beta_c*z_c*fc_c*Bi_c;
  th_a=(th_in+th_out)/2;
  tc_a-(tc_in+tc_out)/2;
  u_h=g_h/fc_h;
  u_c=g_c/fc_c;
  Re_h=(u_h*d_h)/micro_h;
  Re_c=(u_c*d_c)/micro_c;
  Pr_h=(micro_h*cr)/k;
  Pr_c=(micro_c*cr)/k;
  Nu_h=0.844*((Re_h)^0.687)*((Pr_h)^0.333);
  Nu_c=0.844*((Re_c)^0.687)*((Pr_c)^0.333);
  alpha_h=Nu_h*(lamda_h/d_h);
  alpha_c=Nu_c*(lamda_c/d_c);
  lp_h=b_h*1.2;
  lp_c=b_c*1.2;
  m_h=sqrt((2*alpha_h)/(tw*lamda_t));
  m_c=sqrt((2*alpha_c)/(tw*lamda_t));
  e_h=m_h*lp_h/2;
  e_c=m_c*lp_c/2;
  kpd_h=tanh(e_h)/e_h;
  kpd_c=tanh(e_c)/e_c;
  kpd0_h=1-((fp_h/f_h)*(1-kpd_h));
  kpd0_c=1-((fp_c/f_c)*(1-kpd_c));
  f_a=(f_h+f_c)/2;
  K_h=((1/(alpha_h*kpd_h))+(f_h/(alpha_c*kpd0_c*f_c))+(f_h*tw/f_a))^-1;
  K_c=((1/(alpha_c*kpd_c))+(f_c/(alpha_h*kpd0_h*f_h))+(f_c*tw/f_a))^-1;
end