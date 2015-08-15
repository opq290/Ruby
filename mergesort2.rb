# -*- coding: utf-8 -*-

class MergeSort
  def initialize(a,max=nil)    # 配列を記憶し、最大値＋1を計算
    @a = a
    if max == nil              # maxが知らされなかったら、
      max = @a[0]
      for i in 1..@a.length-1
        if @a[i] > max
          max = @a[i]          # 最大値を計算する
        end
      end
    end
    @max = max+1               # 配列の要素の最大値+1を∞として使う
  end

  def mergeSort(p=0,r=@a.length-1)  # 配列aのpからqまでをマージソートする。p、qが指定されなかったら全体をソート。
    if p < r
      q = (p+r)/2           # 中央で区切る
      mergeSort(p,q)        # 前半をマージソート
      mergeSort(q+1,r)      # 後半をマージソート
      merge(p,q,r)          # 前半と後半をマージする
    end
  end

  def merge(p,q,r)     # p〜qとq+1〜rをマージする
    n1 = q-p+1         # 前半の長さ
    n2 = r-q           # 後半の長さ
    le = @a[p..p+n1-1] # @aのpからp+n1-1までをleにコピー
    le << @max         # ∞を末尾につける（番兵という）
    ri = @a[q+1..q+n2] # @aのq+1からq+n2までをriにコピー
    ri << @max         # ∞を末尾につける（番兵という）
    i = 0              # leの位置
    j = 0              # riの位置
    for k in p..r
      if le[i]<=ri[j]  # 小さいほうを
        @a[k] = le[i]  # @aに格納する
        i += 1
      else
        @a[k] = ri[j]
        j += 1
      end
    end
  end
end

a = []
while (s = gets) != nil
  a << (i = s.to_i)
end  
print a*",","\n"

s = MergeSort.new(a)
s.mergeSort()
print a*",","\n"     # 配列a自体を書き換えていることに注意
