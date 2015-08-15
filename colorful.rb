load ("make2d.rb")
def d(x,y,u,v)
  sqrt((x-u)**2.0+(y-v)**2.0)
end

def k(s,x,y)
  if d(x,y,s,s)<=s
    1-d(x,y,s,s)/s*1.0
  else
    1
  end
end

def g(s,x,y)
  if y>=x
    (x+1.0)/(2*s)
  else
    1
  end
end

def h(s,x,y)
  if y<=x
    (y+1.0)/(2*s)
  else
    1
  end
end

def color_pattern(s)
  image = make2d(2*s,2*s)
  for y in 0..(2*s-1)
    for x in 0..(2*s-1)
      r=h(s,x,y)
      g=k(s,x,y)
      b=g(s,x,y)
      image[y][x] = [r,g,b]
     end
   end
  image
end
    


