module Mdpresent
  class Command

    require "shellwords"

    class << self
      def path cmd
        exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
        ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
          exts.each { |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
          }
        end
        return nil
      end

      def generate_presentation file
        # get the absolute path of mdfile provided by user.
        file_with_path = File.expand_path(file)

        # use git to get the project root
        project_root = `git rev-parse --show-toplevel`.strip

        # run mdpress generate command inside the www dir.
        # since this is where we want to keep all the generated code.
        Dir.chdir "#{project_root}/www"
        puts "Generating presentation files..."
        execute I18n.t "commands.mdpress.gen", { file: file_with_path }
      end

      def execute cmd
        Logger.log("[command.execution] executing #{Shellwords.escape(cmd)}")
        system cmd
      end
    end
  end
end

