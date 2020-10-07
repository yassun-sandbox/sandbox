provider "random" {}

resource "random_string" "passwoed" {
    length = 32
    special = false
}

