#! /usr/bin/env ruby
require_relative 'app'
require_relative 'book'
require_relative 'classroom'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

def main
  lib = App.new
  lib.run
end

main
