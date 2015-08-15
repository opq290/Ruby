class CSG
 
 def initialize(shape,a1,a2,a3,a4)
   @shape = shape
   if shape == "circle"
     @x=a1
     @y=a2
     @r=a3
     
   else
     if shape == "box"
       @x1=a1
       @y1=a2
       @x2=a3
       @y2=a4
     else
       if shape == "subtract" || shape =="assemble"
         @left=a1
         @right=a2
        end
     end
   end
 end
  
def in(x,y)
  if @shape == "circle"
    if (x-@x)^2 + (y-@y)^2 > @r^2
        false
    else
      true
    end
  else 
    if @shape == "box"
      if x>=@x1 && x<=@x2 && y>=@y1 && y<=@y2
        true
      else
        false
      end
    else
      if @shape =="subtract"
        if @left.in(x,y)== true && @right.in(x,y) == false
          true
        else
          false
        end
      else
       if @shape =="assemble"
         if @left.in(x,y)==true || @right.in(x,y)==true
           true
         else
           false
         end
       end
      end
    end
end
end
end

def test
  s=CSG.new("box",1,1,3,3)
  t=CSG.new("circle",3,3,1,nil)
  u=CSG.new("subtract",s,t,nil,nil)
p u.in(3,3)
end


 
