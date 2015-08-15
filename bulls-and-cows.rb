# -*- coding: utf-8 -*-
class BullsAndCows
  def initialize
    @secret = [0,0,0] # 3つの数
    @used = Array.new(10,false) # その数を使っているかを表す配列 @used[0]は使用しない
    t = Array.new(9) 
    for i in 0..8
      t[i] = i+1      # t = [1,2,3,4,5,6,7,8,9]としておく。
    end
    for i in 0..2
      j = ((9-i)*rand()).to_i # 1回目は0〜8の乱数、2回目は0〜7の乱数、3回目は0〜6の乱数
      @secret[i] = t[j]       # 1回目は1〜9のどれか、2回目は1〜8のどれか、3回目は1〜7のどれか。
      t[j] = t[8-i]           # 1回目はt[0]〜t[7]に使ってない数、2回目はt[0]〜t[6]に使ってない数を入れる。
      @used[@secret[i]] = true # used[j]がtrueならjは@secretのなかにある。
    end
  end

  def guess(x)
    bulls = 0                # 場所も含めて一致している数
    for i in 0..2
      if x[i] == @secret[i]  # 同じ位置iに同じ数なら、
        bulls += 1
      end
    end
    cows = 0                  # 場所と無関係に一致している数
    for i in 0..2
      if @used[x[i]]          # x[i]が@secretのなかにあれば、
        cows += 1
      end
    end
    cows -= bulls             # 場所が一致している分を補正
    [bulls,cows]
  end
end
