require 'thor'
require 'mdpresent'

module Mdpresent
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc "new", "create a new project for presentations"
    def new(dir_name)
      begin
        FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)
        FileUtils.cp_r(Dir.glob("lib/mdpresent/templates/*") , dir_name)
      rescue
        puts $!, $@
      end

    end
  end
end
