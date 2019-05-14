require "cobo/version"
require "cobo/utils"
require "cobo/request"
require "cobo/custody"
require 'rest-client'
require 'openssl'

module Cobo
  class << self
    attr_accessor :key, :secret, :sandbox
  end
end