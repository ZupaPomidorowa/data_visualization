%File to clean the dataset
clc;
clear;
close all;

file_path = 'operations.csv';
operations_table = readtable(file_path);

%Show first 5 rows
operations_head = head(operations_table, 5);
disp(operations_head);

%Number of rows
rows = height(operations_table);
disp(['Rows: ' num2str(rows)]);

%Check missing values
missing = sum(ismissing(operations_table));
%disp('Missing:')
%disp(missing)

%Data cleaning
%Drop rows where Country is null
country_indices = ~ismissing(operations_table.Country);
operations_table = operations_table(country_indices, :);
%Drop columns where Takeoff Latitude and Takeoff Longitude is null
lat_indices = ~ismissing(operations_table.TakeoffLatitude);
operations_table = operations_table(lat_indices, :);
%Drop columns where Target Latitude and Target Longitude is null
lat_indices = ~ismissing(operations_table.TargetLatitude);
operations_table = operations_table(lat_indices, :);
long_indices = ~ismissing(operations_table.TargetLongitude);
operations_table = operations_table(long_indices, :);
%Drop unused columns
operations_table = removevars(operations_table, {'UnitID', 'MissionType', 'TargetID', 'TargetPriority', 'Altitude_HundredsOfFeet_'});

writetable(operations_table,'operations2.csv');


