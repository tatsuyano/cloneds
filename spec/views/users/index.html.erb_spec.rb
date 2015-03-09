require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :rand_code => "Rand Code"
      ),
      User.create!(
        :rand_code => "Rand Code"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Rand Code".to_s, :count => 2
  end
end
