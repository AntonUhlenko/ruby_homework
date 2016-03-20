class Vote < ActiveRecord::Base

  belongs_to :petition
  belongs_to :user

  validates_presence_of :user_id, :petition_id
  validates_uniqueness_of :user_id, :scope => [:petition_id]
  validate :vote_olny_for_active_petition, on: :create

  def vote_olny_for_active_petition
    petition = Petition.find(petition_id)
    errors.add(:petition_id, "Нельзя проголосовать за устаревшую петицию") if petition.expired?
  end

end
