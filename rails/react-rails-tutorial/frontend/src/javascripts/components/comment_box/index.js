import React, { Component } from 'react'

class CommentBox extends React.Component {
    constructor(props) {
      super(props)
      this.state = {data: []}
    }

    loadCommentsFromServer() {
      $.ajax({
        url: this.props.url,
        dataType: 'json',
        success: function(result) {
          this.setState({data: result.data});
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    }

    componentDidMount() {
      this.loadCommentsFromServer();
      setInterval(this.loadCommentsFromServer, this.props.pollInterval);
    }

    render() {
      return (
        <div className="commentBox">
          <h1>Comments</h1>
          <CommentList data={this.state.data} />
          <CommentForm />
        </div>
      );
    }
}
window.CommentBox = CommentBox;

class CommentList extends React.Component {
  render() {
    var commentNodes = this.props.data.map(function (comment) {
      return (
        <Comment author={comment.author}>
          {comment.text}
        </Comment>
      );
    });
    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
};

class CommentForm extends React.Component {
  render() {
    return (
      <div className="commentForm">
        Hello, world! I am a CommentForm.
      </div>
    );
  }
};

class Comment extends React.Component {
  render() {
  return (
    <div className="comment">
      <h2 className="commentAuthor">
        {this.props.author}
      </h2>
      {this.props.children}
    </div>
    );
  }
};

