import scala.Option

class User(private val firstname: String, private val lastname: String)

object User {

  def unapply(user: User) = Option((user.firstname, user.lastname))

  def main(args: Array[String]): Unit = {
    val user = new User("剛次", "赤石")

    user match {
      case User(firstname, lastname) => println(lastname + " " + firstname)
      case _ => println("Not user.")
    }

    val User(firstname, lastname) = user
    println(lastname + " " + firstname)


  }

}

