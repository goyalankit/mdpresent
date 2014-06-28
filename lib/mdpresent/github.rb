module Mdpresent
  class Github
    require 'launchy'
    attr_accessor :github

    class << self
      def setup
        Git.setup_git
        # setup the repo if not already set
        setup_repo unless Git.origin_remote_present?

        success = make_initial_commit

        abort "Aborting..git add was unsucessful" unless success

        create_gh_pages_branch unless Git.gh_pages_branch_present?

        Command.execute I18n.t("commands.git.checkout_master")
      end

      def make_initial_commit
        success = true
        success &&= Command.execute I18n.t("commands.git.initial_add")
        success &&= Command.execute I18n.t("commands.git.initial_commit", date_time: Time.now)
      end

      def create_gh_pages_branch
        Command.execute I18n.t("commands.github.create_gh_pages")
      end

      def setup_repo

        print "Enter your github username: "
        user_name = $stdin.gets
        print "Enter the repo name: "
        repo_name = $stdin.gets

        # add remote to git
        unless user_name.nil? || user_name.empty? || repo_name.nil? || repo_name.empty?
          success = Git.git_add_remote(user_name, repo_name)
          fail("unable to add git remote") unless success
        end
      end

      def deploy
        Command.execute I18n.t("commands.github.switch_to_gh_page")
        Command.execute I18n.t("commands.github.merge_master")
        Command.execute I18n.t("commands.github.switch_to_master")
        Command.execute I18n.t("commands.github.push_gh_pages_to_github")
      end

      def open
        url = `git config --get remote.origin.url`
        user_name, repo_name = url.strip.match(/http:\/\/github.com\/(.*)\/(.*)/).captures
        Launchy.open("http://#{user_name}.github.com/#{repo_name}")
      end
    end # end of self
  end # end of class
end # end of module

