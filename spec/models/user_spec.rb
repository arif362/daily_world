require 'rails_helper'

RSpec.describe User, type: :model do

  context "Creation" do
    subject { User.new(full_name: "Jack", email: "ariful.islam@misfit.tech", password: 'password', password_confirmation: 'password' )}
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a full_name" do
      subject.full_name=nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password_confirmation" do
      expect(subject.password_confirmation).to_not be_empty
    end

    it "is not valid with empty attributes" do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
