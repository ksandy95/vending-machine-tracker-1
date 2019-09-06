require 'rails_helper'

RSpec.describe "Vending machine show page" do
  describe "As a user" do
    before :each do
      @sam = Owner.create(name: "Sam's Snacks")

      @daves = @sam.machines.create(location: "Don's Mixed Drinks")
      @turing = @sam.machines.create(location: "Turing Basement")

      @otter_pops = Snack.create(name: "Otter Pops", price: 1)
      @lemon_bars = Snack.create(name: "Lemon Bars", price: 2)
      @mints = Snack.create(name: "Minties", price: 3)
      @gum = Snack.create(name: "Chewems", price: 2)

      @one = MachineSnack.create(machine: @daves, snack: @otter_pops)
      @two = MachineSnack.create(machine: @daves, snack: @lemon_bars)
      @three = MachineSnack.create(machine: @daves, snack: @mints)
      @four = MachineSnack.create(machine: @turing, snack: @gum)
      @five = MachineSnack.create(machine: @turing, snack: @otter_pops)
      @six = MachineSnack.create(machine: @turing, snack: @lemon_bars)
    end
    it "I see the name of all of the snacks associated with that vending machine along with their price" do
      visit machine_path(@daves)

      expect(page).to have_content(@otter_pops.name)
      expect(page).to have_content(@lemon_bars.name)
      expect(page).to have_content(@mints.name)
      expect(page).to have_content(@otter_pops.price)
      expect(page).to have_content(@lemon_bars.price)
      expect(page).to have_content(@mints.price)
    end
    it "I also see an average price for all of the snacks in that machine" do
      visit machine_path(@daves)

      expect(page).to have_content("Average Price: 2.0")
    end
  end
end
