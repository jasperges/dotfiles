#!/bin/bash

declare -i CACHE_EXPIRATION=3600
declare -i RETRY_COUNT=5
declare -i BACKOFF_MS=1000
declare -r -A WEATHER_CODES=(
    ["113"]="☀️"
    ["116"]="⛅️"
    ["119"]="☁️"
    ["122"]="☁️"
    ["143"]="🌫"
    ["176"]="🌦"
    ["179"]="🌧"
    ["182"]="🌧"
    ["185"]="🌧"
    ["200"]="⛈"
    ["227"]="🌨"
    ["230"]="❄️"
    ["248"]="🌫"
    ["260"]="🌫"
    ["263"]="🌦"
    ["266"]="🌦"
    ["281"]="🌧"
    ["284"]="🌧"
    ["293"]="🌦"
    ["296"]="🌦"
    ["299"]="🌧"
    ["302"]="🌧"
    ["305"]="🌧"
    ["308"]="🌧"
    ["311"]="🌧"
    ["314"]="🌧"
    ["317"]="🌧"
    ["320"]="🌨"
    ["323"]="🌨"
    ["326"]="🌨"
    ["329"]="❄️"
    ["332"]="❄️"
    ["335"]="❄️"
    ["338"]="❄️"
    ["350"]="🌧"
    ["353"]="🌦"
    ["356"]="🌧"
    ["359"]="🌧"
    ["362"]="🌧"
    ["365"]="🌧"
    ["368"]="🌨"
    ["371"]="❄️"
    ["374"]="🌧"
    ["377"]="🌧"
    ["386"]="⛈"
    ["389"]="🌩"
    ["392"]="⛈"
    ["395"]="❄️"
)

_get_weather_data() {
    local weather_data
    local -r cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/japs"
    local -r cache_file="${cache_dir}/wttr"

    if [[ -s ${cache_file} ]] && (($(stat -c "%Y" "$cache_file") > $(date +%s) - CACHE_EXPIRATION)); then
        weather_data="$(< "${cache_file}")"
        echo "${weather_data}"
        return
    fi
    while ((RETRY_COUNT > 0)); do
        if weather_data=$(curl -sf "https://wttr.in/Zeist?format=j1"); then
            break
        fi
        echo "Request failed, retrying in $((BACKOFF_MS / 1000)) seconds..." > /dev/stderr
        ((RETRY_COUNT--))
        sleep $((BACKOFF_MS / 1000))
        BACKOFF_MS=$((BACKOFF_MS * 2))
    done
    if [[ -n ${weather_data} ]]; then
        [[ ! -d ${cache_dir} ]] && mkdir -p "${cache_dir}"
        echo "${weather_data}" > "${cache_file}"
    else
        # We weren't able to retrieve new weather data, return the content of the expired cache
        if [[ -s ${cache_file} ]]; then
            weather_data="$(< "${cache_file}")"
        fi
    fi
    echo "${weather_data}"
}

_get_text() {
    local weather_data

    weather_data=$1

    if [[ -z ${weather_data} ]]; then
        echo "⚠"
        return 1
    fi

    local icon
    local temp
    local text

    icon=${WEATHER_CODES[$(jq -r .current_condition[0].weatherCode <<< "${weather_data}")]}
    temp=$(jq -r .current_condition[0].temp_C <<< "${weather_data}")
    text="${icon} ${temp}°"
    echo "${text}"
}

_get_tooltip() {
    local weather_data

    weather_data=$1

    if [[ -z ${weather_data} ]]; then
        echo "Could not retrieve weather data."
        return 1
    fi

    local weather_desc
    local feels_like
    local wind_speed
    local humidity
    local tooltip

    weather_desc=$(jq -r .current_condition[0].weatherDesc[0].value <<< "${weather_data}")
    feels_like=$(jq -r .current_condition[0].FeelsLikeC <<< "${weather_data}")
    wind_speed=$(jq -r .current_condition[0].windspeedKmph <<< "${weather_data}")
    humidity=$(jq -r .current_condition[0].humidity <<< "${weather_data}")
    tooltip="<b>${weather_desc} ${temp}°</b>\n"
    tooltip+="Feels like: ${feels_like}°\n"
    tooltip+="Wind: ${wind_speed}Km/h\n"
    tooltip+="Humidity: ${humidity}%"

    echo "${tooltip}"
}

WEATHER_DATA=$(_get_weather_data)
text=$(_get_text "${WEATHER_DATA}")
tooltip=$(_get_tooltip "${WEATHER_DATA}")
echo "{\"text\": \"${text}\", \"tooltip\": \"${tooltip}\"}"
