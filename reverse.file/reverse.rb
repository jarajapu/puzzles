#!/usr/bin/ruby
#
require 'awesome_print'

fh = File.open('input.txt')

words = fh.read.scan(/[\w]+/).reverse

ap words

fh.close

