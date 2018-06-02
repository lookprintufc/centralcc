require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { bank_city: @card.bank_city, bank_name: @card.bank_name, brand: @card.brand, card_number: @card.card_number, country_name: @card.country_name, cvc: @card.cvc, month: @card.month, scheme: @card.scheme, status: @card.status, type: @card.type, year: @card.year } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { bank_city: @card.bank_city, bank_name: @card.bank_name, brand: @card.brand, card_number: @card.card_number, country_name: @card.country_name, cvc: @card.cvc, month: @card.month, scheme: @card.scheme, status: @card.status, type: @card.type, year: @card.year } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
