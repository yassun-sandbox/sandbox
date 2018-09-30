package trace

import (
	"fmt"
	"io"
)

// Tracerはコード内での出来事を記録できるオブジェクトを表すインタフェースです。
type Tracer interface {
	// 任意のオブジェクトを任意の数だけ格納できる。
	Trace(...interface{})
}

// Tracerインタフェースに合致したオブジェクト
// tracer の中身を知らなくても大丈夫
func New(w io.Writer) Tracer {
	return &tracer{out: w}
}

type tracer struct {
	out io.Writer
}

// 任意のオブジェクトを任意の数だけ格納する: a
func (t *tracer) Trace(a ...interface{}) {

	// 可変引数を展開して渡す
	t.out.Write([]byte(fmt.Sprint(a...)))
	t.out.Write([]byte("\n"))
}
