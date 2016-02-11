require 'spec_helper'

describe Widget do
  let(:widget) { mock_model(Widget) }

  it "uses the existing constant" do
    expect(widget).to be_a(Widget)
  end

  it "is valid by default" do
    expect(widget).to be_valid
  end

  it "is not a new record by default" do
    expect(widget).not_to be_new_record
  end

  it "can be converted to a new record" do
    expect(widget.as_new_record).to be_new_record
  end

  it "sets :id to nill upon destroy" do
    widget.destroy
    expect(widget.id).to be_nil
  end
end

describe "mock_model(Widget) with stubs" do
  let(:widget) do
    mock_model Widget, :foo => "bar",
      :save => true,
      :update_attributes => false
  end

  it "supports stubs for methods that don't exist in ActiveModel or ActiveRecord" do
    expect(widget.foo).to eq("bar")
  end

  it "supports stubs for methods that do exist" do
    expect(widget.save).to eq(true)
    expect(widget.update_attributes).to be_falsey
  end

  describe "#errors" do
    context "with update_attributes => false" do
      it "is not empty" do
        expect(widget.errors).not_to be_empty
      end
    end
  end
end
