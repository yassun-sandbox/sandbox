module.exports = {
  devtool: 'inline-source-map',
  entry: {
    entry: './src/javascripts/entry.js',
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
