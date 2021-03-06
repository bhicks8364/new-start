require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :admin_id => 1,
      :action => "MyString",
      :eventable_id => 1,
      :eventable_type => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_admin_id[name=?]", "event[admin_id]"

      assert_select "input#event_action[name=?]", "event[action]"

      assert_select "input#event_eventable_id[name=?]", "event[eventable_id]"

      assert_select "input#event_eventable_type[name=?]", "event[eventable_type]"
    end
  end
end
