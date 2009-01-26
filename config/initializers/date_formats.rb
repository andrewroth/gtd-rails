Time::DATE_FORMATS[:numeric] = "%m %d %Y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%b #{time.day.ordinalize}, %Y") }

