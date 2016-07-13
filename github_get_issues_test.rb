require 'minitest/autorun'
require 'minitest/pride'
require './issues_reader'
require 'pry'
require 'minitest/focus'

class GetGitHubIssues
  def perform_request(perform)
    File.read("./github_get_issues.json")
  end
end

class IssuesReaderTest < Minitest::Test

  def test_we_can_get_issues
    pull_gh_issue = GitHubIssuesRetriever.new("close_your_issues","paige4521")

    all_info = puller.get_issues!
    assert_equal "Issue One", all_info[0]["title"]

  end
end
