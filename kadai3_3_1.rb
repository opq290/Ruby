load"parses2.rb"
a=ParseNodes.new("+",ParseNodes.new(9),ParseNodes.new("+",ParseNodes.new(1),ParseNodes.new("+",ParseNodes.new(1),ParseNodes.new(9))))



def find_ten(a)
b=a.postorder
c=["+","-","*","/"] 
 for i in 0..3
    for j in 0..3
      for k in 0..3
        b[4]=c[i]
        b[5]=c[j]
        b[6]=c[k]
      d=ParseNodes.new(b[6..6],ParseNodes.new(b[0..0].to_i),ParseNodes.new(b[5..5],ParseNodes.new(b[1..1].to_i),ParseNodes.new(b[4..4],ParseNodes.new(b[2..2].to_i),ParseNodes.new(b[3..3].to_i))))
      k=d.value
        if k == 10
          print b[4..6],"\n"
        end
       
      end
   end
 end
end

p find_ten(a)
  
  
