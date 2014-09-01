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

require 'spec_helper'

describe Story do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:link) }
    it { should validate_presence_of(:comment_link) }
    it { should validate_presence_of(:comment_count) }
    it { should validate_presence_of(:owner_name) }
    it { should validate_presence_of(:owner_link) }
    it { should validate_uniqueness_of(:title) }
  end
end
