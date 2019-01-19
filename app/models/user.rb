class User < ApplicationRecord
  validates_presence_of :name, :password
  validates :password, length: { in: 4..30 }
end
