load"kmp.rb"
load"0529_2.rb"
def find(t1,t2)
 a=Kmp.new(t2.inorder)
 a.match(t1.inorder)
end

def test
 t1=ParseNodes.new("*",ParseNodes.new(2),ParseNodes.new("+",ParseNodes.new(3),ParseNodes.new(4)))
 t2=ParseNodes.new("+",ParseNodes.new(3),ParseNodes.new(4))
p find(t1,t2)
end