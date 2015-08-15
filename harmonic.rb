require 'set'

class Harmonic
  def initialize(f)
    @time=1
    @wave=f
  end
  def peek
    k=@wave*@time
   k
  end
  def get
    @time=@time+1
    @wave*(@time-1)
  end

end

def multiwave(f1,f2,f3,k)
 x1=Harmonic.new(f1)
 x2=Harmonic.new(f2)
 x3=Harmonic.new(f3)
 s=SortedSet.new()
 count=0
while count < k
 s.add(x1.peek)
 s.add(x2.peek)
 s.add(x3.peek)
 x1.get
 x2.get
 x3.get
 count=count+1
end
p s 
end
