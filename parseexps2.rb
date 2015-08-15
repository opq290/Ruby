# -*- coding: utf-8 -*-
# 式木を表すノードのクラス
# 簡単のため、演算ノードと葉を兼用
# 簡単な構文解析
#

load"parses2.rb"

class ParseExp           # 構文解析をするクラス
  def initialize(line)   # 渡された1行を解析する
    @line=line           # 順次読み出せるように保存
  end
  def isValue            # 次の文字が値である
    return @line.length > 0 && "0" <= @line[0..0] && @line[0..0] <= "9"
  end
  def getValue           # 次の文字を数値として取り出す
    f = @line[0..0].to_f # ここでは数値は1文字のみ
    @line[0..0] = ""     # 先頭文字を削る
    return f
  end
  def isSpecial          # 次の文字が記号(数値でない)
    return @line.length > 0 && !("0" <= @line[0..0] && @line[0..0] <= "9")
  end
  def peekSpecial        # 次の文字を見る(削らない)
    if @line.length > 0 
      return @line[0..0]
    else
      return nil
    end
  end
  def getSpecial          # 次の文字を取りだす
    if @line.length > 0
      l = @line[0..0]
      @line[0..0] = ""    # 先頭文字を削る
      return l
    else
      return nil
    end
  end
  def e # @lineから「式」を取り出す
    nd = t # 「項 + 項 + 項 + ...」の最初の「項」
    while(isSpecial && (peekSpecial == '+') || (peekSpecial == '-')) # 次が「+」か「-」なら、
      op = getSpecial # 演算子を保存
      nd = ParseNodes.new(op,nd,t) # 演算子の右の項を取得。「項 + 項 (+...)」の「項 + 項」を生成。「(項 + 項) +...」の2つ目の「+」以降はwhileの次の繰り返しで。
    end
    return nd
  end
  def t # @lineから「項」を取り出す
    nd = f # 「因子 * 因子 * 因子 * ...」の最初の因子
    while(isSpecial && (peekSpecial == '*') || (peekSpecial == '/')) # 次が「*」か「-」なら、
      op = getSpecial() # 演算子を保存
      nd = ParseNodes.new(op,nd,f) # 演算子の右の因子を取得。「因子 * 因子 (+...)」の「因子 * 因子」を生成。「(因子 * 因子) *...」の2つ目の「*」以降はwhileの次の繰り返しで。
    end
    return nd
  end
  def f # @lineから「因子」を取り出す
    if isValue # 数値なら
      return ParseNodes.new(getValue) # 葉を生成
    end
    if isSpecial && peekSpecial == '(' # '('なら
      getSpecial # 式の前の'('を読み飛ばし、
      nd = e # '()'中の式を読み、
      getSpecial # 式の後の')'を読み飛ばす。
      return nd
    end
    return nil
  end
end

def test
  p n = ParseExp.new(gets.chomp).e # getsで一行入力。chompで改行を削除。生成したオブジェクトにeを適用して式木を作る。
  print n.inorder,"\n"
  print n.preorder,"\n"
  print n.postorder,"\n"
  print n.value,"\n"
end
