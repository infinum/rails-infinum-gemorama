# frozen_string_literal: true

# == Schema Information
#
# Table name: rubygems
#
#  id         :integer          not null, primary key
#  name       :string
#  token      :string
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
class Rubygem < ApplicationRecord
  has_many :versions, dependent: :destroy
end
