/**
 * Created by ytaga on 2015/03/19.
 */
class MySample [A]{
  var param:A = _
  def get:A = param
  def set(param:A) = this.param = param

  // Functionに型パラメータを付与
  def func[A](arg:A):A = arg

}
