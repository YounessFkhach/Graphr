require 'csv'

class HomeController < ApplicationController
  protect_from_forgery with: :exception
  include DataService

  def index
    # get latest data
    # hash = get_all_stations_records

    # write data to csv
    # update_CSV hash[:data]

    # @time = hash[:time]

    # run Matlab script
    # system 'bash /Users/mac/workspace/abdellatif/Graphr/for_testing/run_qepshow.sh /Applications/MATLAB_R2018a.app/'

    # get the generated image
    @path = Dir.glob("app/assets/images/*.png").max_by {|f| File.mtime(f)}.split('/').last
  end

  private
    def update_CSV(data)
      filename = '/Users/mac/workspace/abdellatif/Graphr/csvlist.csv'

      CSV.open(filename, "w") do |csv|
        data.each do |elem|
          csv << [elem]
        end
      end
    end
end