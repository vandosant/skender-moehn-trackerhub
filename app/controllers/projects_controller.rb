class ProjectsController < ApplicationController
  def index
    @projects = TrackerApi.new.all_projects
  end

  def show
    @stories = TrackerApi.new.all_stories(params[:id])
  end
end