load("./max.rb")
load("./abs.rb")
class Line
  attr_accessor("p0", "p1")

  def initialize(q,r)
    self.p0 = q
    self.p1 = r
  end

  def draw(a)
    n = max(abs(self.p1.x - self.p0.x),
            abs(self.p1.y - self.p0.y))
    for i in 0..n
      p = self.p0.interpolate(self.p1, i*1.0/n)
      p.draw(a)
    end
  end

  def turn(theta)
    self.p0 = self.p0.rotate(theta)
    self.p1 = self.p1.rotate(theta)
  end
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
