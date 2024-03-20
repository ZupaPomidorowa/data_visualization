clc;
clear;
close all;

file_path = 'onlinefoods.csv';
food_table = readtable(file_path);


%Online Food order coordinates
Lat = food_table.latitude;
Long = food_table.longitude;

f1 = figure('Name', 'Geographical coordinates');
scatter(Lat, Long, 'filled');
title('Geographical coordinates');
xlabel('Latitude');
ylabel('Longitude');
grid on;

%Online Food order coordinates based on feedback
feedback = food_table.Feedback; 
colors = zeros(size(feedback));
colors(strcmp(feedback, 'Positive')) = 1;  
colors(strcmp(feedback, 'Negative')) = 2; 

f2 = figure('Name', 'Geographical coordinates');
scatter(Lat, Long, [], colors, 'filled');
title('Geographical Coordinates with Feedback');
xlabel('Latitude');
ylabel('Longitude');
grid on;