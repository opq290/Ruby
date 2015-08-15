def drawmoon()
  p0=Point.new(0,85)
  p1=Point.new(99,85)
  f=[Line.new(p0,p1), 
     Bezier.new(p0,Point.new(50,60),p1),
     Circle.new(Point.new(66,20),20)]
  a=make2d(100,100)
  drawall(f,a)
  show(a)
end

def drawall(elements,a)
  for i in 0..elements.length()-1
    elements[i].draw(a)
  end
  a
end

# version 1.2
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
