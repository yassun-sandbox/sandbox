/**
 * Created by ytaga on 2015/03/19.
 */
// 非変 Base のみが指定可能
class Foo1[T] {
}

// 共変 Base または Baseのサブクラスが指定可能
class Foo2[+T] {
}

// 反変 Base または Baseのスーパクラスが指定可能
class Foo3[+T] {
}

class Base
class Ex extends Base


