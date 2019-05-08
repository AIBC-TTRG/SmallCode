%Date          2019.5.8
%Autor         朱春丽
%Content       Visualization of Pedestrian Target tracking on matlab
%draw_rect     Frame function
%Source        https://blog.csdn.net/loveaborn/article/details/8545809#
% main.m
clc;
clear;
close all;
image = dir('/home/zcl/A/data/img/');
files = dir(fullfile('/home/zcl/A/data/img/','*.jpg'));
lengthFiles = length(files);
%disp(lengthFiles);
    filename = '/home/zcl/A/data/tracker/woman_COT.txt';
    [data1,data2,data3,data4]=textread(filename,'%n%n%n%n');%定义数组读取文本
for i = 1:lengthFiles
    %disp(i);
    Img = imread(strcat('/home/zcl/A/data/img/',files(i).name));%文件所在路径
    disp(strcat('/home/zcl/A/data/img/',files(i).name)) %打印文件路径
    %imshow(Img)
     pointAll = [data2(i), data1(i)];%读取跟踪框的x和y坐标
    %pointAll = [120,212];   
    %disp(pointAll);
     windSize = [data3(i), data4(i)];%读取跟踪框的长和宽
    %windSize = [21,95];
    [state,results]=draw_rect(Img,pointAll,windSize); 
    imshow(results)  
     if i < 10
         file_path = sprintf('/home/zcl/A/result/000%d.jpg',i);
     elseif i>=10&&i<100
          file_path = sprintf('/home/zcl/A/result/00%d.jpg',i);
     elseif  i>=100
          file_path = sprintf('/home/zcl/A/result/0%d.jpg',i);
     end  
     imwrite(results, file_path);%保存图片且带命名格式
end
