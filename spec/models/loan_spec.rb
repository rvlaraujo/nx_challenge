require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:loan) { create(:loan) }

  context 'Basic model validations' do
    it { is_expected.to validate_presence_of(:loan_amount) }
    it { is_expected.to validate_numericality_of(:loan_amount).is_greater_than(0) }

    it { is_expected.to validate_presence_of(:interest_rate) }
    it { is_expected.to validate_numericality_of(:interest_rate).is_greater_than(0) }

    it { is_expected.to validate_presence_of(:period) }
    it { is_expected.to validate_numericality_of(:period).only_integer }
    it { is_expected.to validate_numericality_of(:period).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:period).is_less_than_or_equal_to(60) }

    it { should belong_to(:client) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:client) }
  end
end
