object VarianceAnnotations {
  class Animal
  class Person extends Animal
  class Student extends Person

  class School[+T]

  def receive(args: School[Person]) = println("success!!!")

  def main(args: Array[String]): Unit = {
    receive(new School[Person]) //success!!!
    receive(new School[Student]) //success!!!
    //receive(new School[Animal]) NG
  }

}
