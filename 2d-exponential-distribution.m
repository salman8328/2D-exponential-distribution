%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%when this code is run, it sometimes goes in to loop and plots after a very
%long time, WHEN THAT HAPPENS PLEASE PAUSE THE CODE AND QUIT DEBUGING AND
%RERUN THE CODE ! PLEASE KEEP ON DOING IT TILL YOU SEE THE PLOT OF STUDENTS
%AND THE DISTRIBUTION OF THEIR POSITION



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
% there are 39 students and the area is 100 sqm, so there are 39
% students/100 sqm, which means there are 0.39 students / meter, which
% becomes our rate.

rate = 39/100 ;
h=0;k=0; % lets say this is our start point , maybe the lecturer position
coordinates=[h k];
dist = [];
for i=1:39 % finds the next coordinate of student, and the distance between the next student is exponentially distributed
r = exprnd(1/rate); % calculates the next distance of student
position = circle(h,k,r); % logic which finds the correct coordinates within the boundary of class
h=position(1);
k=position(2);
coordinates = [coordinates; position(1) position(2)]; % stores coordinates
dist = [dist sqrt((position(1)-coordinates(end-1,1))^2 + (position(2)-coordinates(end-1,2))^2)]; % calculates and stores distance
end

for i=2:39
plot(coordinates(i,1),coordinates(i,2),'*'),
hold on
pause(0.1),
end
axis([-1 10 -1 10])
figure,
hist(dist,10)

function position = circle(h,k,r)  %creates a circle with center as past 
%student coordinate and the radius as the exprnd function output and
%selects a point on that circle as the new coordinate of student within the
%class boundary
choose = 0;
teta = linspace(0,2*pi,500);
x = h + r * cos(teta); % generates x cordinates on circle
y = k + r * sin(teta); % generates y cordinates on circle
while 1
    choose = 0;
    choose = randi([1 500]); % selects random number  
         if x(choose) <= 9 && y(choose) <=9 && x(choose) >= 0 && y(choose) >= 0 % logic to find x,y within the boundary
             position = [x(choose) y(choose)];
             break;
         end
end
end
