class Toy < ApplicationRecord

    # toyable references both toyable_id and toyable_type since its polymorphic 
    validates :name, uniqueness: { scope: [:toyable] }
    belongs_to :toyable, polymorphic: true

    
end
