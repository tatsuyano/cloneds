require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :rand_code => "Rand Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rand Code/)
  end
end
