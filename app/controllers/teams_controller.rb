class TeamsController < ApplicationController

  def show
    @teams = Team.all
  end

end
