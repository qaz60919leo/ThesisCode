function result = ErodeDilate(f)
    se=strel('square',10');
    result = imopen(f,se);
end