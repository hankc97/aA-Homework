module Toyable
    extend ActiveSupport::Concern
  
    included do
        has_many :toys,
            foreign_key: :toyable_id,
            class_name: :Toy 
    end
  
    def receive_toy(name)
        self.toys.find_or_create_by(name: name)
    end
  end