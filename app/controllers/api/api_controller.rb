class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    params[:status] = 'Cartão Disponível'
    params[:card_number] = params[:card_number].tr(" \t\r\n", '')

    begin
      #EXTRACT FROM BINLIST
      data = ::Card.binlist(params[:card_number])

      params[:scheme] = data["card-brand"]
      params[:brand] = (data["card-category"].empty?) ? "Não definido" : data["card-category"]
      params[:bank_name] = (data["issuer"].empty?) ? "Não definido" : data["issuer"]
      params[:country_name] = data["country-code"]
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
