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

      def generate_presentation file, options
        # get the absolute path of mdfile provided by user.
        file_with_path = File.expand_path(file)

        # use git to get the project root
        project_root = `git rev-parse --show-toplevel`.strip

        # run mdpress generate command inside the www dir.
        # since this is where we want to keep all the generated code.
        Dir.chdir "#{project_root}/www"
        puts "Generating presentation files..."
        case options[:action]
        when :default
          execute I18n.t "commands.mdpress.gen", { file: file_with_path }
        when :style
          execute I18n.t("commands.mdpress.style", {style: options[:style], file: file_with_path})
        when :watch
          execute I18n.t("commands.mdpress.watch", {file: file_with_path})
        end
      end

      def execute cmd
        Logger.log("[command.execution] executing #{cmd}")
        system cmd
      end
    end
  end
end

