def height_a  
2
end

def wide_a
  4
end

def bright(a,x,y)
  if x<0||y<0||y>=wide_a||x>=height_a
    0
  else
    a[x][y]
  end
end

def number(a,x,y)
 if x<0||y<0||y>=wide_a||x>=height_a
    0
 else
    1
 end
end

def image_average(a,x,y)
(bright(a,x-1,y-1)+bright(a,x-1,y)+bright(a,x-1,y+1)+bright(a,x,y-1)+bright(a,x,y+1)+bright(a,x+1,y-1)+bright(a,x+1,y)+bright(a,x+1,y+1)+bright(a,x,y))/(number(a,x-1,y-1)+number(a,x-1,y)+number(a,x-1,y+1)+number(a,x,y-1)+number(a,x,y+1)+number(a,x+1,y-1)+number(a,x+1,y)+number(a,x+1,y+1)+number(a,x,y))
end
