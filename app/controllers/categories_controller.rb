class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :redirect_if_not_admin, only: [:new, :edit, :create, :update]


  expose(:categories)
  expose(:category)
  expose(:product) { Product.new(user: current_user) }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def redirect_if_not_admin
      redirect_to new_user_session_path and return unless current_user.admin?
    end
end
