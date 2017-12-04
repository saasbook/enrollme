# Controller for teams. Consist fo all teams.
class TeamListController < ApplicationController
  def show
    @teams = Team.all
  end
end
