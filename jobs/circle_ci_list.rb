require 'httparty'
require 'digest/md5'

projects = [
  { user: 'MY_GITHUB_USER_OR_ORG', repo: 'XXX', branch: 'master' },
  { user: 'MY_GITHUB_USER_OR_ORG', repo: 'YYY', branch: 'dev' },
]

def translate_status_to_class(status)
  statuses = {
    'success' => 'passed',
      'fixed' => 'passed',
    'running' => 'pending',
     'failed' => 'failed'
  }
  statuses[status] || 'pending'
end

def update_builds(project, auth_token)
  api_url = 'https://circleci.com/api/v1/project/%s/%s/tree/%s?circle-token=%s'
  api_url = api_url % [project[:user], project[:repo], project[:branch], auth_token]
  api_response =  HTTParty.get(api_url, :headers => { "Accept" => "application/json" } )
  api_json = JSON.parse(api_response.body)
  return {} if api_json.empty?

  latest_build = api_json.select{ |build| build['status'] != 'queued' }.first
  email_hash = Digest::MD5.hexdigest(latest_build['committer_email'])

  data = {
    repo: "#{project[:repo]}",
    branch: "#{latest_build['branch']}",
    widget_class: "#{translate_status_to_class(latest_build['status'])}",
    avatar_url: "http://www.gravatar.com/avatar/#{email_hash}"
  }
  return data
end

SCHEDULER.every '10s', :first_in => 0  do
  items = projects.map{ |p| update_builds(p, ENV['CIRCLE_CI_AUTH_TOKEN']) }
  send_event('circle-ci-list', { items: items })
end