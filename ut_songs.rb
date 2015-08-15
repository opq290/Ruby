load("./request.rb")

def ut_songs()
  r0 = Request.new("Tadahitotsu")
  r1 = Request.new("Oozorato")
  r2 = Request.new("Ashiotowo")
  r3 = Request.new("Toukonha")
  r0.next = r1
  r1.next = r2
  r2.next = r3
  r0
end


# version 1.2
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
