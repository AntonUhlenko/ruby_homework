class Petition < ActiveRecord::Base

  belongs_to :user
      # class_name: "User",
      # foreign_key: :author,
      # primary_key: :id

  validates :title,  :presence => true,
          :uniqueness => true,
          :length => {:minimum => 1, :maximum => 254}

  validates :text, :presence => true,
          :length => {:minimum => 1},
          :uniqueness => true
end
