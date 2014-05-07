class ProjectsController < ApplicationController
  def index
    @projects = TrackerApi.new.all_projects
  end
end