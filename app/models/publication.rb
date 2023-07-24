class Publication < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :users, through: :reactions


validates :kinds, acceptance:{
    accept: %w[ like dislike ].freeze
    }

def self.kinds
    %w[ like dislike ]
end

end