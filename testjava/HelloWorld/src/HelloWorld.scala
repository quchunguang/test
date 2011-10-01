object HelloWorld {
  def main(args: Array[String]) {
    var capital = Map("US" -> "Washington", "France" -> "Paris")
    println(capital("France"))
    System.out.println("HelloWorld")
    val msg = "HI WORLD"
    println(msg)
    println(max(2, 3))
    greet()
    println("Hello, " + args(0) + "!")
    var i = 0
    /*
    while(i<args.length){
      println(args(i))
      i+=1
    }*/
    //args.foreach(arg=>println(arg))
    //args.foreach(println)
    for (arg <- args)
      println(arg)
    val big = new java.math.BigInteger("12345")
    println(big)
    val greetString = new Array[String](3)
    greetString(0) = "HI"
    greetString(1) = "HI"
    greetString(2) = "HI"
    for (i <- 0 to 2)
      println(greetString(i))
    Console println 3. + (2)
    val numNames = Array("zero", "one", "two")
    val onetwo = List(1, 2)
    val threefour = List(3, 4)
    val onefour = onetwo ::: threefour
    println(onefour)
    val onethree = 1 :: 2 :: 3 :: Nil
    println(onethree)
    onefour.foreach(println)
    val pair = (99, "Hi")
    println(pair._2)
    var jetSet = Set("HAHA", "XIXI")
    jetSet += "HEHE"
    println(jetSet.contains("XIX"))
    var treeMap = Map[Int, String]()
    treeMap += (2 -> "AA")
    treeMap += (1 -> "BB")
    println(treeMap(2))
  }
  def max(x: Int, y: Int) = if (x > y) x else y
  def greet() = println("Greet")
}