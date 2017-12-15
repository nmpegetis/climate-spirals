#!/bin/bash

echo Downloading source datasets ...

echo GLB.Ts.csv
echo =====
wget -O ./data/tempAnomaliesMeteo/GLB.Ts.csv 'https://data.giss.nasa.gov/gistemp/tabledata_v3/GLB.Ts.csv'

echo ZonAnn.Ts.csv
echo =====
wget -O ./data/tempAnomaliesMeteo/GLB.Ts.csv 'https://data.giss.nasa.gov/gistemp/tabledata_v3/ZonAnn.Ts.csv'

echo GLB.Ts+dSST.csv
echo =====
wget -O ./data/tempAnomaliesAirSea/GLB.Ts+dSST.csv 'https://data.giss.nasa.gov/gistemp/tabledata_v3/GLB.Ts+dSST.csv'

echo ZonAnn.Ts+dSST.csv
echo =====
wget -O ./data/tempAnomaliesAirSea/GLB.Ts+dSST.csv 'https://data.giss.nasa.gov/gistemp/tabledata_v3/ZonAnn.Ts+dSST.csv'
