# -*- coding: utf-8 -*-
class BitVector
  def initialize(size)
    @intSize = 32                          # 配列１要素あたりのビット数を32とする
    @size = size                           # トータルのビット数
    @sieve = Array.new(@size/@intSize+1,0) # トータルのビット数を格納するのに必要な要素数
  end

  def set(i)                        # iビット目を1にする
    j = i/@intSize                  # 要素の位置
    k = i%@intSize                  # ビット位置
    @sieve[j] = @sieve[j] | (1<<k)  # その要素のそのビットを1とする
  end
  
  def bit(i)                         # iビット目が1かどうか判定する
    j = i/@intSize                   # 要素の位置
    k = i%@intSize                   # ビット位置
    return (@sieve[j] & (1<<k)) != 0 # その要素のそのビットが1かどうか
  end

  def size       # ビット数を返す
    return @size
  end
end

def findPrime(size)       # size-1までの素数を求める
  v = BitVector.new(size) # ビット数sizeのBitVectorを作る
  for i in 2..v.size-1    # iは、
    if not v.bit(i)       # iビット目が1でなければ、
      print i,"\n"        # 素数なので表示する。
      j = 2*i             # iの2倍、3倍、4倍、。。。を
      while j < v.size    # 全て、
        v.set(j)          # iビット目を1にしておく→素数でないと判定される
        j += i
      end
    end
  end
end
