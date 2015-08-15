# -*- coding: utf-8 -*-
# 式木を表すノードのクラス
# 簡単のため、演算ノードと葉を兼用
#

class ParseNodes
  def initialize(op,left=nil,right=nil)
    @op = op # 演算子
    @left = left # 左の子(葉の時は使用しない)
    @right = right # 右の子(葉の時は使用しない)
  end
  
  def value                                    # 式の値を再帰的に計算する
    if @op.class != String # @opが数値なら葉
      return @op                  # 葉ならその値を返す
    else
      l = @left.value  # 左の子の値
      r = @right.value # 右の子の値
      case @op # @opの値によって場合分け
      when "+"
        return l+r
      when "-"
        return l-r
      when "*"
        return l*r
      when "/"
        return l/r
      end
    end
  end
  
  def inorder   # in orderの文字列に変換する
    if @op.class != String
      return @op.to_s # 葉ならその値の文字列
    else
      return "(" + @left.inorder + @op + @right.inorder + ")"
    end
  end
  
  def preorder  # pre orderの文字列に変換する
    if @op.class != String
      return @op.to_s  # 葉ならその値の文字列
    else
      return @op + "(" + @left.preorder + "," + @right.preorder + ")"
    end
  end
  
  def postorder  # post orderの文字列に変換する
    if @op.class != String
      return @op.to_s  # 葉ならその値の文字列
    else
      return @left.postorder + " " + @right.postorder + @op
    end
  end
end
def replaceConstant(C1,C2)
  if @op.class = C1
    return C2
  end
end
    
def test
  x = ParseNodes.new("*",             # *の演算子
                   ParseNodes.new(2), # *の左の式
                   ParseNodes.new("+",ParseNodes.new(3),ParseNodes.new(4)) # * の右の式
                   )

  print x.inorder,"\n"   # in orderで表示
  print x.preorder,"\n"  # pre orderで表示
  print x.postorder,"\n" # post orderで表示
  print x.value,"\n"     # 値を表示
end
