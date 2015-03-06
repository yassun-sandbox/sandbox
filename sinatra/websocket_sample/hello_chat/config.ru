require 'app'
require 'hello_chat/backend'

use HelloChat::Backend

run HelloChat::App
