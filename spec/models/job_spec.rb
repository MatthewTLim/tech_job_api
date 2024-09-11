require 'rails_helper'

RSpec.describe Job, type: :model do
  subject { build(:job) }

  describe 'validations' do
    it 'has a valid factory' do
      expect(subject).to be_valid
    end

    describe 'company_name' do
      context 'when company_name is not valid' do
        it 'is invalid without a company_name' do
          subject.company_name = nil
          expect(subject).to_not be_valid
          expect(subject.errors[:company_name]).to include("can't be blank")
        end

        it 'is invalid with an empty string for company_name' do
          subject.company_name = ''
          expect(subject).to_not be_valid
          expect(subject.errors[:company_name]).to include("can't be blank")
        end

        it 'is invalid with whitespace-only company_name' do
          subject.company_name = '   '
          expect(subject).to_not be_valid
          expect(subject.errors[:company_name]).to include("can't be blank")
        end

        it 'is invalid if company_name is too long' do
          subject.company_name = 'a' * 101
          expect(subject).to_not be_valid
          expect(subject.errors[:company_name]).to include("is too long (maximum is 100 characters)")
        end
      end
    end

    describe 'post_title' do
      context 'when post_title is not valid' do
        it 'is invalid without a post_title' do
          subject.post_title = nil
          expect(subject).to_not be_valid
          expect(subject.errors[:post_title]).to include("can't be blank")
        end

        it 'is invalid with an empty string for post_title' do
          subject.post_title = ''
          expect(subject).to_not be_valid
          expect(subject.errors[:post_title]).to include("can't be blank")
        end
      end
    end

    describe 'job_category' do
      it 'is invalid without a job_category' do
        subject.job_category = nil
        expect(subject).to_not be_valid
        expect(subject.errors[:job_category]).to include("can't be blank")
      end
    end

    describe 'part_time_full_time' do
      it 'is invalid without a part_time_full_time value' do
        subject.part_time_full_time = nil
        expect(subject).to_not be_valid
        expect(subject.errors[:part_time_full_time]).to include("can't be blank")
      end
    end

    describe 'location' do
      context 'when location is not valid' do
        it 'is invalid without a location' do
          subject.location = nil
          expect(subject).to_not be_valid
          expect(subject.errors[:location]).to include("can't be blank")
        end

        it 'is invalid with an empty string for location' do
          subject.location = ''
          expect(subject).to_not be_valid
          expect(subject.errors[:location]).to include("can't be blank")
        end

        it 'is invalid with whitespace-only location' do
          subject.location = '   '
          expect(subject).to_not be_valid
          expect(subject.errors[:location]).to include("can't be blank")
        end

        it 'is invalid if location is too long' do
          subject.location = 'a' * 101
          expect(subject).to_not be_valid
          expect(subject.errors[:location]).to include("is too long (maximum is 100 characters)")
        end
      end
    end

    describe 'job_post_date' do
      it 'is invalid without a job_post_date' do
        subject.job_post_date = nil
        expect(subject).to_not be_valid
        expect(subject.errors[:job_post_date]).to include("can't be blank")
      end
    end

    describe 'apply_link' do
      context 'when apply_link is not valid' do
        it 'is invalid without an apply_link' do
          subject.apply_link = nil
          expect(subject).to_not be_valid
          expect(subject.errors[:apply_link]).to include("can't be blank")
        end

        it 'is invalid with an incorrectly formatted apply_link' do
          subject.apply_link = 'invalid_link'
          expect(subject).to_not be_valid
          expect(subject.errors[:apply_link]).to include("must be a valid URL")
        end

        it 'is invalid with a partial apply_link URL' do
          subject.apply_link = 'example.com'
          expect(subject).to_not be_valid
          expect(subject.errors[:apply_link]).to include("must be a valid URL")
        end
      end
    end

    describe 'details' do
      it 'is valid without details (allow blank)' do
        subject.details = nil
        expect(subject).to be_valid
      end

      it 'is invalid if details is too long' do
        subject.details = 'a' * 1001
        expect(subject).to_not be_valid
        expect(subject.errors[:details]).to include("is too long (maximum is 1000 characters)")
      end

      it 'is valid with a blank details field' do
        subject.details = ''
        expect(subject).to be_valid
      end
    end
  end
end
