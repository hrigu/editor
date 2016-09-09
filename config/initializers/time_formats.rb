# Siehe auch in app/config/locales/date.de.yml

# Verwendung: self.datum_zeit_von.to_formatted_s(:time_with_seconds),
Time::DATE_FORMATS[:date] = "%Y-%m-%d"
Time::DATE_FORMATS[:date_compact] = "%Y%m%d"
Time::DATE_FORMATS[:time_with_seconds] = "%H:%M:%S"
Time::DATE_FORMATS[:time_with_minutes] = "%H:%M"
Time::DATE_FORMATS[:excel] = "%Y-%m-%d_%Hh%Mm%Ss"

Date::DATE_FORMATS[:date_compact] = "%Y%m%d"
Date::DATE_FORMATS[:date] = "%Y-%m-%d"
