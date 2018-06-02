class Card < ApplicationRecord
  require 'net/http'
  enum status: { 'Cartão Disponível':0, 'Cartão Usado':1 }


  filterrific :default_filter_params => { :sorted_by => 'created_at_desc' },
  :available_filters => %w[
                sorted_by
                scheme
                with_created_at_gte
                brand
                status
                domain
              ]
  # default for will_paginate
  #self.per_page = 50

  scope :scheme, lambda { |cards|
    where(:scheme => [*cards])
  }

  scope :brand, lambda { |cards|
    where(:brand => [*cards])
  }

  scope :status, lambda { |cards|
    where(:status => [*cards])
  }

  scope :domain, lambda { |cards|
    where(:domain => [*cards])
  }

  scope :with_created_at_gte, lambda { |ref_date|
    where('cards.created_at >= ?', ref_date)
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("cards.created_at #{ direction }")
    when /^scheme_/
      order("LOWER(cards.scheme) #{ direction }")
    when /^brand_/
      order("LOWER(cards.brand) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }


  def self.options_for_sorted_by
    [
      ['Bandeira (a-z)', 'scheme_asc'],
      ['Data de Cadastro (Novos primeiro)', 'created_at_desc'],
      ['Data de Cadastro (Velhos Primeiro)', 'created_at_asc'],
      ['Tipo (a-z)', 'brand_asc']
    ]
  end


  def self.binlist(card_number)
    uri = URI.parse("https://lookup.binlist.net/#{card_number}")
    response = Net::HTTP.get_response(uri)
    return JSON.parse response.body
  end

  def self.process(options)
    @card_new = Card.new(options)
    if @card_new.save
      return {status: true, message: ''}
    else
      return {status: false, message:  @card_new.errors.messages }
    end
  end




end
