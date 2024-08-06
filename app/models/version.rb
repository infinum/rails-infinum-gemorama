# frozen_string_literal: true

# == Schema Information
#
# Table name: versions
#
#  id          :integer          not null, primary key
#  authors     :string
#  description :text
#  downloads   :integer          default(0)
#  number      :string
#  position    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  rubygem_id  :integer
#
# Indexes
#
#  index_versions_on_position  (position)
#
class Version < ApplicationRecord
  belongs_to :rubygem

  scope :release, -> { where(prerelease: false) }
end
