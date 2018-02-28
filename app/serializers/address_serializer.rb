class AddressSerializer < ActiveModel::Serializer
  #set_type :name
  # attributes :custom_data
  # #has_many :addresses
  #
  # def custom_data
  #   {object.name => object.name}
  # end

  attributes

    def initialize(object, options = {})
        super
        self.class.send(:define_method, "#{object.name}") do
            {
                "#{object.name}": {
                    line1:  object.line1,
                    line2:  object.line2,
                    city:   object.city,
                    state:  object.state,
                    country:object.country,
                    zip:    object.zip 
                }
            }
        end
    end

    def attributes(*args)
        hash = super
        hash = hash.merge(self.send("#{object.name}"))
    end
end
