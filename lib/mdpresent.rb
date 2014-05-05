require "mdpresent/version"
require "mdpresent/command"
require "mdpresent/heroku"
require "config"

module Mdpresent

  # globals
  PLATFORMS = [ "heroku" ]

  # get the root of gem
  def self.root
    File.expand_path '../..', __FILE__
  end
end
