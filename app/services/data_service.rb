module DataService

  def get_all_stations_records(time: DateTime.now, value: :temperature)
    exported_files = supported_stations.map do |station|
      get_station_last_record_at(time: time, station: station, value: value)
    end
  end

  def get_station_last_record_at(time:, station:, value:)
    file_name     = get_exported_file_name(station: station, start_time: time, end_time: time)
    file_content  = get_exported_file_content(file_name: file_name)
    content_lines = file_content.split("\n")

    value_index   = index_of_value value

    floored_time  = floor_to_last_15 time
    time_string   = floored_time.strftime('%Y-%m-%d;%I:%M:%S')

    last_record = content_lines.detect { |line| line.include? time_string }
    value = last_record.split(";")[value_index]

    value.to_f
  end

  def get_exported_file_name(station:, start_time:, end_time:)
    uri = generate_export_file_url

    body = {
      station: station,
      debut_csv: start_time.strftime('%Y-%m-%d'),
      fin_csv: end_time.strftime('%Y-%m-%d')
    }

    response =  HTTP.headers('content-type': "application/x-www-form-urlencoded")
                    .post(uri, body: body.to_query)

    body = response.to_s

    file_name = body.split("\"").last(2).first.split("/").last
  end

  def get_exported_file_content(file_name:)
    uri = download_exported_file_url(file_name: file_name)

    response = HTTP.get(uri)

    response.to_s
  end

  def floor_to_last_15(t)
    rounded = Time.at((t.to_time.to_i / 900.0).floor * 900)
    t.is_a?(DateTime) ? rounded.to_datetime : rounded
  end

  private

  def generate_export_file_url
    "http://yobeen.phytoconsulting.com/inc/export_csv_script.php"
  end

  def download_exported_file_url(file_name:)
    "http://yobeen.phytoconsulting.com/images/export_csv/" + file_name
  end

  def index_of_value(value)
    supported_values.index value
  end

  def supported_stations
    %i[Tagoute meteo_temsia_temsia meteo_soema]
  end

  def supported_values
    %i[date time temperature humidite pyrano v_vent d_vent precipitation vpd eto_index]
  end
end
