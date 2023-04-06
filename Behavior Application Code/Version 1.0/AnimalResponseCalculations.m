clc;

prompt = "Hits: ";
prompt2 = "Misses: ";
prompt3 = "False Alarms: ";
prompt4 = "Correct Rejections: ";
hits = input(prompt);
misses = input(prompt2);
falseAlarms = input(prompt3);
correctRejections = input(prompt4);
adjusted = 0;

if hits == 0
    hits = (1/(2*misses))*misses;
    misses = misses-hits;
    adjusted = 1;
end
if misses == 0
    misses = (1/(2*hits))*hits;
    hits = hits-misses;
    adjusted = 1;
end
if falseAlarms == 0
    falseAlarms = (1/(2*correctRejections))*correctRejections;
    correctRejections = correctRejections-falseAlarms;
    adjusted = 1;
end
if correctRejections == 0
    correctRejections = (1/(2*falseAlarms))*falseAlarms;
    falseAlarms = falseAlarms-correctRejections;
    adjusted = 1;
end

Accuracy = (hits+correctRejections)/(hits+misses+falseAlarms+correctRejections)*100;
Precision = (hits)/(hits+falseAlarms)*100;
TPR = (hits)/(hits+misses)*100;
TNPR = (correctRejections)/(correctRejections+falseAlarms)*100;
F1 = 2*(Precision*TPR)/(Precision+TPR);
D_Prime = norminv(hits/(hits+misses))-norminv(falseAlarms/(falseAlarms+correctRejections));

if adjusted == 1
    disp(" ");
    disp("Adjusted Hits: " + hits);
    disp("Adjusted Misses: " + misses);
    disp("Adjusted False Alarms: " + falseAlarms);
    disp("Adjusted Correct Rejections: " + correctRejections);
end

disp(" ");
disp("Accuracy: " + Accuracy);
disp("Precision: " + Precision);
disp("Hit Rate: " + TPR);
disp("Correct Rejection Rate: " + TNPR);
disp("F1-Score: " + F1);
disp("D': " + D_Prime);