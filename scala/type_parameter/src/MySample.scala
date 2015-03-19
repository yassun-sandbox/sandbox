/**
 * Created by ytaga on 2015/03/19.
 */
class MySample1 [A]{
  var param:A = _
  def get:A = param
  def set(param:A) = this.param = param

  // Functionに型パラメータを付与
  def func[A](arg:A):A = arg

}

/* 型パラメータ制約 */
class Base
class Ex1 extends Base
class Ex2 extends Ex1

/* 上限境界 */
// Base or Baseのサブクラスのみ
class MySample2[A <: Base]

/* 下限境界 */
// Base or Baseのスーパークラスのみ
class MySample3[A >: Base]

/* 上限と下限の同時設定 */
// Base or Baseのみ
class MySample4[A >: Ex1 <: Base]

/* クラス定義 */
// メソッド名:doit 戻り値:Unitを持つ型
class MySample5[A <: {def doit():Unit}]

