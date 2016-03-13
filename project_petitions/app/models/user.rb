class User < ActiveRecord::Base

  has_secure_password

  has_many :petitions
           # class_name: "Petition",
           # foreign_key: :author,
           # primary_key: :id,
           # dependent: :destroy


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name,  :presence => true,
            :length => {:minimum => 1, :maximum => 254}

  validates :last_name,  :presence => true,
            :length => {:minimum => 1, :maximum => 254}

  validates :email, :presence   => true,
            :format     => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }

end