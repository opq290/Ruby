load("./line.rb")
def bezier_draw(p0,c,p1,a)
  n = 10
  prev = p0
  for i in 1..n
    t = i*1.0/n
    q0 = point_interpolate(p0, c,  t)
    q1 = point_interpolate(c,  p1, t)
    r  = point_interpolate(q0, q1, t)
    line_draw(prev, r, a)
    prev = r
  end
end


# version 1.4
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
