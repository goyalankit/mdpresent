module Mdpresent
  class Command
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
        execute I18n.t "commands.mdpress.gen", { file: file }
      end

      def execute cmd
        system cmd
      end
    end
  end
end
