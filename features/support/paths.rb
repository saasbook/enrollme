# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the (.*)_user page$/i
      "/users/" + $1
    when /^the (.*)_admin page$/i
      "/admins/" + $1
    when /^the team "([^"]*)" page$/i
      team_path(:id=>$1)
    when /^the removal page for "([^"]*)"$/i
      edit_team_path(:id => @team, :unwanted_user=>User.find_by_name($1))
    when /^the approve team "([^"]*)" page$/i
      admin_approve_team_path(:team_id=>$1)
    when /^the disapprove team "([^"]*)" page$/i
      admin_disapprove_team_path(:team_id=>$1)
    when /^the new discussion page$/i
      new_discussion_pat
    when /^the team list page$/i
      teams_path
    when /^the team profile page for team_id "(.+)"$/
      teams_profile_path($1)
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
