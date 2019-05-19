function f2 = cropROI(f)
    if sum(f(:)) == 0
        f2 = f;
    else
        [row,col] = find(f);
        f2 = f(min(row):max(row), min(col):max(col));
    end
end