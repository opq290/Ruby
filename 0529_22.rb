def replaceConstant(c1,c2)
  b=x.postorder
  for i in 0..b.length-1
    if b[i..i] == c1
      b[i..i] =c2
    end
  return b
end


def replaceConstant(c1,c2)
if @op.class !=String
  if @op == c1
    @op=c2
  end
else
  @left.replaceConstant(c1,c2)
  @right.replaceConstant(c1,c2)
end
