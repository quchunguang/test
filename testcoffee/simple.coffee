# [Ref]: http://coffee-script.org/

number   = 42
opposite = true
number = -42 if opposite

square = (x) -> x * x
list = [1, 2, 3, 4, 5]

math =
        root: Math.sqrt
        square: square
        cube: (x) -> x * square(x)

race = (winner, runner) -> console.log winner, runner
race number, opposite

alert "I new it" if elvis?

cubs = (math.cube num for num in list)
console.log "number = " + square(number)

fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."
console.log fill 'OK'

bitlist = [
  1, 0, 1
  0, 0, 1
  1, 1, 0
]
kids =
  brother:
    name: "Max"
    age:  11
  sister:
    name: "Ida"
    age:  9

outer = 1
changeNumbers = ->
  inner = -1
  outer = 10
inner = changeNumbers()

gold = silver = rest = "unknown"
awardMedals = (first, second, others...) ->
  gold   = first
  silver = second
  rest   = others
contenders = [
  "Michael Phelps"
  "Liu Xiang"
  "Yao Ming"
  "Allyson Felix"
  "Shawn Johnson"
  "Roman Sebrle"
  "Guo Jingjing"
  "Tyson Gay"
  "Asafa Powell"
  "Usain Bolt"
]
awardMedals contenders...
console.log "Gold: " + gold
console.log "Silver: " + silver
console.log "The Field: " + rest

eat = console.log
menu = (s...) -> console.log "*", s
# 吃午饭.
eat food for food in ['toast', 'cheese', 'wine']
# 精致的五道菜.
courses = ['greens', 'caviar', 'truffles', 'roast', 'cake']
menu i + 1, dish for dish, i in courses
# 注重健康的一餐.
foods = ['broccoli', 'spinach', 'chocolate']
eat food for food in foods when food isnt 'chocolate'

countdown = (num for num in [10..1] by -2)
console.log countdown

yearsOld = max: 10, ida: 9, tim: 11
ages = for child, age of yearsOld
  "#{child} is #{age}"
console.log ages

# 摇篮曲
num = 6
lyrics = while num -= 1
  "#{num} little monkeys, jumping on the bed.
    One fell out and bumped his head."
console.log lyrics

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers[3..6] = [-3, -4, -5, -6]

grade = (student) ->
  if student.excellentWork
    "A+"
  else if student.okayStuff
    if student.triedHard then "B" else "B-"
  else
    "C"
eldest = if 24 > 21 then "Liz" else "Ike"

six = (one = 1) + (two = 2) + (three = 3)

# 前十个全局属性(变量).
window = {'a':1, 'b':2, 'c':3, 'd':4}
globals = (name for name of window)[0...2]
console.log globals

alert = console.log
alert(
  try
    nonexistent / undefined
  catch error
    "And the error is ... #{error}"
)

solipsism = true if mind? and not world?
speed = 1
speed ?= 15
footprints = yeti ? "bear"
# zip = lottery.drawWinner?().address?.zipcode


class Animal
  constructor: (@name) ->

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"
sam.move()
tom.move()

String::dasherize = ->
  this.replace /_/g, "-"

theBait   = 1000
theSwitch = 0
[theBait, theSwitch] = [theSwitch, theBait]

weatherReport = (location) ->
  # 发起一个 Ajax 请求获取天气...
  [location, 72, "Mostly Sunny"]
[city, temp, forecast] = weatherReport "Berkeley, CA"

futurists =
  sculptor: "Umberto Boccioni"
  painter:  "Vladimir Burliuk"
  poet:
    name:   "F.T. Marinetti"
    address: [
      "Via Roma 42R"
      "Bellagio, Italy 22021"
    ]
{poet: {name, address: [street, city]}} = futurists

tag = "<impossible>"
[open, contents..., close] = tag.split("")

# text = "Every literary critic believes he will outwit history and have the last word"
# [first, ..., last] = text.split " "

class Person
  constructor: (options) ->
    {@name, @age, @height} = options

tim = new Person age: 4


Account = (customer, cart) ->
  @customer = customer
  @cart = cart

  $('.shopping_cart').bind 'click', (event) =>
    @customer.purchase @cart

hi = `function() {
  return [document.title, "Hello JavaScript"].join(": ");
}`

day = "Tue"
go = (work) -> console.log ("go " + work)
switch day
  when "Mon" then go "work"
  when "Tue" then go "relax"
  when "Thu" then go "iceFishing"
  when "Fri", "Sat"
    if day is bingoDay
      go "bingo"
      go "dancing"
  when "Sun" then go "church"
  else go "work"

score = 76
grade = switch
  when score < 60 then 'F'
  when score < 70 then 'D'
  when score < 80 then 'C'
  when score < 90 then 'B'
  else 'A'
# grade == 'C'

try
  allHellBreaksLoose()
  catsAndDogsLivingTogether()
catch error
  console.log error
finally
  console.log "cleanUp()"

cholesterol = 127
healthy = 200 > cholesterol > 60
console.log healthy

author = "Wittgenstein"
quote  = "A picture is a fact. -- #{ author }"
sentence = "#{ 22 / 7 } is a decent approximation of π"

mobyDick = "Call me Ishmael. Some years ago --
  never mind how long precisely -- having little
  or no money in my purse, and nothing particular
  to interest me on shore, I thought I would sail
  about a little and see the watery part of the
  world..."

html = """
       <strong>
         cup of coffeescript
       </strong>
       """

###
SkinnyMochaHalfCaffScript Compiler v1.0
Released under the MIT License
###

OPERATOR = /// ^ (
  ?: [-=]>             # 函数
   | [-+*/%<>&|^!?=]=  # 复合赋值 / 比较
   | >>>=?             # 补 0 右移
   | ([-+:])\1         # 双写
   | ([&|<>])\2=?      # 逻辑 / 移位
   | \?\.              # soak 访问
   | \.{2,3}           # 范围或者 splat
) ///
