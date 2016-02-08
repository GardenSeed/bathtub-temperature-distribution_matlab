t0 = 20 * ones(22,12,10);
t0(3:20,3:10,3:10) = 40;
%first
[x,y,z] = meshgrid(0:.1:0.9,0:.1:1.9,0:.1:0.7);
xs = 0:0.1:2;
ys = 0:0.1:2.4;
zs = xs;
figure(1);subplot(2,2,1);
h = slice(x,y,z,t0(2:21,2:11,2:9),xs,ys,zs,'nearest' );
set(h,'FaceColor','interp',...
    'EdgeColor','none')
%camproj perspective
title('t = 0s')
box on
view(300,30)
%colormap cool
colorbar
k=caxis;


%2
m = model1_100(t0);
figure(1);subplot(2,2,2);
h = slice(x,y,z,m(2:21,2:11,2:9),xs,ys,zs,'nearest' );
set(h,'FaceColor','interp',...
    'EdgeColor','none')
%camproj perspective
title('t = 100s')
box on
view(300,30)
%colormap cool
caxis(k)
colorbar

%3
m = model1_100(m);
figure(1);subplot(2,2,3);
h = slice(x,y,z,m(2:21,2:11,2:9),xs,ys,zs,'nearest' );
set(h,'FaceColor','interp',...
    'EdgeColor','none')
%camproj perspective
title('t = 200s')
box on
view(300,30)
%colormap cool
caxis(k)
colorbar

%4
m = model1_1000(m);
figure(1);subplot(2,2,4);
h = slice(x,y,z,m(2:21,2:11,2:9),xs,ys,zs,'nearest' );
set(h,'FaceColor','interp',...
    'EdgeColor','none')
%camproj perspective
title('t = 1200s')
box on
view(300,30)
%colormap cool
caxis(k)
colorbar