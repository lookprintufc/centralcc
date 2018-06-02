class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    params[:status] = 'Cartão Disponível'

    begin
      #EXTRACT FROM BINLIST
      data = ::Card.binlist(params[:card_number])

      params[:scheme] = data["scheme"]
      params[:brand] = (data["brand"].empty?) ? "Não definido" : data["brand"]
      params[:bank_name] = data["bank"]["name"]
      params[:country_name] = data["country"]["name"]
    rescue Exception => ex
      puts "Houve um erro: " + ex.message
    end


    new_card = Card.process(card_params)
    if new_card[:status]
      render :status => 200, :json => {success: true}
    else
      render :status => 422, :json => {success: false, errors: new_card[:message] }
    end
  end


  private
  def card_params
    #card_number, card_duedate, cvc, domain
    params.permit(:card_number, :card_duedate, :cvc, :domain, :scheme,
                  :brand, :bank_name, :country_name, :status)
  end
end
