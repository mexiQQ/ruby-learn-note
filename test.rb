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

#**************
puts "**************"

puts "#{24*60*60} 秒"
puts "#{'hellol' * 3} lijianwei"

puts "the time #{def the(a)
                  'the ' + a
                  end
                  the('time')
                } for all good coders"

#%q %Q here document

puts %q<hello world>
puts %Q<hi #{24*60*60}>

string = <<End_Of_String 
hello
lijianwei 
liwenqian
End_Of_String

puts string

puts <<string , <<-string2
  hello
string
  lijianwei
string2

#*************
puts "*************"

class VU
  include Comparable
  attr  :volume
  def initialize(volume) 
    @volume = volume
  end

  def inspect
    '#' * @volume
  end

  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, "Volume is to big") if @volume >= 9
    tmp = @volume + 1
    VU.new(tmp)
  end
end

  medium_volume = VU.new(4)..VU.new(7)
  medium_volume.to_a
  medium_volume.each {|value| puts value.inspect} 

#***************
puts "***************"
# regx

a = Regexp.new('^\s*[a-z]')
b = /^\s*[a-z]/
c = %r{^\s*[a-z]}

# 匹配符号 =～ 肯定匹配!~
name = "fats waller"
puts name =~ /a/
puts name =~ /[\s]/
puts /ll/ =~ name

# $& 匹配内容
# $` 匹配之前
# $' 匹配之后

# *************
re = /(\d+):(\d+)/
md = re.match("Time: 12:34am")
puts md.class # = MatchData
 puts md[0] # == $&
 puts md[1] # == $1
 puts md[2] # == $2

 puts md.pre_match # == $`
 puts md.post_match # == $'

 #**************
 puts "*************"

 puts __FILE__
 puts File.dirname(__FILE__) 
 puts File.basename(__FILE__)
