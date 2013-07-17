require 'spec_helper'

describe User do
  before do
    @user = User.make!
  end

  it "should valid" do
    @user.should be_valid
  end

  describe "password required?" do
    context "news users" do
      before do
        @user = User.new
      end

      it "requires a password" do
        @user.should be_password_required
      end

      it "should require password & match confirmation" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.should_not be_valid

        @user.password = "niceguy"
        @user.password_confirmation = nil
        @user.should_not be_valid

        @user.password = "niceguy"
        @user.password_confirmation = "Guy"
        @user.should_not be_valid
      end
    end

    context "existing user" do
      before do
        @user.save!
        @user = User.find @user.id
        end

      it "requires a password when password is present" do
        @user.password = 'niceguy'
        @user.should be_password_required
      end

      it "requires a correct password when password_comfirmation is present" do
        @user.password_confirmation = 'xx'
        @user.should be_password_required
      end

      it "should not require password no password or confirmation is present" do
        @user.reload.should_not be_password_required
      end

      it "shoult not be required password" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.should be_valid
      end
    end
  end

  describe 'Validations' do
    subject { @user }

    it{ should validate_presence_of :name }
    it{ should validate_presence_of :email }
    it{ should validate_presence_of :password }

    context 'admin_time' do
      it "when user is admin" do
        @user.admin = true
        should validate_presence_of :admin_time_from
      end

      it "when user isnt admin" do
        @user.admin = false
        should_not validate_presence_of :admin_time_from
      end
    end
  end

  describe 'member_since' do
    before { @admin = User.make!(admin: true, admin_time_from: 2010) }
    before { @no_admin = User.make!(admin: false, created_at: Date.today) }

    context 'admin user when admin_time_to is present' do
      it "should show complete message" do
        @admin.admin_time_to = Date.today.year
        expect(@admin.member_since).to eql ("De 2010 até #{@admin.admin_time_to}.")
      end
    end

    context 'admin user when admin_time_to is not present' do
      it "should show until now" do
        expect(@admin.member_since).to eql ("De 2010 até agora.")
      end
    end

    context 'simple user' do
      it "should show the year the user was created until now" do
        expect(@no_admin.member_since).to eql ("De #{@no_admin.created_at.year} até agora.")
      end
    end
  end

  describe 'Associations' do
    it { should have_many :talks }
  end

  describe 'avatar_url' do
    context "user with image" do
      it "should return image of user" do
        @user.image = "http://my-image.com"
        expect(@user.avatar_url).to eql(@user.image)
      end
    end

    context "user without image" do
      before do
        @user.image = nil
        @email_md5 = Digest::MD5.new.update(@user.email)
        @default_image = "http://www.gururs.com" +
          ActionController::Base.helpers.asset_path('default_avatar.png')
      end

      it "should return gravatar of user without image" do
        expected = "http://gravatar.com/avatar/#{@email_md5}.jpg?s=100&d=#{@default_image}"
        expect(@user.avatar_url).to eql(expected)
      end

      it "should return gravatar of user without image and different size" do
        size = 200
        expected = "http://gravatar.com/avatar/#{@email_md5}.jpg?s=#{size}&d=#{@default_image}"
        expect(@user.avatar_url(size)).to eql(expected)
      end
    end
  end
end
