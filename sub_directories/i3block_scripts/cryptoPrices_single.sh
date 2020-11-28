#!/usr/bin/env sh

get_crypto_price() {
    echo $(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=$1&vs_currencies=gbp" | awk -F ':' '{print $3}' | awk -F '}' '{print $1}')
}

get_crypto_change() {
    echo $(curl -s "https://api.coingecko.com/api/v3/coins/markets?ids=$1&vs_currency=gbp" | awk -F 'price_change_percentage_24h":' '{print $2}' | awk -F ',' '{print $1}')
}

price=$(get_crypto_price "$1")

change24h=$(get_crypto_change "$1")

echo $2=\£$price \($change24h%\) 

