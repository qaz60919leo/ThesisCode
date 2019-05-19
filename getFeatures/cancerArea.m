function f2 = cancerArea(f)
    %bw = imbinarize(f,0.8);
    bw = f>200;
    %Erode & Dilate
    se=strel('square',10');
    bw = imopen(bw,se);
    bw = imdilate(bw,se);
    
    bl = bwlabel(bw,4);
    stats = regionprops(bl,'Area');
    idx = find([stats.Area]>40);
    bw2 = ismember(bl,idx);
    bw2 = uint8(bw2);
    f2 = f.*bw2;
end