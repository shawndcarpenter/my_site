class Thirdspace::SearchLocationsController < ApplicationController
  def create
    current_user = User.first
    if (params["city"].present? && params["state"].present?)
      search_location = current_user.build_search_location(city: params["city"].titleize, state: params["state"])
      search_location.save
      redirect_to thirdspace_search_locations_set_mood_path
    elsif params[:geo]
      geolocation = geocode_location(session[:lat], session[:lon])
      geo_hash = geolocation_parse(geolocation)
      search_location = current_user.build_search_location(geo_hash)
      search_location.save
      redirect_to thirdspace_search_locations_set_mood_path
    elsif (session[:lat].nil? || session[:lon].nil?)
      flash[:error] = "Error fetching location. Please make sure you have granted permission to access your location."
      redirect_to thirdspace_set_location_path
    else
      update_search_location
    end
  end

  def update_search_location
    current_user = User.first
    if params[:city] && params[:state]
      current_user.search_location.update(city: search_params[:city].titleize, state: search_params[:state])
      redirect_to thirdspace_dashboard_path
    elsif (session[:lat].nil? || session[:lon].nil?)
      flash[:error] = "Error fetching location. Please make sure you have granted permission to access your location."
      redirect_to thirdspace_set_location_path
    else params[:geo] && session[:lat] && session[:lon]
      geolocation = geocode_location(session[:lat], session[:lon])
      geo_hash = geolocation_parse(geolocation)
      search_location = current_user.search_location.update(geo_hash)
      redirect_to thirdspace_dashboard_path
    end
  end

  def update
    current_user = User.first
    current_user.search_location.update(mood: params[:mood])
    redirect_to thirdspace_dashboard_path
  end
  
  private
  def search_params
    params.permit(:city, :state)
  end

  def search_location_params
    params.require(:search_location).permit(:city, :state, :mood)
  end

  def geocode_location(lat, lon)
    results = Geocoder.search([lat, lon])
    
    if results.empty?
      flash[:error] = "Unable to geocode location. Please check your coordinates."
      return []
    end
    
    city_state = []
    if !results.first.data["address"]["city"]
      city_state << results.first.data["address"]["county"]
      city_state << results.first.data["address"]["state"]
    else
      city_state << results.first.data["address"]["city"]
      city_state << results.first.data["address"]["state"]
    end
  end
  
  
  def geolocation_parse(geolocation)
    if geolocation.nil? || geolocation.empty?
      return { city: nil, state: nil }
    end
    city = geolocation[0]
    state = geolocation[1]
    if state.nil?
      geo_hash = { city: city }
    elsif state.length != 2
      geo_hash = { city: city, state: state_to_abv(state) }
    else
      geo_hash = { city: city, state: state }
    end
  
    geo_hash
  end

  def state_to_abv(state_name)
    state_abbreviations = {
                          'Alabama' => 'AL',
                          'Alaska' => 'AK',
                          'Arizona' => 'AZ',
                          'Arkansas' => 'AR',
                          'California' => 'CA',
                          'Colorado' => 'CO',
                          'Connecticut' => 'CT',
                          'Delaware' => 'DE',
                          'Florida' => 'FL',
                          'Georgia' => 'GA',
                          'Hawaii' => 'HI',
                          'Idaho' => 'ID',
                          'Illinois' => 'IL',
                          'Indiana' => 'IN',
                          'Iowa' => 'IA',
                          'Kansas' => 'KS',
                          'Kentucky' => 'KY',
                          'Louisiana' => 'LA',
                          'Maine' => 'ME',
                          'Maryland' => 'MD',
                          'Massachusetts' => 'MA',
                          'Michigan' => 'MI',
                          'Minnesota' => 'MN',
                          'Mississippi' => 'MS',
                          'Missouri' => 'MO',
                          'Montana' => 'MT',
                          'Nebraska' => 'NE',
                          'Nevada' => 'NV',
                          'New Hampshire' => 'NH',
                          'New Jersey' => 'NJ',
                          'New Mexico' => 'NM',
                          'New York' => 'NY',
                          'North Carolina' => 'NC',
                          'North Dakota' => 'ND',
                          'Ohio' => 'OH',
                          'Oklahoma' => 'OK',
                          'Oregon' => 'OR',
                          'Pennsylvania' => 'PA',
                          'Rhode Island' => 'RI',
                          'South Carolina' => 'SC',
                          'South Dakota' => 'SD',
                          'Tennessee' => 'TN',
                          'Texas' => 'TX',
                          'Utah' => 'UT',
                          'Vermont' => 'VT',
                          'Virginia' => 'VA',
                          'Washington' => 'WA',
                          'West Virginia' => 'WV',
                          'Wisconsin' => 'WI',
                          'Wyoming' => 'WY'
                        }
    state_abbreviations[state_name]
  end
end