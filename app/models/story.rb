# == Schema Information
#
# Table name: stories
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  link          :string(255)
#  comment_count :integer
#  comment_link  :string(255)
#  owner_name    :string(255)
#  owner_link    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Story < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :link, presence: true
  validates :comment_link, presence: true
  validates :comment_count, presence: true
  validates :owner_name, presence: true
  validates :owner_link, presence: true
end
