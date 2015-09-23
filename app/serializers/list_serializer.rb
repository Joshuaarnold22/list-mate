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

class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :user_id

  def title
    object.title
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
