# -*- coding: utf-8 -*-
class Qll
  class Cell                 # データと次の要素を覚えるセル。Qllクラスだけで使う。
    attr_accessor :d,:nextp  # 要素は外からアクセスできる。
    def initialize(d,nextp)  # Cellのコンストラクタ。dとnextpを覚える。
      @d = d
      @nextp = nextp
    end    
  end
  def initialize()      # Qllのコンストラクタ
    @head = @tail = nil # 最初は空
  end
  def enq(d)                          # dを追加
    if @head == nil                   # 空だったら、
      @head = @tail = Cell.new(d,nil) # 一つCellを作る。それが先頭と末尾。
    else
      @tail.nextp = Cell.new(d,nil)   # 末尾の次に追加し、
      @tail = @tail.nextp             # それを末尾とする。
    end
  end
  def deq()               # 要素を取り出す
    if @head != nil       # 空でなければ、
      d = @head.d         # 先頭の値を取り出し、
      @head = @head.nextp # 次の要素を先頭とし、
      return d            # 取り出した値を返す。
    end
  end
end

def test
  q = Qll.new()
  q.enq(1)
  q.enq(2)
  q.enq(3)
  p q.deq()
  p q.deq()
  q.enq(4)
  q.enq(5)
  q.enq(6)
  q.enq(7)
  while i = q.deq()
    p i
  end
end
