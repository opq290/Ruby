# -*- coding: utf-8 -*-
# :Even = 0; :Right = 1

class Avltree
  attr_accessor :key, :data, :left, :right, :balance # インスタンス変数にアクセスできるようにする。

  def initialize(key,data)
    @key = key
    @data = data
    @left = @right = nil # @right = nil; @left = @rightと同じ。
    @balance = :Even # 「:」をつけたものは記号。
  end

  def search(key)
    if @key > key
      if @left == nil
        return nil
      else
        return @left.search(key)
      end
    end
    if @key < key
      if @right == nil
        return nil
      else 
        return @right.search(key)
      end
    end
    return self # @key == keyの場合
  end
    
  def DoubleRightRotation
    print "DoubleRightRotation before\n"
    tl = @left
    @left = tl.right.right
    tl.right.right = self # selfはそのノード
    tlr = tl.right
    tl.right = tlr.left
    tlr.left = tl
    case tlr.balance
    when :Left
      tlr.right.balance = :Right
      tlr.left.balance = :Even
    when :Right
      tlr.right.balance = :Even
      tlr.left.balance = :Left
    when :Even
      tlr.right.balance = :Even
      tlr.left.balance = :Even
    end
    tlr.balance = :Even
    print "DoubleRightRotation after\n"
    return tlr
  end
    
  def DoubleLeftRotation
    print "DoubleLeftRotation before\n"
    tr = @right
    @right = tr.left.left
    tr.left.left = self
    trl = tr.left
    tr.left = trl.right
    trl.right = tr
    case trl.balance
    when :Right
      trl.left.balance = :Left
      trl.right.balance = :Even
    when :Left
      trl.left.balance = :Even
      trl.right.balance = :Right
    when :Even
      trl.left.balance = :Even
      trl.right.balance = :Even
    end
    trl.balance = :Even
    print "DoubleLeftRotation after\n"
    return trl
  end

  def SingleLeftRotation
    print "SingleLeftRotation before\n"
    tr = @right
    tr.balance = :Even
    @balance = :Even
    @right = tr.left
    tr.left = self
    print "SingleLeftRotation after\n"
    return tr
  end
    
  def SingleRightRotation
    print "SingleRightRotation before\n"
    tl = @left
    tl.balance = :Even
    @balance = :Even
    @left = tl.right
    tl.right = self
    print "SingleRightRotation after\n"
    return tl
  end

  def replace(p,v) # 親ノードpの下にある自分(self)をvに置き換える。
    if p.left == self
      p.left = v
    else 
      p.right = v 
    end
  end

  def insert(key,data) # rootでのみ呼ばれる挿入
    print "insert ",key,"\n"
    if @right == nil
      @right = Avltree.new(key, data)
    else 
      @right.insertx(self,key,data)
    end
  end
    
  def insertx(p,key,data) # replaceを呼ぶために一つ上の親を持っているinsert
    if @key > key
      if @left == nil
        @left = Avltree.new(key, data)
      else 
        if not @left.insertx(self, key, data) # 左の木が生長しなければ、
          return false # 成長しない
        end 
      end
      case @balance
      when :Right
        @balance = :Even
      when :Even
        @balance = :Left
        return true # 成長した
      when :Left
        case @left.balance
        when :Right
          replace(p,DoubleRightRotation())
        when :Even
        when :Left
          replace(p,SingleRightRotation())
        end
      end
      return false # rotationを行うと成長しない
    end
    if @key < key
      if @right == nil
        @right = Avltree.new(key, data)
      else 
        if not @right.insertx(self, key, data)
          return false 
        end 
      end
      case @balance
      when :Left
        @balance = :Even
      when :Even
        @balance = :Right
        return true
      when :Right
        case @right.balance
        when :Left
          replace(p,DoubleLeftRotation())
        when :Even 
        when :Right
          replace(p,SingleLeftRotation())
        end
      end
      return false
    end
    return false # @key == keyの時は何もしないので成長もしない 
  end

  def prints(d)
    print "  "*d,"key=",@key," data=",@data," balance=",@balance,"\n"
    if @left != nil
      print "  "*d,"-left-\n"
      @left.prints(d+1) 
    end
    if @right != nil
      print " "*d,"-right-\n"
      @right.prints(d+1)
    end
  end
end

def test
  root = Avltree.new(0,nil)
  while true do
    print "key="
    a = gets.chomp.to_i
    if a == 0 then
      break
    elsif a > 0 then
      print "data="
      b = gets.chomp
      root.insert(a,b)
      root.prints(0)
    else
      s = root.search(-a)
      if s == nil then
        print "data for key=",-a," not found\n"
      else
        print "data=",s.data,"\n"
      end
    end
  end
end
