#!/bin/bash

BASE_URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow"
OUTPUT_DIR="data_yellow"

# Cria diretório de saída se não existir
mkdir -p "$OUTPUT_DIR"

download_year() {
    local year=$1
    local start_month=$2
    local end_month=$3

    for month in $(seq -f "%02g" $start_month $end_month); do
        FILENAME="yellow_tripdata_${year}-${month}.csv.gz"
        URL="${BASE_URL}/${FILENAME}"

        if [ ! -f "${OUTPUT_DIR}/${FILENAME}" ]; then
            echo "Baixando ${FILENAME}..."
            curl -L -# -o "${OUTPUT_DIR}/${FILENAME}" "$URL"
        else
            echo "Arquivo ${FILENAME} já existe, pulando..."
        fi
    done
}

# Executa downloads
download_year 2019 1 12
download_year 2020 1 12
download_year 2021 1 7

echo "Download completo!"
