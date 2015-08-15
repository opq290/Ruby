load("./max.rb")
load("./abs.rb")

def line_draw(p0,p1,a)
  n=max(abs(p1.x - p0.x), abs(p1.y - p0.y))
  for i in 0..n
    point_draw(point_interpolate(p0,p1,i*1.0/n), a)
  end
end

# version 1.4
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
