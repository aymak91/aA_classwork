require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should have_many(:goals) }

    # to use shoulda matcher to validate uniqueness, you need to have a subject for it to test
    # subject below is for uniqueness shoulda matcher
    subject(:wombat) { User.create(
        username: 'wombat',
        password_digest: '354iondawnd',
    )}

    describe "session token" do
        it "assigns a session_token if none is given" do
            expect(FactoryBot.build(:user).session_token).not_to be_nil
            # use build method here to create a user object that we don't need saved to db
            # create will create a user object AND save to our test database
        end
    end
    
        describe "password encrytion" do
        it "does not save password to database" do
            # FactoryBot.create(:user, username: "harrypotter")
        
            FactoryBot.create(:harry_potter) # use our :harry_potter factory bot (subtype of :user bot)
            user = User.find_by(username: "harrypotter")

            expect(user.password).not_to be("password")
        end

        it "encrypts password using BCrypt" do
            expect(BCrypt::Password).to receive(:create).with("123456") 
            # need to set up expectation first that a specific method will be called 
            # then build a user object 
            FactoryBot.build(:user, password: "123456")
        end
    end
      
    
end