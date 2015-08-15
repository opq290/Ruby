class Point
  attr_accessor("x", "y")
end

def point_make(u,v)
  p = Point.new()
  p.x = u
  p.y = v
  p
end

def point_scale(p,s)
  point_make(p.x*s,p.y*s)
end

def point_add(p,q)
  point_make(p.x+q.x, p.y+q.y)
end

def point_interpolate(p,q,t)
  point_add(point_scale(p,1-t),
            point_scale(q,t))
end

def point_draw(p,a)
  if 0 <= p.y+0.5 && p.y+0.5 < a.   length() &&
     0 <= p.x+0.5 && p.x+0.5 < a[0].length()
    a[p.y+0.5][p.x+0.5]=1
  end
end


# version 1.4
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
