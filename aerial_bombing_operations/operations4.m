%Maps
clc;
clear;
close all;

file_path = 'operations2.csv';
operations_table = readtable(file_path);

% Drop values out of range
max_lat = max(operations_table.TakeoffLatitude);
max_lon = max(operations_table.TakeoffLongitude);

rows_to_drop = operations_table.TakeoffLatitude == max_lat;
operations_table(rows_to_drop, :) = [];

rows_to_drop_lon = operations_table.TakeoffLongitude == max_lon;
operations_table(rows_to_drop_lon, :) = [];

% Map of take off locations
% f1 = figure('Name', 'Takeoff Locations on Map');
% ax = geoaxes;
% geoplot(ax, operations_table.TakeoffLatitude, operations_table.TakeoffLongitude, 'o', 'MarkerSize', 5);
% title('Takeoff Locations');

% Map of take off locations and countries
unique_countries = unique(operations_table.Country);

f1 = figure('Name', 'Takeoff Locations by Country');

for i = 1:numel(unique_countries)
    country_indices = strcmp(operations_table.Country, unique_countries{i});
    country_latitudes = operations_table.TakeoffLatitude(country_indices);
    country_longitudes = operations_table.TakeoffLongitude(country_indices);
    
    geoscatter(country_latitudes, country_longitudes, 'filled');
    hold on;
end

title('Takeoff Locations by Country');
legend(unique_countries, 'Location', 'EastOutside');

% Map of target locations and countries
unique_countries = unique(operations_table.Country);

f2 = figure('Name', 'Target Locations by Country');

for i = 1:numel(unique_countries)
    country_indices = strcmp(operations_table.Country, unique_countries{i});
    country_latitudes = operations_table.TargetLatitude(country_indices);
    country_longitudes = operations_table.TargetLongitude(country_indices);
    
    geoscatter(country_latitudes, country_longitudes, 'filled');
    hold on;
end

title('Target Locations by Country');
legend(unique_countries, 'Location', 'EastOutside');

