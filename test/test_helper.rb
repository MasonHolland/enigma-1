gem 'simplecov', :require => false, :group => :test
require 'simplecov'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/enigma'
require './lib/cipher'
require './lib/encrypt'
require './lib/crack'

SimpleCov.start

require 'pry'
