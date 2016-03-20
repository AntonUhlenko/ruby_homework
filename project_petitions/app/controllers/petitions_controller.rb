class PetitionsController < ApplicationController

  before_action :authorize, only: [:new, :create]

  def index
    @petitions = Petition.all.order("created_at DESC")
  end

  def new
    @petition = Petition.new
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def create
    @petition = current_user.petitions.build(petition_params)
    @petition.author = current_user.first_name + ' ' + current_user.last_name if current_user.present?
    if @petition.save
      redirect_to @petition, notice: "Петиция создана!"
    else
      render "new"
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def last10
    @petitions = Petition.last(10)
  end

  def update
    @petition = Petition.find(params[:id])
    if @petition.update(petition_params)
      flash[:success] = 'Петиция обновлена'
      redirect_to my_petitions_path
    else
      render 'edit'
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    flash[:success] = 'Петиция удалена'
    redirect_to my_petitions_path
  end

  private

  def petition_params
    params.require(:petition).permit(:title, :text, :author)
  end

end
