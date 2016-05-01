require 'rails_helper'

describe Contact do
  it 'is valid with a firstname, lastname and email' do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com'
    )
    expect(contact).to be_valid
  end

  it 'is invalid without a firstname' do
    contact = Contact.new(
      firstname: nil,
    )
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it 'is invalid without an lastname' do
    contact = Contact.new(
      lastname: nil,
    )
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it 'is invalid without an email address' do
    contact = Contact.new(
      email: nil,
    )
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it 'is invalid a duplicate email address' do
    Contact.create(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com'
    )
    contact = Contact.new(
      email: 'tester@example.com',
    )
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it 'returns a contact\'s full name as a string' do
    contact = Contact.new(
      firstname: 'John',
      lastname: 'Doe'
    )

    expect(contact.name).to eq('John Doe')
  end

  it "returns a sorted array of results that match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'Smith',
      email: 'jsmith@example.com'
    )
    jones = Contact.create(
      firstname: 'T',
      lastname: 'Jones',
      email: 'tjones@example.com'
    )
    johnson = Contact.create(
      firstname: 'John',
      lastname: 'Johnson',
      email: 'jjhonson@example.com'
    )
    expect(Contact.by_letter("J")).to eq([johnson, jones])
  end

  it "omits results that do not match" do
    smith = Contact.create(
      firstname: 'John',
      lastname: 'Smith',
      email: 'jsmith@example.com'
    )
    jones = Contact.create(
      firstname: 'T',
      lastname: 'Jones',
      email: 'tjones@example.com'
    )
    johnson = Contact.create(
      firstname: 'John',
      lastname: 'Johnson',
      email: 'jjhonson@example.com'
    )
    expect(Contact.by_letter("J")).not_to include(smith)
  end
end
