# -*- coding: utf-8 -*-
class Kmp
  def initialize(pat)
    @pat = pat # 検索したい文字列を記録
    @pi = Array.new(@pat.length,0) # πを生成
    @pi[0] = -1 # 0文字目の次にみる場所はないので-1としておく。
    k = -1
    for q in 1..@pat.length-1
      while k >= 0 && @pat[k+1..k+1] != @pat[q..q]
        k = @pi[k] # k文字目まで一致している場合に次の文字が一致しなかったらπ(k)文字目まで一致しているところに移動。
      end
      if @pat[k+1..k+1] == @pat[q..q]
        k += 1 # 次の文字が一致したらk+1文字目まで一致
      end
      @pi[q] = k # q文字目まで一致している時、その前はk文字目まで一致。
    end
  end
  
  def match(t) # πを使って一致を検出
    q = -1
    for i in 0..t.length-1 # 入力文字列に従って、
      while q >= 0 && @pat[q+1..q+1] != t[i..i]
        q = @pi[q] # 次の文字が一致するまで、一致位置を前に戻す。
      end
      if @pat[q+1..q+1] == t[i..i]
        q += 1 # 一致していたら一致位置を増やす
      end
      if q == @pat.length-1 # 末尾まできていたら、
        print("match at ",(i+1-@pat.length),"\n") # 表示して、
        q = @pi[q] # 一致位置を一つ前に戻す。
      end
    end
  end
end

def test
  x = Kmp.new("waniwaniwato") # 探したい文字列でπを計算しておく。
  x.match("uraniwaniwaniwaniwatoriairu") # πを利用して検索する。
end
