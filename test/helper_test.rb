require 'minitest/spec'
require 'minitest/autorun'
require_relative '../helpers/wiki_helpers'

describe WikiHelpers do
  let(:str ) { "Take care a pet and get a free retreat" }
  it 'should replace all spaces' do
    WikiHelpers.urlify(str).must_equal "take_care_a_pet_and_get_a_free_retreat"
  end

  it 'should diwnsize string to 64 characters' do
    assert WikiHelpers.urlify(str*3).length <= 64
  end
end