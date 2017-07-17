class TeamsController < ApplicationController

  def show
    #why is show getting called?
      puts "callme"
    render "teams_listing"
  end
 end