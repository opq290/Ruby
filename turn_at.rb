include(Math)
def turning_figure()
  f1 = Line.new(Point.new(0,0),Point.new(99,99))
  f2 = Circle.new(Point.new(50,50),25)
  a = make2d(100,100)
  for i in 0..10
    f1.draw(a)
    f2.draw(a)
    f1.turn_at(Point.new(100,100),  PI/40)
    f2.turn_at(Point.new(100,100), -PI/40)
  end
  show(a)
end

# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
