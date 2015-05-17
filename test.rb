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

#***************
puts "**************"

class File
  def File.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close
  end
end

File.open_and_process("/Users/liwenqian/Desktop/tmp.txt","r") do |file|
  while line = file.gets
    puts line
  end
end

# 其实不需要自己写这个 open_and_process 的类方法 ，open 方法本身就支持 block 处理完成后自动关闭文件，但是前提是传入了 block 参数，有种 Kenel.block.given? 的味道

