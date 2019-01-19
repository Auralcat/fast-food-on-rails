class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :name, :password
  validates_uniqueness_of :name, :email

  validates :password,
    allow_blank: false,
    length: { in: 4..30 }
  validates :email,
    allow_blank: false,
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
