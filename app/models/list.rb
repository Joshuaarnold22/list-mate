# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  permissions :string
#

class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :title, presence: true
  validates :permissions, inclusion: { in: %w(private viewable open), message: "is not a valid option."}
end
