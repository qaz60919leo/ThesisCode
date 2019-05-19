function f2 = tagCrop(f)
    %Erode & Dilate
    se=strel('square',10');
    f1 = imopen(f,se);

    bw = imbinarize(f1,0.2);
    bl = bwlabel(bw,4);
    stats = regionprops(bl,'Area');
    [maxValue,idx]=max([stats.Area]);
    bw2 = ismember(bl,idx);
    bw2 = uint8(bw2);
    f2 = f.*bw2;
    f2 = cropROI(f2);
end
    