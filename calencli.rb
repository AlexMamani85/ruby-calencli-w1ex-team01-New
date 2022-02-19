# Data
id = 0
$events = [
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T00:00:00-05:00",
    "title" => "Ruby Basics 1",
    "end_date" => "",
    "notes" => "Ruby Basics 1 notes",
    "guests" => %w[Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-15T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T00:00:00-05:00",
    "title" => "Ruby Basics 2",
    "end_date" => "",
    "notes" => "Ruby Basics 2 notes",
    "guests" => %w[Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-16T12:45:00-05:00",
    "title" => "Soft Skills - Mindsets",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "Some extra notes",
    "guests" => ["Diego"],
    "calendar" => "soft-skills" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T00:00:00-05:00",
    "title" => "Ruby Methods",
    "end_date" => "",
    "notes" => "Ruby Methods notes",
    "guests" => %w[Diego Andre Teddy Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-17T12:00:00-05:00",
    "title" => "English Course",
    "end_date" => "2021-11-15T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Summary Workshop",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "A lot of notes",
    "guests" => %w[Diego Teddy Andre Codeka],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-18T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-19T12:00:00-05:00",
    "title" => "English for Engineers",
    "end_date" => "2021-11-19T13:30:00-05:00",
    "notes" => "English notes",
    "guests" => ["Stephanie"],
    "calendar" => "english" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T10:00:00-05:00",
    "title" => "Breakfast with my family",
    "end_date" => "2021-11-20T11:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-20T15:00:00-05:00",
    "title" => "Study",
    "end_date" => "2021-11-20T20:00:00-05:00",
    "notes" => "",
    "guests" => [],
    "calendar" => "default" },
  { "id" => (id = id.next),
    "start_date" => "2021-11-25T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
  { "id" => id.next,
    "start_date" => "2021-11-26T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" }
]

require "date"

$id_global = $events.last["id"]

def metodo_show(id)

$events.each do |event|
  if event["id"].to_i == id.to_i 
    print "Event ID:"
    puts event["id"]
    print "date:"
    d1 = DateTime.iso8601(event["start_date"])
    puts "#{d1.strftime('%a %b %d ')}"
    print "title:"
    puts event["title"]
    print "calendar: "
    puts event["calendar"]
    print "start_end: "
    puts event["start_end"]
    print "notes: "
    puts event["notes"]
    print "guests: "
    puts event["guests"]
  end
end
name_action
end



def menu(arr_todo)
  puts "-----------------------------Welcome to CalenCLI------------------------------"
  puts ""
  todo_list(arr_todo, $date_base)
end

def name_action
  puts "------------------------------------------------------------------------------"
  puts "list | create | show | update | delete | next | prev | exit"
end

def todo_list(todo_array, date_base)
  # hash para llenar eventos vacios
  event_nil = {
    "id" => "",
    "start_date" => "",
    "title" => "No events",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => ""
  }
  # for para iterar solo 7 dias
  for i in 1..7
    a_event = []
    count = 0
    has_event_all_day = 0

    # filtro para agrupar por fecha
    todo_array.each do |event|
      d1 = DateTime.iso8601(event["start_date"])
      next unless d1.mday == date_base.mday && d1.mon == date_base.mon && d1.year == date_base.year

      a_event.push(event)
      count += 1
      has_event_all_day += 1 if event["end_date"] == ""
    end

    # if para llenar dia vacio
    array_minutes = []
    array_aux = []
    if count.zero?
      event_nil["start_date"] = Date.new(date_base.year, date_base.mon, date_base.mday).to_s
      a_event.push(event_nil)
    # else para poner primero eventos de todo el dia
    elsif has_event_all_day.zero?
      a_event.each do |event|
        d = DateTime.iso8601(event["start_date"])
        mins = (d.hour * 60) + d.min
        array_minutes.push(mins)
      end
      array_minutes = array_minutes.sort
      array_minutes.each do |min|
        a_event.each do |event|
          d1 = DateTime.iso8601(event["start_date"])
          min1 = (d1.hour * 60) + d1.min
          array_aux.push(event) if min == min1
        end
      end
      a_event = array_aux
    else
      p_event = a_event.select { |event| event["end_date"] == "" }
      s_event = a_event.reject { |event| event["end_date"] == "" }
      s_event.each do |event|
        d = DateTime.iso8601(event["start_date"])
        mins = (d.hour * 60) + d.min
        array_minutes.push(mins)
      end
      array_minutes = array_minutes.sort
      array_minutes.each do |min|
        s_event.each do |event|
          d1 = DateTime.iso8601(event["start_date"])
          min1 = (d1.hour * 60) + d1.min
          array_aux.push(event) if min == min1
        end
      end
      s_event = array_aux
      a_event = p_event + s_event
    end

    # impresion de menu principal
    i = 0
    a_event.each do |event|
      d1 = DateTime.iso8601(event["start_date"])
      if i.zero?
        if event["end_date"] == ""
          print "#{d1.strftime('%a %b %d               ')} "
          if event["id"] == ""
            puts event["title"]
          else
            puts "#{event['title']} (#{event['id']})"
          end
        else
          d2 = DateTime.iso8601(event["end_date"])
          print "#{d1.strftime('%a %b %d  %H:%M')} - #{d2.strftime('%H:%M')} "
          puts "#{event['title']} (#{event['id']})"
        end
        i += 1
      elsif event["end_date"] != ""
        d2 = DateTime.iso8601(event["end_date"])
        puts "            #{d1.strftime('%H:%M')} - #{d2.strftime('%H:%M')} #{event['title']} (#{event['id']})"
      else
        if event["id"] == ""
          puts "                          #{event['title']}"
        else
          puts "                          #{event['title']} (#{event['id']})"
        end
      end
    end
    puts ""
    date_base += 1
  end
end

def valid_hours(start_end)
  hour = start_end.split
  start_hour = hour[0]
  end_hour = hour[1]

  if hour.length == 2
    minutes_one = start_hour.split(":") # [11, 0]
    minutes_two = end_hour.split(":")
    minutes_t1 = (minutes_one[0].to_i * 60) + minutes_one[1].to_i
    minutes_t2 = (minutes_two[0].to_i * 60) + minutes_two[1].to_i
    if minutes_t1 < minutes_t2
      a = [true, minutes_one, minutes_two]
    else
      puts "Cannot end before start"
      a = [false]
    end
  else
    puts "Format: 'HH:MM HH:MM' or leave it empty"
    a = [false]
  end
  a
end

def create
  event_nil = {
    "id" => "",
    "start_date" => "",
    "title" => "",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => ""
  }

  print "date: "
  date = gets.chomp
  while date == ""
    puts "Type a valid date: YYYY-MM-DD"
    print "date: "
    date = gets.chomp
  end
  date = Date.iso8601(date)
  year = date.year
  month = date.mon
  day = date.mday
  event_nil["id"] = $id_global.next
  # puts Date.valid_date?(year, month, day)
  print "title: "
  title = gets.chomp
  while title == ""
    puts "Cannot be blank"
    print "title: "
    title = gets.chomp
  end
  event_nil["title"] = title

  print "calendar: "
  calendar = gets.chomp
  event_nil["calendar"] = calendar

  print "start_end: "
  start_end = gets.chomp

  if start_end == ""
    event_nil["start_date"] = DateTime.new(year, month, day, 0, 0, 0).to_s
  else
    hours = valid_hours(start_end)
    until hours[0] # [boolean, [11, 0]]
      print "start_end: "
      start_end = gets.chomp
      if start_end == ""
        hours[0] = true
      else
        hours = valid_hours(start_end)
      end
    end
    if start_end == ""
      event_nil["start_date"] = DateTime.new(year, month, day, 0, 0, 0).to_s
    else
      event_nil["start_date"] = DateTime.new(year, month, day, hours[1][0].to_i, hours[1][1].to_i, 0).to_s
      event_nil["end_date"] = DateTime.new(year, month, day, hours[2][0].to_i, hours[2][1].to_i, 0).to_s
    end
  end

  print "notes: "
  notes = gets.chomp
  event_nil["notes"] = notes
  print "guests: "
  guests = gets.chomp
  event_nil["guests"] = guests.split(", ")
  $events.push(event_nil)
  $id_global += 1
  name_action
end

def next_week
  $date_base = $date_base + 7
  initial_program
end

def previous_week
  $date_base = $date_base - 7
  initial_program
end


def metodo_update
  event_nil = {
    "id" => "",
    "start_date" => "",
    "title" => "",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => ""
  }

  print "Event ID: "
  event_id = gets.chomp.to_i
  print "date: "
  date = Date.iso8601(gets.chomp)
  year = date.year
  month = date.mon
  day = date.mday

  print "title: "
  title = gets.chomp
  while title == ""
    puts "Cannot be blank"
    print "title: "
    title = gets.chomp
  end
  event_nil["title"] = title

  print "calendar: "
  calendar = gets.chomp
  event_nil["calendar"] = calendar

  print "start_end: "
  start_end = gets.chomp

  if start_end == ""
    event_nil["start_end"] = DateTime.new(year, month, day, 0, 0, 0).to_s
  else
    hours = valid_hours(start_end)
    until hours[0] # [boolean, [11, 0]]
      print "start_end: "
      start_end = gets.chomp
      hours = valid_hours(start_end)
    end
    event_nil["start_date"] = DateTime.new(year, month,day,hours[1][0].to_i, hours[1][1].to_i,0).to_s
    event_nil["end_date"] = DateTime.new(year, month, day, hours[2][0].to_i, hours[2][1].to_i, 0).to_s
  end
  print "notes: "
  notes = gets.chomp
  event_nil["notes"] = notes
  print "guests: "
  guests = gets.chomp
  event_nil["guests"] = guests.split(", ")
  name_action
  $events.each do |event|
    evento_array = event["id"].to_i
      if evento_array == event_id
        event["start_date"] = event_nil["start_date"]
        event["title"] = event_nil["title"]
        event["end_date"] = event_nil["end_date"]
        event["notes"] = event_nil["notes"]
        event["guests"] = event_nil["guests"]
        event["calendar"] = event_nil["calendar"]
    end
  end
  metodo_show(event_id)
end

def delete(id)
  event_id = $events.select { |item| item["id"] != id.to_i }
  $events = event_id
end

def initial_program
  menu($events)
  name_action
end
# Finish Methods

# Main Program

$id_global = $events.last["id"]
$date_base = Date.new(2021, 11, 15)
initial_program
action = nil

while action != "exit"
  puts ""
  print "action: "
  action = gets.chomp
  case action
  when "list"
    initial_program
  when "create"
    create
  when "show"
    print "Event ID:"
    id_show = gets.chomp.to_i
    metodo_show(id_show)
  when "update"
    metodo_update

  when "delete"
    print "Event ID: "
    id = gets.chomp
    delete(id)
  when "next"
    next_week
  when "prev"
    previous_week
  when "exit"
    puts "Exit"
  else
    puts "action invalid"
  end
end
