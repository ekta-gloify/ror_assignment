class Library < ApplicationRecord
    has_many :books
    has_many :users, through: :books
    validates :l_name, presence: true
end
