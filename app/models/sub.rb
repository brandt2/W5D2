# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
    validates :title, :description, presence: true

    belongs_to :user

    has_many :post_subs
    
    has_many :posts,
    through: :post_subs
    
end
