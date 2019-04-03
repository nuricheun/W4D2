class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ["red", "orange", "blue", "green"]

    validates :birth_date, :color, :name, :sex, :description, presence: true 

    validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex" }

    validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }

    def age 
       time_ago_in_words(birth_date)
    end
    
    
    has_many :cat_rental_requests, 
        foreign_key: :cat_id,
        class_name: :CatRentalRequest

end
