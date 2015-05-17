#!/usr/bin/ruby
puts "hello world"

$school = "SDU"
@name = "SCU" 
def say_goodnight name
  #"good night, \n" + name
  #'good night, \n#{name}' 
  "good night, \n#{name}" 
end

puts say_goodnight("lijianwei")
puts "#$school,#$name"

# Array
a = [1,'cat','dog','lijianwei','ball']
puts "#{a[0]}"
puts "#{a[1]}"
puts "#{a[2]}"
puts "#{a[3]}"
puts "#{a[4]}"
puts "#{a[5]}"

a[2] = nil
puts "#{a[2]}"

b = %w{hello lijianwei ni hao}
puts b[2]

# Dictionary
dic1 = {
        'tom'   => 'lijianwei',
        'jerry' => 'lijianweini'
      }
dic2 = {
        tom: 'lijianwei',
        jerry: 'lijianweini'
      }
dic3 = {
        :tom   => 'lijianwei',
        :jerry => 'lijianweini'
      }
puts dic1 
puts dic2 
puts dic3 


# Dictionary 语法糖

dic4 = Hash.new(0)
puts dic4['hello']
dic4['hello'] = dic4['hello'] + 1
puts dic4['hello']

# **********
puts "**************"

animals= %w{my name is lijianwei}
animals.each {|animal| puts animal}

def call_block
  yield
end

call_block {puts 'hello world'}

print 'hello'
print ' world'
print "\n"
