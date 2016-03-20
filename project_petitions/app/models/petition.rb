class Petition < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  EXPIRATION_DATE = 30
  VOTES_THRESHOLD = 100

  validates :title,  :presence => true,
          :uniqueness => true,
          :length => {:minimum => 1, :maximum => 254}

  validates :text, :presence => true,
          :length => {:minimum => 1},
          :uniqueness => true

  validate :edit_only_active_petition, on: :update

  def edit_only_active_petition
    petition = Petition.find(petition_id)
    errors.add(:petition_id, "Нельзя редактировать устаревшую петицию") if petition.expired?
  end

  def expired?
    created_at < EXPIRATION_DATE.day.ago
  end

end
