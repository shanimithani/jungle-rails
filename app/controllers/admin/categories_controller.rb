class Admin::CategoriesController < ApplicationController
  before_action :http_basic_authenticate # Authentication

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def http_basic_authenticate #Authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USERNAME'] && (ENV['BASIC_AUTH_PASSWORD_HASH']) == password
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
