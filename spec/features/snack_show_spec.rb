require 'rails_helper'
RSpec.describe "Snack Show Page" do
  describe "As a visitor" do
    before :each do
      @sam = Owner.create(name: "Sam's Snacks")

      @daves = @sam.machines.create(location: "Don's Mixed Drinks")
      @turing = @sam.machines.create(location: "Turing Basement")

      @otter_pops = Snack.create(name: "Otter Pops", price: 1)
      @lemon_bars = Snack.create(name: "Lemon Bars", price: 2)
      @mints = Snack.create(name: "Minties", price: 3)
      @gum = Snack.create(name: "Chewems", price: 9)

      @one = MachineSnack.create(machine: @daves, snack: @otter_pops)
      @two = MachineSnack.create(machine: @daves, snack: @lemon_bars)
      @three = MachineSnack.create(machine: @daves, snack: @mints)
      @four = MachineSnack.create(machine: @turing, snack: @gum)
      @five = MachineSnack.create(machine: @turing, snack: @otter_pops)
      @six = MachineSnack.create(machine: @turing, snack: @lemon_bars)
    end
    it "I see the name of that snack, I see the price for that snack
    I see a list of locations with vending machines that carry that snack
    I see the average price for snacks in those vending machines
    I see a count of the different kinds of items in that vending machine." do

    visit snack_path(@otter_pops)

    expect(page).to have_content(@otter_pops.name)
    expect(page).to have_content(@otter_pops.price)
    expect(page).to have_content("2.0")
    expect(page).to have_content("4.0")
    expect(page).to have_content(@daves.location)
    expect(page).to have_content(@turing.location)
    expect(page).to have_content(@daves.snacks.count)
    expect(page).to have_content(@turing.snacks.count)
    end
  end
end
