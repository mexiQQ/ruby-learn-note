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

#并行赋值
# swap 

a,b = 1, 2
a, b= b,a

x = 0
a,b,c = x , (x+=1), (x+=1)
# => 0,1,2


# ruby  的并行赋值操作  可以叠加和展开数组，如果最后一个左值有一个 前缀 * 那么所有的右值将集中一起，作为数组传给左值 

a = [1,2,3,4,5]
b,c = a # b=1 c=2
b,*c = a # b=1 c = [2,3,4,5]
b,c = 99, *a # b = 99 c= 1
b,*c = 99, *a # b = 99 c =[1,2,3,4,5]

b,(c,d),e = 1,2,3,4 #b==1 c==2 d==nil e==3
b,(c,d),e = 1,[2,3],4 #b==1,c==2,d==3,e==4

#条件执行

#while line = gets
  #process line
#enhd

# 0 和 '' 为真值 任何不是 nil  或者常量 false  都被认为是真值

# && || !  and or not defined?
#

puts defined? 1
puts defined? dummy #=>nil
puts defined? printf
puts defined? String
puts defined? $_
puts defined? Math::PI
puts defined? a = 1
puts defined? 42.abls

#常用比较操作符
#== 测试值是否相等
#=== 用来比较  case  语句的目标和每个 when 语句从项
#<==> 通用比较操作符，格局接受者小雨，等于或大雨其参数，返回1,0,-1
#<, <= ,>=,> 小于 小于等于，大于等于，大于
#=~ != 正则表达式匹配操作符
#eal? 如果接受者和参数有相同的类型和相等的值，则返回真，1==1.0 true,1.eql?(1.0) false
#equal? 如果接受者和参数有相同的对象 ID  返回 true
#

#words["key"] ||= []
# words[key] = words[key]==nil?[]:words[key]
# 如上所示 ，ruby  将本来已经缩减的代码又缩减了
# words[key] = [] if words[key]==nil
#

[]<<2<<3<<4<<5
# 级联式调用，因为每句表达式都会有返回值
#

# then 关键值能使代码更加紧凑
a=1
if a==1 then b="hello"
elsif a==2 then b="hi"
else b="lijiawei"
end

# 使用 : 替换 then  更简洁
if a==1 then b="hello"
elsif a==2 then  b="hi"
else b="lijiawei"
end

# if 是表达式 不是语句 所以有返回值，可以这样使用 

handle = if a > 2 then 3
         else 4
         end
# handle = 4

# 否定形式的 if 语句  unless  如果不
unless 2>3 then c=5
else c=6
end
# 如果 2 不大于 3 的话  c=5

# if  和 unless 的一些灵活用法

#File.foreach("/etc/fstab") do |line|
#  next if line =~ /^#/
#  parse(line) unless line =~ /^$/
#end

# 来个更晦涩难懂的

use_nicknames = 'yes'
artist = "lijianwie"
if artist == "lijianwei"
  artist == "liwenqian"
end unless use_nicknames == "no"

#case  语句的用法 
line = gets
  
case line
when /lijianwein/ then puts "lijiwei"
when /liwenqian/ then puts "liwenqian"
when "quit","exit" then  puts  "quite success"
else 
  #....
end

# ruby 定义了 === 以测试参数是否为该类或者其父类的一个实例

#case shape
#when Square,Rectangle
  #...
#when Circle
  #....
#else 
  #...
#end

# 循环
# while until 

#while line = gets 
  #...
#end

a = 1
until a > 10
  a+=1 # ruby 没有 a++ 的
end
puts a
# 可以用做修饰符
a = 1
a *= 2 while a < 100
a -= 10 until a < 100
puts a 

file = File.open('../../tmp.txt')
while line = file.gets
  puts line if line =~ /father/
end

#  ruby 的内建循环结构很原始，但迭代实现了所有有趣的东西
#

# 例如 ruby 没有for循环结构

3.times do
  print "HO!"
end

0.upto(9) do |x|
  print x
end

0.step(12,3) {|x| print x, "" }

[1,2,3,4,5].each {|val| print val,"  "}

File.open("../../tmp.txt").grep(/father/) do |line|
  puts line
end

# 所有支持 each 方法的类都支持 for in 循环

# 循环控制结构
# break next redo

i = 0
loop do 
  i += 1
  next if i<3
  print i
  break if i>4
end 

# 输出 3 4 5
# redo 从循环头重新执行循环，但不重计算循环条件表达式，或者获得迭代的下一元素

# redo 语句使得一个循环重新执行当前迭代 但是有时你需要重头重新执行一个循环,retry 用于做此事
#

#for i in 1..100
#  print "now at #{i}. Restart?:"
#  retry if gets =~ /^y/i
#end
#
#def do_util(cond)
#  break if cond
#  yield
#  retry
#end
#
#i=0
#do_util(i>10) do
#  print i, " "
#  i+=1
#end

############################
#很重要的一点 while until for 循环等结构虽然内建到ruby 语言中，但没有引入新的作用域
#但被迭代器使用的 block  入 each  loop 中创建的局部变量，无法在 block 外访问
#

[1,2,3,4].each do |x| 
  y = x+1
end
[x,y] #=> error

x,y = nil,nil
[1,2,3,4].each do |x| 
  y = x+1
end
[x,y] #=> [3,4]
# 外部作用域中变量不必有值 ruby 解释器只需看到即可
#

