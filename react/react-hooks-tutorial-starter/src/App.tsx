import React, { useState } from "react";
import "./App.css";
import { BookToRead } from "./BookToRead";
import BookRow from "./BookRow";

const dummyBooks: BookToRead[] = [
  {
    id: 1,
    title: "はじめてのReact",
    authors: "ダミー",
    memo: ""
  },
  {
    id: 2,
    title: "React Hooks入門",
    authors: "ダミー",
    memo: ""
  },
  {
    id: 3,
    title: "実践Reactアプリケーション開発",
    authors: "ダミー",
    memo: ""
  }
];

const App = () => {
  // 初回レンダリング時にデータを取得
  const [books, setBooks] = useState(dummyBooks);

  // Delete
  const handleBookDelete = (id: number) => {
    // 配列を再代入
    const newBooks = books.filter((b) => b.id !== id);
    setBooks(newBooks);
  };

  // Memo
  const handleBookMemoChange = (id: number, memo: string) => {
    const newBooks = books.map((b) => {
      return b.id === id
        ? { ...b, memo: memo } // bの各プロパティを展開し、memoプロパティだけを上書きした新しいオブジェクトを生成
        : b;
    });
    setBooks(newBooks);
  }

  const bookRows = books.map((b) => {
    return (
      <BookRow
        book={b}
        key={b.id}
        onMemoChange={(id, memo) => handleBookMemoChange(id, memo)}
        onDelete={(id) => handleBookDelete(id)}
      />
    );
  });

  return (
    <div className="App">
      <section className="nav">
        <h1>読みたい本リスト</h1>
        <div className="button-like">本を追加</div>
      </section>
      <section className="main">{bookRows}</section>
    </div>
  );
};

export default App;
