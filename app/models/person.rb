class Person < ActiveResource::Base
  self.site = "http://localhost:3002"
  self.element_name = "experiences"
end