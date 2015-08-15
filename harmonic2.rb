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
 p  @wave*(@time-1)
 end



def multipeek(x1,x2,x3)
 x=[x1,x2,x3]
 y=[x1.peek,x2.peek,x3.peek]
  f=Hash.new
  for i in 0..x.length-1
    f[y[i]] = i
  end
  k=f[y.min]
 p x[k].get
 
end

end

def test
x1=Harmonic.new(110)
x2=Harmonic.new(170)
x3=Harmonic.new(250)
x1.multipeek(x1,x2,x3)
x1.multipeek(x1,x2,x3)
x1.multipeek(x1,x2,x3)
x1.multipeek(x1,x2,x3)
end
    


 

  
  
