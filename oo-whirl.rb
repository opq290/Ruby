include(Math)
def faces()
  a = make2d(400,400)
  elements = face()
  for i in 1..5
    drawall(elements, a)
    turnall(elements, PI/10)
  end
  show(a)
end

def whirl()
  a = make2d(400,400)
  elements = face()
  for i in 1..20
    for j in 0..elements.length()-1
      elements[j].draw(a)
      elements[j].turn(PI/15)
      elements[j].zoom(0.85)
      elements[j].move(Point.new(55,40))
    end
  end
  show(a)
end

# version 1.4
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
