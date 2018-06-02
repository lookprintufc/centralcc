require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    fill_in "Bank City", with: @card.bank_city
    fill_in "Bank Name", with: @card.bank_name
    fill_in "Brand", with: @card.brand
    fill_in "Card Number", with: @card.card_number
    fill_in "Country Name", with: @card.country_name
    fill_in "Cvc", with: @card.cvc
    fill_in "Month", with: @card.month
    fill_in "Scheme", with: @card.scheme
    fill_in "Status", with: @card.status
    fill_in "Type", with: @card.type
    fill_in "Year", with: @card.year
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first

    fill_in "Bank City", with: @card.bank_city
    fill_in "Bank Name", with: @card.bank_name
    fill_in "Brand", with: @card.brand
    fill_in "Card Number", with: @card.card_number
    fill_in "Country Name", with: @card.country_name
    fill_in "Cvc", with: @card.cvc
    fill_in "Month", with: @card.month
    fill_in "Scheme", with: @card.scheme
    fill_in "Status", with: @card.status
    fill_in "Type", with: @card.type
    fill_in "Year", with: @card.year
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
