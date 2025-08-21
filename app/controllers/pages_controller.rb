class PagesController < ApplicationController
  def home
    @web_projects = WebProject.all.order(created_at: :desc)
  end

  def about
  end

  def stack
  end

  def experience
  end

  def contact
  end
end
