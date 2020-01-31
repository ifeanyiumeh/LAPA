bcLeft = 0;
bcRight = 0; 
bcTop = 1;
bcBottom = 1;

nx = 100;
ny = 100;

V = zeros(nx,ny);
maxIteration = 1000;

%V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1))+V(i,(j-1)))/4;
%V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1)))/3; %bottom free node
%V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j-1)))/3; %top free node

for k = 0 : maxIteration 
    for i = 1 : (nx)
         for j = 1 : (ny)
            if i == 1
                V(i,j) = bcLeft;
            elseif i == nx
                V(i,j) = bcRight;        
            elseif j == 1
                %V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1)))/3 %bottom free node
                V(i,j) = bcBottom;
            elseif j == ny
                %V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j-1)))/3 %top free node
                V(i,j) = bcTop;
            else  
                V(i,j) = (V((i+1),j)+V((i-1),j)+V(i,(j+1))+V(i,(j-1)))/4;
            end
         end 
    end
    
    subplot(4,1,1)
    surf(V);
    %pause(0.1)
    
  % [Ex,Ey] = -gradient(V);
   %Ex = V/nx
    %Ey = V/ny;
    [Ex,Ey] = gradient(V);
    
    subplot(4,1,2)
    surf(-Ex,-Ey)
    
    subplot(4,1,3)
    quiver(-Ex,-Ey)
    %pause(0.1)
    
    subplot(4,1,4)
    A = imboxfilt(V,3);
    imshowpair(V,A)
    %pause(0.1)
end