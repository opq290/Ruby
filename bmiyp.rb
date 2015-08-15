load("./bmi.rb")
load("./yardpound.rb")

def bmi_yp(f,i,p,o)
  bmi(feet_to_cm(f,i),pound_to_kg(p,o))
end

