class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store

  with_options presence: true do
    validates :comment_title
    validates :comment_content
  end
end
