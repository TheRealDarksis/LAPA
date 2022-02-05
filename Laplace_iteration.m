Max_iter = 100;
iter = 1;
nx = 10;
ny = 10;
V = zeros(nx,ny);
% Boundary conditions
V(:,1) = 1;     % Left
V(1,:) = 0;    % Top
V(:,ny) = 0;    % Right, change to 1 for part 2.vi
V(nx,:) = 0;    % Bottom

while iter <= Max_iter
    for indexx = 2:9
        for indexy = 2:9
            V(indexx,indexy) = 0.25*(V(indexx+1,indexy)+V(indexx-1,indexy)+V(indexx,indexy+1)+V(indexx,indexy-1));
        end
    end
    V(:,1) = ( V(indexx+1,indexy)+V(indexx-1,indexy)+V(indexx,indexy+1) )/3;    %Comment out for part 2.vi
    V(:,ny) = ( V(indexx+1,indexy)+V(indexx-1,indexy)+V(indexx,indexy-1) )/3;   %Comment out for part 2.vi
    
    iter = iter + 1;
    surf(V)    
    pause(0.1)
end
[Ex,Ey] = gradient(V);
figure(2)
quiver(Ey,Ex)
imboxfilt(V,3);