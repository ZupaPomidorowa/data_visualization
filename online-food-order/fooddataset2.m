clc;
clear;
close all;

file_path = 'onlinefoods.csv';
food_table = readtable(file_path);

%Online food orders based on Marital Status
MartialStatus = food_table.MaritalStatus;
Gender = food_table.Gender;

martial = unique(MartialStatus);
genders = unique(Gender);

counts_male = zeros(size(martial));
counts_female = zeros(size(martial));
for i = 1:numel(martial)
    counts_male(i) = sum(strcmp(MartialStatus, martial{i}) & strcmp(Gender, 'Male'));
    counts_female(i) = sum(strcmp(MartialStatus, martial{i}) & strcmp(Gender, 'Female'));
end

f1 = figure('Name', 'Online food orders based on Marital Status');
bar(martial, [counts_female, counts_male], 'stacked');
title('Online food orders based on Marital Status');
legend(genders);
grid on;

%Online food orders based on Occupation
Occupation = food_table.Occupation;
Gender = food_table.Gender;

occupation = unique(Occupation);
genders = unique(Gender);

counts_male = zeros(size(occupation));
counts_female = zeros(size(occupation));
for i = 1:numel(occupation)
    counts_male(i) = sum(strcmp(Occupation, occupation{i}) & strcmp(Gender, 'Male'));
    counts_female(i) = sum(strcmp(Occupation, occupation{i}) & strcmp(Gender, 'Female'));
end

f2 = figure('Name', 'Online food orders based on Occupation');
bar(occupation, [counts_female, counts_male], 'stacked');
title('Online food orders based on Occupation');
legend(genders);
grid on;

%Online food orders based on Monthly Income
MonthlyIncome = food_table.MonthlyIncome;
Gender = food_table.Gender;

incomes = unique(MonthlyIncome);
genders = unique(Gender);

counts_male = zeros(size(incomes));
counts_female = zeros(size(incomes));

for i = 1:numel(incomes)
    counts_male(i) = sum(MonthlyIncome == incomes(i) & strcmp(Gender, 'Male'));
    counts_female(i) = sum(MonthlyIncome == incomes(i) & strcmp(Gender, 'Female'));
end

f3 = figure('Name', 'Online food orders based on Monthly Income');
bar(incomes, [counts_female, counts_male], 'stacked');
title('Online food orders based on Monthly Income');
legend(genders, 'Location', 'bestoutside');
xlabel('Monthly Income');
ylabel('Count');
grid on;

% EducationalQualifications
EducationalQualifications = food_table.EducationalQualifications;
Gender = food_table.Gender;

qualifications = unique(EducationalQualifications);
genders = unique(Gender);

counts_male = zeros(size(qualifications));
counts_female = zeros(size(qualifications));

for i = 1:numel(qualifications)
    counts_male(i) = sum(strcmp(EducationalQualifications, qualifications{i}) & strcmp(Gender, 'Male'));
    counts_female(i) = sum(strcmp(EducationalQualifications, qualifications{i}) & strcmp(Gender, 'Female'));
end

f4 = figure('Name', 'Online food orders based on Educational Qualifications');
bar(qualifications, [counts_female, counts_male], 'stacked');
title('Online food orders based on Educational Qualifications');
legend(genders, 'Location', 'bestoutside'); % Change 'Male' and 'Female' as needed
xlabel('Educational Qualifications');
ylabel('Count');
grid on;


