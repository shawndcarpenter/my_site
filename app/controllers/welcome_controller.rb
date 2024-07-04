class WelcomeController < ApplicationController
  def index
    @skills = Skill.all
  end
end
