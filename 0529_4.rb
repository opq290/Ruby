# -*- coding: utf-8 -*-
class ParseNodes
  def initialize(op,left=nil,right=nil)
    @op = op 
    @left = left
    @right = right 
  end
  
  def value                                    
    if @op.class != String 
      return @op                  
    else
      l = @left.value  
      r = @right.value
      case @op 
      when "+"
        return l+r
      when "-"
        return l-r
      when "*"
        return l*r
      when "/"
          if r==0
        return 0
          else
        return l.to_f/r
          end
      end
    end
  end
  
  def inorder   
    if @op.class != String
      return @op.to_s 
    else
      return "(" + @left.inorder + @op + @right.inorder + ")"
    end
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
end

    
  
  def preorder  
    if @op.class != String
      return @op.to_s 
    else
      return @op + "(" + @left.preorder + "," + @right.preorder + ")"
    end
  end
  
  def postorder 
    if @op.class != String
      return @op.to_s  
    else
      return @left.postorder + @right.postorder + @op
    end
  end

 def left
 @left
 end

def right
  @right
end

def find(t1,t2)
  if t1.postorder == t2.postorder
     true
  else
    if t1.left !=nil
      if find(t1.left,t2) == nil
         if t1.right != nil
            find(t1.right,t2)
         else
           nil
         end
      else
        true
      end
    else
      if t1.right != nil
        find(t1.right,t2)
      else
        nil
      end
    end
 end
  
end
   


end
      

     
def test
  x = ParseNodes.new("*",             # *の演算子
                   ParseNodes.new(2), # *の左の式
                   ParseNodes.new("+",ParseNodes.new(3),ParseNodes.new(4)))
  y =ParseNodes.new(3)
 
 x.find(x,y)
end



load"kmp.rb"   #部分文字列の探索のアルゴリズムを利用した方法
def find(t1,t2)
    a=Kmp.new(t2.inorder)
    a.match(t1.inorder)
end

def test
    t1=ParseNodes.new("*",ParseNodes.new(2),ParseNodes.new("+",ParseNodes.new(3),ParseNodes.new(4)))
    t2=ParseNodes.new("+",ParseNodes.new(3),ParseNodes.new(4))
    p find(t1,t2)
end


