class FetchBreed < ApplicationService
  def initialize(breed)
    @breed = breed
  end

  def call
    dog_api_endpoint = "#{ENV['DOG_API_ENDPOINT']}/#{@breed}/images/random"

    response = HTTParty.get(dog_api_endpoint).parsed_response

    if response['status'] == 'error'
      'not_exist'
    else
      response['message']
    end
  end
end