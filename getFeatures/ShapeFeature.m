function [area,perimeter,ap] = ShapeFeature(f)
    bw = f>10;
    
    %perimeter
    border = bwperim(bw);
    [x,y] = find(border==1);
    xy = [x y];
    perimeter = length(xy);
    
    %area
    [x2,y2] = find(bw==1);
    xy2 = [x2,y2];
    area = length(xy2);
    
    %area/peri
    ap = area/perimeter;
    
end
    