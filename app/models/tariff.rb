class Tariff < ApplicationRecord
  
  scope :unique_countries, ->{select('DISTINCT country').map{|c| c.country}.sort}
  # scope :unique_zip_for_country, ->{select('DISTINCT country').map{|c| c.country}.sort}
  
  
  def import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Tariff.create({country: row[0], zip: row[1], weight: row[2], price: row[3], carrier: row[4], expire: row[5], transit_time: row[6], loading_region: row[7]})
    end 
  end  

end
