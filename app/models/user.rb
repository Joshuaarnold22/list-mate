# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bio        :text
#  password   :string
#

class User < ActiveRecord::Base
  has_many :items

end
