clc;
clear;
close all;

file_path = 'operations2.csv';
operations_table = readtable(file_path);

%Show first 5 rows
operations_head = head(operations_table, 5);
disp(operations_head);

%Number of rows
rows = height(operations_table);
disp(['Rows: ' num2str(rows)]);

%AircraftSeries
% AircraftSeries = operations_table.AircraftSeries;
% aircraft = unique(AircraftSeries);
% counts_aircraft = zeros(size(aircraft));
% 
% for i = 1:numel(aircraft)
%     counts_aircraft(i) = sum(strcmp(AircraftSeries, aircraft{i}));
% end
% 
% [counts_aircraft_sorted, idx] = sort(counts_aircraft, 'descend');
% aircraft_sorted = aircraft(idx);
% 
% f1 = figure('Name', 'AircraftSeries'); 
% bar(aircraft_sorted, counts_aircraft_sorted);
% title('AircraftSeries');
% xlabel('Aircraft series');
% ylabel('Count');

AircraftSeries = operations_table.AircraftSeries;
AirForce = operations_table.AirForce;

unique_aircraft = unique(AircraftSeries);
unique_airforces = unique(AirForce);

[unique_aircraft_sorted, idx] = sort(unique_aircraft);
counts = zeros(numel(unique_aircraft_sorted), numel(unique_airforces));

for i = 1:numel(unique_aircraft_sorted)
    for j = 1:numel(unique_airforces)
        counts(i, j) = sum(strcmp(AircraftSeries, unique_aircraft_sorted{i}) & strcmp(AirForce, unique_airforces{j}));
    end
end

f1 = figure('Name', 'AircraftSeries'); 
bar(counts, 'stacked');
title('AircraftSeries by AirForce');
xlabel('Aircraft Series');
ylabel('Count');
legend(unique_airforces, 'Location', 'EastOutside');
xticks(1:numel(unique_aircraft_sorted));
xticklabels(unique_aircraft_sorted);

%TakeoffBase
TakeoffBase = operations_table.TakeoffBase;
takeoffbase = unique(TakeoffBase);
counts_takeoffbase = zeros(size(takeoffbase));

for i = 1:numel(takeoffbase)
    counts_takeoffbase(i) = sum(strcmp(TakeoffBase, takeoffbase{i}));
end

takeoffbase_filtered = takeoffbase(counts_takeoffbase > 15);
counts_takeoffbase_filtered = counts_takeoffbase(counts_takeoffbase > 15);

[counts_takeoffbase_sorted, idx_takeoffbase] = sort(counts_takeoffbase_filtered, 'descend');
takeoffbase_sorted = takeoffbase_filtered(idx_takeoffbase);

f2 = figure('Name', 'TakeoffBase'); 
bar(takeoffbase_sorted, counts_takeoffbase_sorted);
title('Takeoff Bases');
xlabel('Takeoff Base');
ylabel('Counts');

%Target Country
TCountry = operations_table.TargetCountry;
tcountry = unique(TCountry);
counts_tcountry = zeros(size(tcountry));

for i = 1:numel(tcountry)
    counts_tcountry(i) = sum(strcmp(TCountry, tcountry{i}));
end

[counts_sorted, idx] = sort(counts_tcountry, 'descend');
tcountry_sorted = tcountry(idx);

f3 = figure('Name', 'Target Country'); 
bar(tcountry_sorted, counts_sorted);
title('Target Country');
xlabel('Country');
ylabel('Count');

%Target country pie chart
top_countries = tcountry_sorted(1:4);
others_count = sum(counts_sorted(5:end));

pie_labels = [top_countries; {'Others'}];
pie_counts = [counts_sorted(1:4); others_count];

total_count = sum(pie_counts);
percentages = (pie_counts / total_count) * 100;
pie_labels_with_percentages = cell(size(pie_labels));
for i = 1:numel(pie_labels)
    pie_labels_with_percentages{i} = sprintf('%s\n%.1f%%', pie_labels{i}, percentages(i));
end

f4 = figure('Name', 'Target Country Pie Chart');
pie(pie_counts, pie_labels_with_percentages);
title('Target Countries');
