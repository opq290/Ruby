# -*- coding: undecided -*-

load"0529_2.rb"
 exp1=ParseNodes.new(op3,ParseNodes.new(op2,ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(b)),ParseNodes.new(c)),ParseNodes.new(d))
exp2=ParseNodes.new(op2,ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(b)),ParseNodes.new(op3,ParseNodes.new(c),ParseNodes.new(d)))
exp3=ParseNodes.new(op3,ParseNodes.new(op1,ParseNodes.new(op2,ParseNodes.new(b),ParseNodes.new(3)),op1),ParseNodes.new(d))
exp4=ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(op3,ParseNodes.new(op2,ParseNodes.new(b),ParseNodes.new(c)),ParseNodes.new(d)))
exp5=ParseNodes.new(op1,ParseNodes.new(a),ParseNodes.new(op2,ParseNodes.new(b),ParseNodes.new(op3,ParseNodes.new(c),ParseNodes.new(d))))
exp=[exp1.value,exp2.value,exp3.value,exp4.value,exp5.value]
def find_ten
op=["+","-","*","/"]
for a in 0..9
  for b in 0..9
    for c in 0..9
      for d in 0..9
        for i in 0..3
          for j in 0..3
            for k in 0..3
              op1=op[i]
              op2=op[j]
              op3=op[k]
             
              if exp.index(10)==nil
                return [a,b,c,d]
              end
             end
            end
          end
        end
      end
    end
end
end
