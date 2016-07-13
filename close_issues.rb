require 'uri'
require 'pry'
require 'json'
require 'net/http'

class GithubIssues

attr_reader :github_username, :github_repo


  def initialize(github_username, github_repo)
    @github_username = github_username
    @github_repo = github_repo
    #@response = response

  end

  def fetch
    #auth = {}
    url = URI("https://api.github.com/repos/#{github_username}/#{github_repo}/issues")
    #auth = curl -u paige4521 https://api.github.com
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    headers = {"Authentication" =>  ENV["GITHUB_TOKEN"]}
    request = Net::HTTP::Get.new(url, headers)
    response = http.request(request)
    body = response.read_body
    JSON.parse(body)
  end
end

#puts github_repo
 #GET /repos/:owner/:repo/issues/:number
lisa_issues = GithubIssues.new("paige4521", "close_your_issues").fetch
