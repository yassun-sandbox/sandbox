import React, { useState } from "react";
import "./App.css";
import { BookToRead } from "./BookToRead";
import BookRow from "./BookRow";
import Modal from "react-modal";
import BookSearchDialog from "./BookSearchDialog";
import {BookDescription} from "./BookDescription";

// モーダル表示時にオーバーレイで覆うDOM領域
Modal.setAppElement("#root");

const customStyles = {
  overlay: {
    backgroundColor: "rgba(0, 0, 0, 0.8)"
  },
  content: {
    top: "50%",
    left: "50%",
    right: "auto",
    bottom: "auto",
    marginRight: "-50%",
    padding: 0,
    transform: "translate(-50%, -50%)"
  }
};

const App = () => {
  // 初回レンダリング時にデータを取得
  const [books, setBooks] = useState([] as BookToRead[]);

  // モーダルが開いているかどうか。
  const [modalIsOpen, setModalIsOpen] = useState(false);

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

  // モーダルのON/OFF
  const handleAddClick = () => {
    setModalIsOpen(true);
  };

  const handleModalClose = () => {
    setModalIsOpen(false);
  };

  // 書籍追加ボタン
  const handleBookAdd = (book: BookDescription) => {
    const newBook: BookToRead = { ...book, id: Date.now(), memo: "" };
    const newBooks = [...books, newBook]; //末尾に追加
    setBooks(newBooks);
    setModalIsOpen(false);
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
      <div className="button-like" onClick={handleAddClick}>
        本を追加
      </div>
    </section>
    <section className="main">{bookRows}</section>
    <Modal
      isOpen={modalIsOpen}
      onRequestClose={handleModalClose}
      style={customStyles}
    >
      <BookSearchDialog maxResults={20} onBookAdd={(b) => handleBookAdd(b)} />
    </Modal>
  </div>
  );
};

export default App;
