load"0529_2.rb"
 def whole(a,b,c,d)
   exp=Array.new(5)
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
     exp=[exp1.inorder,"",exp2.inorder,"",exp3.inorder,"",exp4.inorder,"",exp5.inorder]
     val=[exp1.value,exp2.value,exp3.value,exp4.value,exp5.value]
      print exp,"\n"
     end
    end
  end
      
end

def all_4
  for a in 0..9
    for b in 0..9
      for c in 0..9
        for d in 0..9
          p whole(a,b,c,d)
          end
        end
      end
    end
  end

p all_4
