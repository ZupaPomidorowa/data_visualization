clc;
clear;
close all;

file_path = 'onlinefoods.csv';
food_table = readtable(file_path);

%Online Food order feedbacks
Feedback = food_table.Feedback;
feedback = unique(Feedback);
counts_feedback = zeros(size(feedback));

for i = 1:numel(feedback)
    counts_feedback(i) = sum(strcmp(Feedback, feedback{i}));
end

counts_feedback = counts_feedback/ numel(Feedback);

f1 = figure('Name', 'Online Food order feedbacks');
pie(counts_feedback);
title('Online Food order feedbacks');
legend(feedback);
grid on;

%Online food order feedback types based on Marital Status / Occupation /
%Monthly Income / Educational Qualifications
Feedback = food_table.Feedback;
feedback = unique(Feedback);
counts_feedback = zeros(size(feedback));

MartialStatus = food_table.EducationalQualifications;
martial = unique(MartialStatus);
counts_martial = zeros(size(martial));

counts_positive = zeros(size(martial));
counts_negative = zeros(size(martial));

for i = 1:numel(martial)
    counts_positive(i) = sum(strcmp(MartialStatus, martial{i}) & strcmp(Feedback, 'Positive'));
    counts_negative(i) = sum(strcmp(MartialStatus, martial{i}) & strcmp(Feedback, 'Negative'));
end

f2 = figure('Name', 'Online food order feedback types based on Educational Qualifications');
bar(martial, [counts_negative, counts_positive], 'stacked');
title('Online food order feedback types based on Educational Qualifications');
legend(feedback);
grid on;
