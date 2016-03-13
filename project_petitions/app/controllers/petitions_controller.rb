class PetitionsController < ApplicationController

  def index
    @petitions = Petition.all.order("created_at DESC")
  end

  def new
    @petition = Petition.new
  end

  def create
    @petition = current_user.petitions.build(petition_params)
    #@petition = Petition.new(petition_params)
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

  private

  def petition_params
    params.require(:petition).permit(:title, :text, :author)
  end

end
