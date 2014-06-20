require "mdpresent/version"
require "mdpresent/command"
require "mdpresent/heroku"
require "mdpresent/scm"
require "mdpresent/logger"
require "mdpresent/home_page_generator"
require "config"

module Mdpresent

  # globals
  PLATFORMS = [ "heroku" ]

  def self.platform
    return :heroku if Git.heroku_remote_present?
  end

  # get the root of gem
  def self.root
    File.expand_path '../..', __FILE__
  end
end
