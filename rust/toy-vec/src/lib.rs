pub struct ToyVec<T> {
    elements: Box<[T]>,
    len: usize,
}

// Default: https://www.utam0k.jp/blog/2018/05/28/rust_std_default/
impl<T: Default> ToyVec<T> {
    pub fn new() -> Self {
        Self::with_capacity(0)
    }

    pub fn with_capacity(capacity: usize) -> Self {
        Self {
            elements: Self::allocate_in_heap(capacity),
            len: 0,
        }
    }

    // Vecを作成してBoxに変換
    fn allocate_in_heap(size: usize) -> Box<[T]> {
        std::iter::repeat_with(Default::default)
            .take(size)
            .collect::<Vec<_>>()
            .into_boxed_slice()
    }

    // 格納数
    pub fn len(&self) -> usize {
        self.len
    }

    pub fn capacity(&self) -> usize {
        self.elements.len()
    }

    // elementはmove
    pub fn push(&mut self, element: T) {
        // 足りなくなったら増やす
        if self.len == self.capacity() {
            self.grow();
        }
        self.elements[self.len] = element;
        self.len += 1;
    }

    // usizeはcopy
    pub fn get(&self, index: usize) -> Option<&T> {
        if index < self.len {
            Some(&self.elements[index])
        } else {
            None
        }
    }

    // 戻り値が参照型のとき、以下のルールでライフタイムを決める
    // - 参照方の引数が1だけある場合はそれと同じライフタイムになる
    // - 第一引数がselfの場合はそれと同じライフタイムになる。
    // - その他の場合は明示的にライフタイムを指定しなければならない。
    pub fn get_or<'a>(&'a self, index: usize, default: &'a T) -> &'a T {
        self.get(index).unwrap_or(default)
    }

    pub fn pop(&mut self) -> Option<T> {
        if self.len == 0 {
            None
        } else {
            self.len -= 1;
            // selfの所有しているものの所有権を渡せないので入れ替える
            let elem = std::mem::replace(&mut self.elements[self.len], Default::default());
            Some(elem)
        }
    }

    fn grow(&mut self) {
        if self.capacity() == 0 {
            self.elements = Self::allocate_in_heap(1);
        } else {
            let new_elements = Self::allocate_in_heap(self.capacity() * 2);
            // https://qiita.com/quasardtm/items/b54a48c1accd675e0bf1
            let old_elements = std::mem::replace(&mut self.elements, new_elements);
            // 以下ケースはエラーになる。
            // let old_element = self.element ・・・self.elementの所有権をold_elementに移動/self.elementは未初期化状態になる
            // ※この場合はself.elementの所有権を移動しようとしているのでNG(所持しているのはselfの所有権でelement(Box[T])の所有権は持っていない。)
            // self.elements = Self::allocate_in_heap(self.capacity() * 2); ・・・未初期化扱いの変数は利用できないルールに該当するためエラー
            for (i, elem) in old_elements.into_vec().into_iter().enumerate() {
                self.elements[i] = elem;
            }
        }
    }
}

