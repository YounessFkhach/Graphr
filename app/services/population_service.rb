module PopulationService
  include DataService

  def populate_stations
    Station.delete_all

    stations.each do |station|
      Station.create station
    end
  end

  def populate_records(station:, time:)
    file_name     = get_exported_file_name(station: station.name, start_time: time, end_time: DateTime.now)

    unless file_name.include? "csv"
      puts "no_data"
      return
    end

    file_content  = get_exported_file_content(file_name: file_name)

    content_lines = file_content.split("\n").drop(1)

    content_lines.each do |line|
      station.add_new_record line: line
    end
  end

  def stations
    [
      {
        name:         "Ouled Berhil(bladreda)",
        display_name: "Aya",
        lat:          30.6362398,
        lng:          -8.478759
      },
      {
        name:         "Agueffay(Machraa Al Ain)",
        display_name: "meteo_ainmedior_kedima",
        lat:          30.4280454,
        lng:          -8.8975462
      },
      {
        name:         "Aitmelloul (Iavcha)",
        display_name: "meteo_aitmelloul_iavcha",
        lat:          30.3517118,
        lng:          -9.4769923
      },
      {
        name:         "Aoulouz (Tazartinou)",
        display_name: "meteo_aoulouz_delasuss",
        lat:          30.6760806,
        lng:          -8.1693666
      },
      {
        name:         "Tin Addi (CTT)",
        display_name: "meteo_apefel",
        lat:          30.1512206,
        lng:          -9.4929711
      },
      {
        name:         "CMV805(Belfaa)",
        display_name: "meteo_cmv805",
        lat:          30.0582436,
        lng:          -9.5617847
      },
      {
        name:         "Tin Ali Mansour (CATV)",
        display_name: "Meteo_CMV_khmiss_aitamira",
        lat:          30.2099394,
        lng:          -9.545445
      },
      {
        name:         "DZIR1(Ait Aizza)",
        display_name: "Meteo_DZIR1",
        lat:          30.5122316,
        lng:          -8.7976937
      },
      {
        name:         "Elguerdane (centre)",
        display_name: "meteo_elguerdan_dak",
        lat:          30.3789602,
        lng:          -9.0181322
      },
      {
        name:         "Hanssala(El Kchachda)",
        display_name: "meteo_hanssala_kayouh",
        lat:          30.4810298,
        lng:          -8.9721527
      },
      {
        name:         "Ouled teima (Al Hadib)",
        display_name: "meteo_houara_kayouh",
        lat:          30.3364597,
        lng:          -9.2016738
      },
      {
        name:         "Ouled Berhil (Igoudar)",
        display_name: "meteo_igoudar_benamour",
        lat:          30.6367893,
        lng:          8.4778587
      },
      {
        name:         "Indaouzal (El Faid)",
        display_name: "meteo_indaouzal_rafi",
        lat:          30.6148606,
        lng:          -8.2117288
      },
      {
        name:         "Taroudant (Lastah)",
        display_name: "meteo_lastah_oultiti",
        lat:          30.4883341,
        lng:          -8.8750769
      },
      {
        name:         "OuledAissa (Centre)",
        display_name: "meteo_ouledaissa_taoufiq",
        lat:          30.5559995,
        lng:          -8.6133188
      },
      {
        name:         "Ouled Berhil (Ouleddriss)",
        display_name: "meteo_ouleddriss_citatlas",
        lat:          30.6362398,
        lng:          -8.478759
      },
      {
        name:         "Gfifat(Ouled Abbou)",
        display_name: "meteo_ouledtiema_saouda",
        lat:          30.3314932,
        lng:          -9.2572952
      },
      {
        name:         "Qualiprime(Taddart_Sidi bibi)",
        display_name: "Meteo_Qualiprime_19",
        lat:          30.236651,
        lng:          -9.5270232
      },
      {
        name:         "Biougra (Tin Hammou)",
        display_name: "meteo_soema",
        lat:          30.188057,
        lng:          -9.3738992
      },
      {
        name:         "Temsia (Bouzoug)",
        display_name: "meteo_temsia_temsia",
        lat:          30.3640621,
        lng:          -9.3853476
      },
    ]
  end
end
