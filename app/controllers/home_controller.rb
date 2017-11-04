class HomeController < ApplicationController

  def home
    @requests = Array.new;
    request1 = Hash.new
    request1["name"] = "Website UI"
    request1["recipient"] = "j.hendrix"
    request1["deadline"] = "2/24/2018"
    request2 = Hash.new
    request2["name"] = "Album Cover"
    request2["recipient"] = "alanmanos"
    request2["deadline"] = "1/19/2018"
    request3 = Hash.new
    request3["name"] = "Mobile App Icon"
    request3["recipient"] = "j_fimmano"
    request3["deadline"] = "12/26/2017"
    request4 = Hash.new
    request4["name"] = "GE Pamphlet"
    request4["recipient"] = "Ken.Power"
    request4["deadline"] = "12/4/2017"
    request5 = Hash.new
    request5["name"] = "Restaurant Menu Design"
    request5["recipient"] = "philfourtner"
    request5["deadline"] = "11/28/2017"
    @requests.push(request1)
    @requests.push(request2)
    @requests.push(request3)
    @requests.push(request4)
    @requests.push(request5)
    @requests.push(request5)
    @requests.push(request5)
    @requests.push(request5)
  end

end
