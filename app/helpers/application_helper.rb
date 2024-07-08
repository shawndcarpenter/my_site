module ApplicationHelper
  def render_sweather_partials(filepath, query, type)
    # binding.pry
    partials = partial_paths

    if partials[query] && type == "request"
      render partial: "/sweather/partials/#{filepath}/#{partials[query][:request]}"
    elsif partials[query] && type == "response"
      render partial: "/sweather/partials/#{filepath}/#{partials[query][:response]}"
    end
  end

  def partial_paths
    { 
      # local_query
      'Cincinatti, OH' => { 
        request: 'success/request/cinci',
        response: 'success/response/cinci'
      },
      '(blank)' => {
        request: 'fail/request/nolocation',
        response: 'fail/response/nolocation'
      },
      'NotARealCity' => {
        request: 'fail/request/fakename',
        response: 'fail/response/fakename'
      },
      #user_create
      'Email, Password, and Password Confirmation Present' => {
        request: 'success/request/unique',
        response: 'success/response/unique'
      },
      'Email Present, Non-Matching Passwords' => {
        request: 'fail/request/nonmatch',
        response: 'fail/response/nonmatch'
      },
      'Email and Confirmation Present, No Password' => {
        request: 'fail/request/nopassword',
        response: 'fail/response/nopassword'
      }, 
      'All Present, Email Taken' => {
        request: 'fail/request/taken',
        response: 'fail/response/taken'
      },
      #user_login
      'Email and Password Present and Correct' => {
        request: 'success/request/login',
        response: 'success/response/login'
      },
      'Email Invalid' => {
        request: 'fail/request/invalidemail',
        response: 'fail/response/invalidemail'
      },
      'Password Invalid' => {
        request: 'fail/request/invalidpassword',
        response: 'fail/response/invalidpassword'
      },
      'Missing Parameters' => {
        request: 'fail/request/missing',
        response: 'fail/response/missing'
      },
      #roadtrips
      "Austin, Texas to Chicago, Illinois" => {
        request: "success/request/atxtochi",
        response: "success/response/atxtochi"
      },
      "New York City, New York to Los Angeles, California" => {
        request: "success/request/nytola",
        response: "success/response/nytola"
      },
      "Cincinatti to London, UK" => {
        request: "success/request/overseas",
        response: "success/response/overseas"
      },
      "New York City, New York to Panama City, Panama" => {
        request: "success/request/toolong",
        response: "success/response/toolong"
      },
      "Fake Cities" => {
        request: "fail/request/fakelocs",
        response: "fail/response/fakelocs"
      },
      "Missing Origin" => {
        request: "fail/request/missing",
        response: "fail/response/missing"
      },
      "No API Key Provided" => {
        request: "fail/request/nokey",
        response: "fail/response/nokey"
      },
      "Fake API Key Provided" => {
        request: "fail/request/unauthorized",
        response: "fail/response/unauthorized"
      }
    }
  end
end
