function f2 = skinCrop(f)
    %flip left to right
    flip = 0;
    if f(10,10) == 0
        f = fliplr(f);
        flip = 1;
    end
    
    %binarize image
    bw = imbinarize(f,0.8);
    
    %Erode & Dilate & Dilate
    se=strel('square',10');
    f1 = imopen(bw,se);
    f1 = imdilate(f1,se);
    %imshow(f1);
    
    bl = bwlabel(f1,4);
    %stats = regionprops(bl,'Area');
    %[maxValue,idx]=max([stats.Area]);
    idx = 1;
    bw2 = ~ismember(bl,idx);
    bw2 = uint8(bw2);
    f2 = f.*bw2;
    f2 = cropROI(f2);
    
    if flip == 1
        f2 = fliplr(f2);
    end

end
    
    