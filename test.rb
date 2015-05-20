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

#*************
puts "*************"

#method default parameter value

def cool_dude(arg1="Miles",arg2="Coltrans",arg3="Roach")
   "#{arg1},#{arg2},#{arg3}"
end

puts cool_dude
puts cool_dude('Bart')
puts cool_dude('Bart','Elwood')
puts cool_dude('Bart','Elwood','Linus')


def varargs(arg1,*rest)
  "#{arg1} #{rest.join(', ')}"
end

puts varargs("one")
puts varargs("one","two")
puts varargs "one","two","three"

#Method & Block

def take_block(p1)
  if block_given?
    yield(p1)
  else
    p1
  end
end

take_block("no block")
take_block("no block") {|s| s.sub(/no /,"")}

#如果方法定义的最后一个餐素前缀为 & 那么所关联的block 会被转换为一个 Proc 对象 然后赋值给这个参数
 
class TaxCalculator
  def initialize(name,&block)
    @name,@block = name,block
  end

  def get_tax(amount)
    "#@name on #{amount} = #{ @block.call(amount) }"
  end
end

tc = TaxCalculator.new('Sales tax') {|amt| amt*0.075}

puts tc.get_tax(100)
puts tc.get_tax(250)

#return value

puts '***********'
def meth_three
  100.times do |num|
    square = num * num
    return num, square if square > 1000 
  end
end

num , square = meth_three  
puts num 
puts square
puts meth_three.class #Array

def five(a,b,c,d,e)
  "#{a} #{b} #{c} #{d} #{e}"
end

five(1,2,3,4,5)
five(*(10..14).to_a)

# block 更灵活的用法

print "(t)imes or (p)lus:"
times = gets
print "number:"
number = Integer(gets)

if times =~ /^t/
  cals = lambda {|b| b * number}
else
  cals = lambda {|b| b + number}
end

puts ((1..10).collect(&cals).join(', '))

class Fixnum
  # 先将原先的加法存储为别名 old_plus
  alias old_plus + 

  def +(other)
    old_plus(other).old_plus(1) 
  end
end

puts 1 + 2
a = 3
a += 4
puts a + a + a

class Song
  def [](from_time,to_time)
    result = Song.new(self.title + "[extract]",self.artist,to_time-from_time)
    result.set_start_time(from_time)
    result
  end
end

# 使用一下代码试听
# song[0,15].play

# 反引号括住作为操作系统底层命令 
# %x{} 中的内容也被当作操作系统底层命令

`date`
`ls`

%x{ echo "Hello world" }

alias old_backquote `

def `(cmd)
  result = old_backquote(cmd)
  if $? != 0
    fail "Command #{cmd} failed: #$?"
  end
  result
end

print `date`
#print `data`

class Test
  def val=(val)
    @val = val
    return 99
  end
end

t = Test.new
a = t.val = 2
# 按理说 t.val 方法的返回值是 99 所以 a=99
# 新版本将直接使用 参数的值 而返回值被忽略

a # => 2


















