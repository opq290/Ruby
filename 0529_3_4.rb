load"0529_2.rb"
def whole_value(a,b,c,d)
  val=Array.new
 op=["+","-","*","/"]
  for i in 0..3
     for j in 0..3
        for k in 0..3
              op1=op[i]
              op2=op[j]
              op3=op[k]
              exp1=ParseNodes.new(op3,ParseNodes.new(op2,ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(b)),ParseNodes.new(c)),ParseNodes.new(d))
              exp2=ParseNodes.new(op2,ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(b)),ParseNodes.new(op3,ParseNodes.new(c),ParseNodes.new(d)))
              exp3=ParseNodes.new(op3,ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(op2,ParseNodes.new(b),ParseNodes.new(c))),ParseNodes.new(d))
              exp4=ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(op3,ParseNodes.new(op2,ParseNodes.new(b),ParseNodes.new(c)),ParseNodes.new(d)))
              exp5=ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(op2,ParseNodes.new(b),ParseNodes.new(op3,ParseNodes.new(c),ParseNodes.new(d))))
              val << exp1.value.to_i
              val << exp2.value.to_i
              val << exp3.value.to_i
              val << exp4.value.to_i
              val << exp5.value.to_i
              
              
         end
       end
    end
 val
 end

def find_not_ten
 result= Array.new
  for a in 0..9
    for b in 0..9
      for c in 0..9
        for d in 0..9
          if whole_value(a,b,c,d).index(10) == nil
            result << [a,b,c,d].sort
          end
         end
        end
      end
    end
  result.uniq
end
           
            
p find_not_ten 






