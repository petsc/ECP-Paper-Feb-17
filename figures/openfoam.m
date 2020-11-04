clear all; close all
p=[1,2,6,12,24];
out_p_aijcusparse = [
2.1426e+00
4.4458e+01
5.4732e+00
1.4942e+00
3.5386e+01
4.3097e+00
5.8835e-01
1.2763e+01
2.8991e+00
4.6172e-01
7.1599e+00
3.0974e+00
5.0312e-01
4.5032e+00
4.0926e+00
];
out_Ux_aijcusparse = [
3.2435e+00
1.2205e+01
3.0966e+00
3.0978e+00
6.2172e+00
1.5361e+00
1.0600e+00
2.0752e+00
7.5974e-01
9.9460e-01
1.3728e+00
7.8435e-01
1.3117e+00
1.2550e+00
1.0335e+00
];
%figure; bar(reshape(out_Ux_aijcusparse,3,[])','stacked'), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'Mat','PC','KSP'}), title('Ux aijcusparse')
out_Uy_aijcusparse = [
2.1231e+00
1.2184e+01
2.8431e+00
1.4846e+00
6.1780e+00
1.4221e+00
6.0865e-01
2.0513e+00
6.9922e-01
4.6348e-01
1.3521e+00
7.1990e-01
4.9497e-01
1.2315e+00
9.6350e-01
];
%figure; bar(reshape(out_Uy_aijcusparse,3,[])','stacked'), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'Mat','PC','KSP'}), title('Uy aijcusparse')
out_Uz_aijcusparse = [
2.1312e+00
1.2182e+01
2.8475e+00
1.4246e+00
6.2012e+00
1.4272e+00
5.9278e-01
2.0499e+00
6.9485e-01
4.5904e-01
1.3532e+00
7.3004e-01
5.2307e-01
1.2341e+00
9.6743e-01
];
out_U_aijcusparse = out_Ux_aijcusparse + out_Uy_aijcusparse + out_Uz_aijcusparse;
%figure; bar(reshape(out_Uz_aijcusparse,3,[])','stacked'), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'Mat','PC','KSP'}), title('Uz aijcusparse')
out_allmatcoo_aijcusparse = [
3.2435e+00
2.1231e+00
2.1312e+00
2.1426e+00
3.0978e+00
1.4846e+00
1.4246e+00
1.4942e+00
1.0600e+00
6.0865e-01
5.9278e-01
5.8835e-01
9.9460e-01
4.6348e-01
4.5904e-01
4.6172e-01
1.3117e+00
4.9497e-01
5.2307e-01
5.0312e-01
];
out_allmatset_aijcusparse = [
2.1939e+01
2.0431e+01
2.0428e+01
2.0341e+01
1.4433e+01
1.4110e+01
1.4142e+01
1.4161e+01
5.2531e+00
4.8158e+00
4.8340e+00
4.8400e+00
3.1247e+00
2.4840e+00
2.5715e+00
2.5003e+00
2.0386e+00
1.2758e+00
1.2859e+00
1.2783e+00
];

out_foam_total = [
552.65
374.02
163.69
80.51
43.5
];
out_gpu_total = [
1.658e+02
1.054e+02
4.051e+01
2.907e+01
2.921e+01
];

figure; loglog(p, out_foam_total, 'r-*', p, out_gpu_total, 'b-d', 'LineWidth',2,'MarkerSize',8), ylim([10 2000]), xticks([1,2,6,12,24]), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'OpenFOAM','PETSc GPU'}), title({'Total time'}) 
set( findall(gcf, '-property', 'fontsize'), 'fontsize', 20) 
set(gca,'linewidth',1.5)
saveas(gcf,'openfoam_total.png') 
close(gcf)

figure; loglog(p,sum(reshape(out_allmatset_aijcusparse,4,[])),'r-*', p, sum(reshape(out_allmatcoo_aijcusparse,4,[])), 'b-d', 'LineWidth',2,'MarkerSize',8), xticks([1,2,6,12,24]), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'MatSetValues','MatSetValuesCOO'}), title({'Assembly'}), ylim([0.1 1000])
set( findall(gcf, '-property', 'fontsize'), 'fontsize', 20) 
set(gca,'linewidth',1.5)
saveas(gcf,'openfoam_assembly.png') 
close(gcf)

figure; bar(reshape(out_p_aijcusparse,3,[])','stacked'), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'Mat','PC','KSP'}), title({'Pressure eqs.'})
set( findall(gcf, '-property', 'fontsize'), 'fontsize', 20) 
set(gca,'linewidth',1.5)
saveas(gcf,'openfoam_P.png') 
close(gcf)

figure; bar(reshape(out_U_aijcusparse,3,[])','stacked'), xticklabels({'1','2','6','12','24'}), xlabel('Processes'), ylabel('time (s)'), legend({'Mat','PC','KSP'}), title({'Momentum eqs.'})
set( findall(gcf, '-property', 'fontsize'), 'fontsize', 20) 
set(gca,'linewidth',1.5)
saveas(gcf,'openfoam_U.png') 
close(gcf)
