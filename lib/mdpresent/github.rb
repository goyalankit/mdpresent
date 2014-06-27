module Mdpresent
  class Github

    attr_accessor :github

    class << self
      def setup
        Git.setup
        # setup the repo if not already set
        setup_repo unless Git.origin_remote_present?

        create_gh_pages_branch unless Git.gh_pages_branch_present?
      end

      def create_gh_pages_branch
        Command.execute I18n.t("commands.github.create_gh_pages")
      end

      def setup_repo

        user_name = gets("Enter your github username: ")
        repo_name = gets("Enter the repo name: ")

        # add remote to git
        unless user_name.nil? || user_name.empty? || repo_name.nil? || repo_name.empty?
          success = Git.git_add_remote(user_name, repo_name)
          fail("unable to add git remote") unless success
        end
      end
    end
  end
end

