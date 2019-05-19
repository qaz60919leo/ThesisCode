function result = findROI(f)
    iCount = zeros(1,256);
    [x,y] = size(f);
    vSize = x*y;
    threshold = 0;
    thCount = 0;
    se=strel('square',10');
    
    %count pixel numbers of every intensity
    for i = 1:vSize
        iCount(f(i)+1) = iCount(f(i)+1) + 1;
    end
    
    %find top 10000 pixels from intensity 255 to 150
    for i = length(iCount):-1:171
        if thCount < 10000
            thCount = thCount + iCount(i);
        else
            threshold = i-1;
            break;
        end
    end
    
    %image process(delete pixel which not in threshold and Enrode & Dilate)
    f1 = f>=threshold;
    f1 = imopen(f1,se);
    f1 = imdilate(f1,se);
    f1 = uint8(f1);
    result = f.*f1;
    
    %leave pixel > (threshold-10)
    for i = 1:vSize
        if result(i) < (threshold-10)
            result(i) = 0;
        end
    end
end