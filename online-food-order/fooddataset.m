clc;
clear;
close all;

file_path = 'onlinefoods.csv';
food_table = readtable(file_path);

%Show first 5 rows
food_head = head(food_table, 5);
disp(food_head);

%To remove
food_table = removevars(food_table, 'Var13');

%Check missing values
missing = sum(ismissing(food_table));
%disp('Missing:')
%disp(missing)

%Column names
column_names = food_table.Properties.VariableNames;
%disp('Column names:');
%disp(column_names);

%Food orders bases on age
Age = food_table.Age;
ages = unique(Age);
counts_age = zeros(size(ages));

for i = 1:numel(ages)
    counts_age(i) = sum(Age == ages(i));
end

f1 = figure('Name', 'Food orders bases on age');
bar(ages, counts_age);
title('Food orders bases on age');
xlabel('Count');
ylabel('Age');
grid on;

%Food orders bases on age group
age_group = {'<20', '21-25', '26-30', '31<'};
counts_age_group = zeros(size(age_group));

for i = 1:numel(age_group)
    if i == 1
        counts_age_group(i) = sum(Age < 20);
    elseif i == 2
        counts_age_group(i) = sum(Age >= 21 & Age <=25);
    elseif i == 3
        counts_age_group(i) = sum(Age >= 26 & Age <=30);
    else
        counts_age_group(i) = sum(Age >= 31);
    end
end

%counts_age_group = counts_age_group/ numel(Age);

f2 = figure('Name', 'Food orders bases on age group');
pie(counts_age_group);
title('Food orders bases on age group');
legend(age_group);
grid on;


%Online Food orders based on gender
Gender = food_table.Gender;
genders = unique(Gender);
counts_gender = zeros(size(genders));

for i = 1:numel(genders)
    counts_gender(i) = sum(strcmp(Gender, genders{i}));
end

counts_gender = counts_gender / numel(Gender);

f3 = figure('Name', 'Food orders bases on gender');
pie(counts_gender);
title('Food orders bases on gender');
legend(genders);
grid on;

%Online food orders based on Marital Status
MartialStatus = food_table.MaritalStatus;
martial = unique(MartialStatus);
counts_martial = zeros(size(martial));

for i = 1:numel(martial)
    counts_martial(i) = sum(strcmp(MartialStatus, martial{i}));
end

counts_martial = counts_martial/ numel(MartialStatus);

f4 = figure('Name', 'Online food orders based on Marital Status');
pie(counts_martial);
title('Online food orders based on marital status');
legend(martial);
grid on;

%Online food orders based on Occupation
Occupation = food_table.Occupation;
occupations = unique(Occupation);
counts_occupation = zeros(size(occupations));

for i = 1:numel(occupations)
    counts_occupation(i) = sum(strcmp(Occupation, occupations{i}));
end

counts_occupation = counts_occupation/ numel(Occupation);

f5 = figure('Name', 'Online food orders based on occupation');
pie(counts_occupation);
title('Online food orders based on Occupation');
legend(occupations);
grid on;

%Online food orders based on Monthly Income
MonthlyIncome = food_table.MonthlyIncome;
monthlyincome = unique(MonthlyIncome);
counts_monthlyincome = zeros(size(monthlyincome));

for i = 1:numel(monthlyincome)
    counts_monthlyincome(i) = sum(strcmp(MonthlyIncome, monthlyincome{i}));
end

counts_monthlyincome = counts_monthlyincome/ numel(MonthlyIncome);

f6 = figure('Name', 'Online food orders based on Monthly Income');
pie(counts_monthlyincome);
title('Online food orders based on Monthly Income');
legend(monthlyincome);
grid on;

%Distribution of educational qualifications
Education = food_table.EducationalQualifications;

educations = unique(Education);

counts_education = zeros(size(educations));
for i = 1:numel(educations)
    counts_education(i) = sum(strcmp(Education, educations{i}));
end

[counts_education, idx] = sort(counts_education, 'descend');

f7 = figure('Name', 'Educational qualifications');
barh(educations(idx), counts_education);
title('Educational qualifications');
xlabel('Count');
ylabel('Occupation');
grid on;


%Distribution of family size
FamilySize = food_table.FamilySize;

familysize = unique(FamilySize);

counts_familysize= zeros(size(familysize));
for i = 1:numel(educations)
    counts_familysize(i) = sum(FamilySize == familysize(i));
end

[counts_familysize, idx] = sort(counts_familysize, 'descend');

f8 = figure('Name', 'Family size');
bar(familysize(idx), counts_familysize);
title('Family size');
ylabel('Count');
xlabel('Family size');
grid on;






