require 'rails_helper'

describe Contact do
  it 'is invalid without a firstname'
  it 'is invalid without an lastname'
  it 'is invalid without an email address'
  it 'is invalid a duplicate email address'
  it 'returns a contact\'s full name as a string'
end
