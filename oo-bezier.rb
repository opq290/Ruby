load("./oo-line.rb")
class Bezier < Line
  attr_accessor("p0", "c", "p1")
  
  def initialize(q,r,s)
    super(q,s)
    self.c  = r
  end

  def draw(a)
    n = 10
    prev = self.p0
    for i in 1..n
      t = i*1.0/n
      q0 = self.p0.interpolate(c,  t)
      q1 = self.c. interpolate(p1, t)
      r  = q0.interpolate(q1, t)
      Line.new(prev, r).draw(a)
      prev = r
    end
  end

  def turn(theta)
    super(theta)
    self.c = self.c.rotate(theta)
  end
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
