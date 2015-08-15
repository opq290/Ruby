def d(x,y)
sqrt(x**2+y**2)
end

def b(r,x,y)
  if d(x,y)<=r
    1-d(x,y)/r*1.0
  else
  1
  end
end

def sphere(r)
  image=make2d(2*r,2*r)
  for y in 0..(2*r-1)
    for x in 0..(2*r-1)
      image[y][x]=b(r,x-r,y-r)
    end
  end
image
end
