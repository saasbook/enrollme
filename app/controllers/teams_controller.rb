# Controller for teams. Consist fo all teams.
class TeamsController < ApplicationController
  def show
    @teams = Team.all
  end
end
