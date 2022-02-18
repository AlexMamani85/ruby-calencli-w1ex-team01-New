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
  { "id" => (id = id.next),
    "start_date" => "2021-11-26T09:00:00-05:00",
    "title" => "Extended Project",
    "end_date" => "",
    "notes" => "",
    "guests" => [],
    "calendar" => "web-dev" },
]

# Methods

# Main Program
require 'date'

def menu(arrTodo)
  puts "-----------------------------Welcome to CalenCLI------------------------------"
  puts ""
  todoList(arrTodo,$date_base)
end 


def nameAction
  puts "------------------------------------------------------------------------------"
  puts "list | create | show | update | delete | next | prev | exit"
end


def todoList(todo_array, date_base)
  #hash para llenar eventos vacios
  event_nil = { "id" => "",
  "start_date" => "",
  "title" => "No events",
  "end_date" => "",
  "notes" => "",
  "guests" => [],
  "calendar" => "" }
  
  #for para iterar solo 7 dias
  for i in 1..7
    a_event = []
    count = 0
    has_event_all_day = 0

    #filtro para agrupar por fecha
    todo_array.each do |event| 
      d1 = DateTime.iso8601(event["start_date"])
      if d1.mday == date_base.mday && d1.mon == date_base.mon && d1.year == date_base.year
        a_event.push(event)
        count += 1
        has_event_all_day += 1 if event["end_date"] == "" 
      end
    end

    #if para llenar dia vacio
    if count.zero?
      event_nil['start_date'] = Date.new(date_base.year,date_base.mon,date_base.mday).to_s
      a_event.push(event_nil)
    #else para poner primero eventos de todo el dia
    else
      unless has_event_all_day.zero?
        p_event = a_event.select {|event| event["end_date"] == ""}
        s_event = a_event.reject {|event| event["end_date"] == ""}
        a_event = p_event + s_event
      end
    end

    #impresion de menu principal
    i = 0
    a_event.each do |event|
      d1 = DateTime.iso8601(event['start_date'])
      if i.zero?
        if event["end_date"] != ""
          d2 = DateTime.iso8601(event["end_date"])
          print "#{d1.strftime('%a %b %d  %H:%M')} - #{d2.strftime('%H:%M')} "
          puts "#{event['title']} (#{event['id']})"
        else
          print "#{d1.strftime('%a %b %d               ')} "
          if event["id"] == ""
            puts {event['title']}
          else
            puts "#{event['title']} (#{event['id']})"
          end
        end
        i += 1
      else
        if event["end_date"] != ""
          d2 = DateTime.iso8601(event["end_date"])
          print "            #{d1.strftime('%H:%M')} - #{d2.strftime('%H:%M')} "
          puts "#{event['title']} (#{event['id']})"
        else
          print "                          "
          if event["id"] == ""
            puts event["title"]
          else
            puts "#{event['title']} (#{event['id']})"
          end
        end
      end
    end
    puts ""
    date_base += 1
  end
end

def initial_program
  menu($events)
  nameAction
end

$date_base = Date.new(2021, 11, 15)
initial_program
action = nil

while action != "exit"
  print "action: "
  action = gets.chomp
  case action
  when "list"
    puts "listar"
  when "create"
    puts "Crear"
  when "show"
    puts "Mostrar"
  when "update"
    puts "Actualizar"
  when "delete"
    puts "Eliminar"
  when "next"
    puts "Next"
  when "prev"
    puts "Prev"
  when "exit"
    puts "Exit"
  else
    puts "action invalid"
  end
end
