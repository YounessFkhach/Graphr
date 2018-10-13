class Station < ApplicationRecord
  include DataService

  has_many :records

  def add_new_record(line:)
    hash = line_to_hash(line)

    existing = records.where(date: hash[:date])
    return existing.first unless existing.empty?

    record = records.create(line_to_hash(line))
  end

  def line_to_hash(line)
    line_data = line.split(";")

    line_data_without_time = line_data.drop(2)

    hash = non_time_fields.each_with_index.map { |field_name, index| { field_name.to_sym => line_data_without_time[index] } }

    hash << { date: DateTime.parse(line_data.first + " " + line_data.second)  }

    hash.inject(:merge)
  end

  def non_time_fields
    %i[temperature humidite pyrano v_vent d_vent precipitation vpd eto_index]
  end
end
