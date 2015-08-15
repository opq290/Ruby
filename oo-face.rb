include(Math)
load("./make2d.rb")
load("./oo-circle.rb")
load("./oo-bezier.rb")
load("./oo-line.rb")
load("./drawall.rb")

def make_points(xy)
  a = Array.new(xy.length()/2)
  for i in 0..a.length()
    a[i] = Point.new(xy[2*i],xy[2*i+1])
  end
  a
end

def fl(p)
  Point.new(2*350-p.x,p.y)
end

def face()
  p = make_points([350,50, 322,62, 350,80, 335,79, 
                    -6, 3, 336,33,   5, 0,   0,20])
 [Circle.new(p[0],50),
  Bezier.new(p[1],p[3],p[2]),
  Bezier.new(fl(p[1]),fl(p[3]),p[2]),
  Line.new(p[1].sub(p[4]),p[1].add(p[4])),
  Line.new(fl(p[1].sub(p[4])),fl(p[1].add(p[4]))),
  Bezier.new(p[5].sub(p[6]),p[5].sub(p[7]),
			    p[5].add(p[6])),
  Bezier.new(p[5].sub(p[6]),p[5].add(p[7]),
			    p[5].add(p[6])),
  Bezier.new(fl(p[5].sub(p[6])),fl(p[5].sub(p[7])), 
				fl(p[5].add(p[6]))),
  Bezier.new(fl(p[5].sub(p[6])),fl(p[5].add(p[7])), 
				fl(p[5].add(p[6])))]
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
