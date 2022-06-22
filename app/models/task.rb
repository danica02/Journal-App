class Task < ApplicationRecord
    belongs_to :category

    validates :title, presence: true, uniqueness: { scope: :category_id, case_sensitive: false, message: "are already exist" }
end
