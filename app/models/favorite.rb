class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :collection

    validates_uniqueness_of :collection_id, scope: :user_id
end
