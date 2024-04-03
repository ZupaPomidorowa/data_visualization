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

%Mission Date
MissionDate = operations_table.MissionDate;
missiondate = unique(MissionDate);
counts_missiondate = zeros(size(missiondate));

for i = 1:numel(missiondate)
    counts_missiondate(i) = sum(MissionDate == missiondate(i));
end

f1 = figure('Name', 'MissionDate'); 
bar(missiondate, counts_missiondate);
title('Mission dates');
xlabel('Date');
ylabel('Number of missions');

[sorted_counts, idx] = sort(counts_missiondate, 'descend');
for i = 1:3
    disp(['Date: ', datestr(missiondate(idx(i))), ', Count: ', num2str(sorted_counts(i))]);
end

%Theater of operations
Theater = operations_table.TheaterOfOperations;
theater = unique(Theater);
counts_theater = zeros(size(theater));

for i = 1:numel(theater)
    counts_theater(i) = sum(strcmp(Theater, theater{i}));
end

f2 = figure('Name', 'TheaterOfOperations'); 
bar(theater, counts_theater);
title('Theater of operations');
xlabel('Theater');
ylabel('Counts');


%Countries
Country = operations_table.Country;
country = unique(Country);
counts_country = zeros(size(country));

for i = 1:numel(country)
    counts_country(i) = sum(strcmp(Country, country{i}));
end

percentages = (counts_country / sum(counts_country)) * 100;

f3 = figure('Name', 'Countries');
pie(percentages);
title('Country');
legend(country, 'Location', 'EastOutside');

%AirForce 
AirForce = operations_table.AirForce;
airforce = unique(AirForce);
counts_airforce = zeros(size(airforce));

for i = 1:numel(airforce)
    counts_airforce(i)  = sum(strcmp(AirForce, airforce{i}));
end


f4 = figure('Name', 'Airforce'); 
bar(airforce, counts_airforce);
title('Airforce');
xlabel('Airforce name');
ylabel('Counts');

%Airforce in each Country
Country = operations_table.Country;
AirForce = operations_table.AirForce;

unique_countries = unique(Country);
unique_airforces = unique(AirForce);

counts = zeros(numel(unique_countries), numel(unique_airforces));

for i = 1:numel(unique_countries)
    for j = 1:numel(unique_airforces)
        counts(i, j) = sum(strcmp(Country, unique_countries{i}) & strcmp(AirForce, unique_airforces{j}));
    end
end
f5 = figure('Name', 'Airforce'); 
bar(counts, 'stacked');
title('Airforce Orders by Country');
xlabel('Country');
ylabel('Counts');
legend(unique_airforces, 'Location', 'EastOutside');
xticklabels(unique_countries);



% Airforce and country that belongs
% Country = operations_table.Country;
% AirForce = operations_table.AirForce;
% 
% unique_countries = unique(Country);
% unique_airforces = unique(AirForce);
% 
% counts = zeros(numel(unique_airforces), numel(unique_countries));
% 
% for i = 1:numel(unique_airforces)
%     for j = 1:numel(unique_countries)
%         counts(i, j) = sum(strcmp(AirForce, unique_airforces{i}) & strcmp(Country, unique_countries{j}));
%     end
% end
% 
% f4 = figure('Name', 'Airforce'); 
% bar(counts, 'stacked');
% title('Airforce Orders by Country');
% ylabel('Counts');
% legend(unique_countries, 'Location', 'EastOutside');
% xticks(1:numel(unique_airforces));
% xticklabels(unique_airforces);







