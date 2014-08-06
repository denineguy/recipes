require 'pry'
# regex for recipe
# \d+\W\b(milliliter)|\d+\W\b\liter+|\d+\W\b(gram)+|\d+\W\b(celsius)|\d+\W\b(kilogram)|\d+\W\b(centimeter)

# recipe string = "This is in 12 milliliters and this is in 200 liters and this is in 60 grams telegram 290 celsius there is also 50 kilograms an lastly we have 20 centimeters"

# check if the string includes milliliter, liter, gram, kilogram, centimeter or celsius.  If it does include that then 
# search for the number and the word in front of it split parse number and convert to a us system


def c2f(c)
    (c*9.0/5+32).to_f.round(2)
end

def m2tea(c)
  if c < 14.79
    (c/4.93).to_f.round(2)
  elsif c < 29.57
    (c/14.79).to_f.round(2) 
  end  
end

def l2cup(c)
    (c/0.236).to_f.round(2)
end


def conversion(string)
  # matchers = { '/\d+\s?milliliter/' => "#{m2tea(s[/\d+/].to_i)} teaspoon"}
  # string = 'Today it is 6 milliliter and tomorrow is 25°C.'
  string.gsub(/\d+\s?milliliter/){|s| "#{m2tea(s[/\d+/].to_f)} teaspoon"}.gsub(/\d+\s?°C/){|s| "#{c2f(s[/\d+/].to_i)}°F"}.gsub(/\d+\s?liter/){|s| "#{l2cup(s[/\d+/].to_f)} cups"}
end


  puts conversion("Today it is 25°C and tomorrow 27 °C. Today it is 6 milliliters and tomorrow 10 milliliters. Today it is 2 liter and tomorrow 3 liter.")
  puts conversion("Today it is 6 milliliter and tomorrow is 25°C.")




