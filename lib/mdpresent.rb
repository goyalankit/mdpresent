require "mdpresent/version"
require "mdpresent/command"
require "mdpresent/heroku"
require "mdpresent/scm"
require "mdpresent/logger"
require "mdpresent/home_page_generator"
require "mdpresent/github"
require "config"

module Mdpresent

  # globals
  PLATFORMS = [ "heroku", "github" ]

  def self.platform
    return :heroku if Git.heroku_remote_present?
    return :github if Git.gh_pages_branch_present?
  end

  # get the root of gem
  def self.root
    File.expand_path '../..', __FILE__
  end
end
