class VotesController < ApplicationController

  before_action :authorize, only: [:new, :create]

  def create
    @petition = Petition.find(params[:petition_id])
    @vote = @petition.votes.build(vote_params)
     if @vote.save
        flash[:success] = 'Вы отдали свой голос'
        redirect_to :back
      else
        flash[:alert] = 'Вы уже поддержали данную петицию'
        redirect_to :back
      end
  end

  private

  def vote_params
    params.permit(petition_id: @petition.id).merge(user_id: current_user.id)
  end

end