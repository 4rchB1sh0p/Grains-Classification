%Segmentation and Classification
%Please note: the code generates only the final solution images with
%answers printed in the title.
%intermidiate images have been commented out, but are shown in the report.
format compact;
close all;
clear;
clc;
home;
%%
%Part 1
%counting number of rice grains in rice imgae 1
%
rice1 = imread('rice_1.png');
%figure,imshow(rice1),title('Rice grain orignal image');
SE3 = strel('disk',20);
background_img_1 = imopen(rice1, SE3);% erosion followed by dilation of rice_2 image
%figure,imshow(background_img_1),title('Rice 1 grain and peas background image'); 
J2 = rice1 - background_img_1;%subtracting background
%figure,imshow(J2),title('Rice 1 image after subtracting background background');
J3 = imadjust(J2);%adjusting contrast of the image
%figure,imshow(J3),title('Rice 1 threshold adjusted image');
J4 = imbinarize(J3,'adaptive','ForegroundPolarity','bright','Sensitivity',0.05);%binarizing image
%figure,imshow(J4),title('Rice 1 binarized image');
J5 = bwareaopen(J4,90);%removing noise from binarized image
figure,imshow(J5),title('Rice 1 binarized image without noise'); %final binazrized 
%image suitable for region proprty calculations
%computing statistics 
[R1,L1] = bwboundaries(J5, 'noholes');%determining 
stats2 = regionprops(J5,'Area','Centroid');%computing region properties
rice_count_1 = length(R1);
imshow(rice1,[])
hold on
for f = 1:rice_count_1
    boundary = R1{f};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
    text(boundary(1,2), boundary(1,1), int2str(f), 'Color','r','FontSize',12,'FontWeight','bold');
end 
title(['Total number of rice grains is ',num2str(rice_count_1)]);
hold off



%%
%Project 2 - Segmentation and Classification
%Part 2 of Exercise 2


%figure,imshow(rice1),title('Rice grain orignal image');
rice2 = imread('rice_2.png');
%Part2
SE3 = strel('disk',20);
background_img_2 = imopen(rice2, SE3);% erosion followed by dilation of rice_2 image
%figure,imshow(background_img_2),title('Rice grain and peas background image'); 
I2 = rice2 - background_img_2;%subtracting background
%figure,imshow(I2),title('Rice2 image after subtracting background background');
I3 = imadjust(I2);%adjusting contrast of the image
%figure,imshow(I3),title('Rice 2 threshold adjusted image');
I4 = imbinarize(I3,'adaptive','ForegroundPolarity','bright','Sensitivity',0.05);%binarizing image
%figure,imshow(I4),title('Rice 2 binarized image');
I5 = bwareaopen(I4,90);%removing noise from binarized image
figure,imshow(I5),title('Rice 2 binarized image without noise'); %final binazrized image for region proprty calculations
%computing statistics 
lables = bwlabel(I5);%labeling the pixel regions
[R2,L2] = bwboundaries(I5, 'noholes');%determining 
stats2 = regionprops(I5,'Area','Centroid');%computing region properties
stats2 = struct2table(stats2);
rice_area = [stats2.Area];
%{
% k means clustering to classify objects in 2 different groups.
%k means clustering is the quikest way to figure out the number of rice
%grains and number of peas in the image, based on the area of individual
%however this method is not giving accurate result, it counts one rice
grain extra!
[grain_count] = kmeans(stats2.Area,2);
for i =1:length(grain_count)
    if grain_count(i)==1
        rice_count_2(i)= rice_area(i);
    else grain_count(i)==2
        peas_count(i) = rice_area(i);
    end
end
max_rice_area = max(rice_count_2);
ricegrains = find([stats2.Area] < max_rice_area);
%}
%however it is not used here to determine the maximum area of rice grain
ricegrains = find([stats2.Area] < 300);% since the maximum number of rice area is 300, anything above 300 are peas. 
onlyrice = ismember(lables,ricegrains);%rice and peas classification
rice_img = rice2;
rice_img(~onlyrice) = 0;%indexing pixel to 0, to remove peas from dislaying 
[R2_binary,L2_binary] = bwboundaries(rice_img, 'noholes');%to locate boundaries without peas
stats2 = regionprops(rice_img,'Area','Centroid');%computing centroid for numeric label location
rice_count_2 = length(R2_binary);%the final rice count in image 2
imshow(rice2,[])%displaying results
%figure,imshow(rice2)
hold on
for k = 1:rice_count_2
    boundary = R2_binary{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
    text(boundary(1,2), boundary(1,1), int2str(k), 'Color','r','FontSize',12,'FontWeight','bold');
end 
title(['Total number of rice grains is ',num2str(rice_count_2)]);
hold off

