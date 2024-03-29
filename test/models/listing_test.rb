# == Schema Information
#
# Table name: listings
#
#  id             :bigint           not null, primary key
#  host_id        :bigint           not null
#  title          :string           not null
#  about          :text
#  max_guests     :integer          default(1)
#  address_line_1 :string
#  address_line_2 :string
#  city           :string
#  state          :string
#  postal_code    :string
#  country        :string
#  lat            :decimal(10, 6)
#  lng            :decimal(10, 6)
#  status         :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
