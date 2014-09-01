require 'tk'

Tklabel1.new {
  text "Hello, World"
  bg   "red"
  pack
}

TkButton.new {
  text    "Close"
  command { exit }
  pack 
}

Tk.mainloop

