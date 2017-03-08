module.exports = {
  devtool: 'inline-source-map',
  entry: {
    entry: './src/javascripts/entry.js',
    comment_box: './src/javascripts/components/comment_box/',
  },
  output: {
    path: '../app/assets/javascripts/',
    filename: '[name].js'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015'],
          plugins: ['transform-react-jsx'],
        }
      }
    ]
  }
}
