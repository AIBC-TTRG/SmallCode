close all
clear
clc
%****************************************************
% function: Converting mat file to TXT file
%   files:    path of mat files 
%   txtpath:  The path to store txt files

files = dir(fullfile('/home/aibc/Wen/mat_otb_100_results_with_code/mat_otb_100_results_with_code/mat_files/','*.mat'));

lengthFiles = length(files);
disp(lengthFiles);

evalType='BACF';
txtPath = '/home/aibc/Wen/mat_otb_100_results_with_code/mat_otb_100_results_with_code/txt_files/';
if ~exist(txtPath, 'file')
    mkdir(txtPath);
end

for i = 1:1:length(files)
    
    mat_paths = strcat('/home/aibc/Wen/mat_otb_100_results_with_code/mat_otb_100_results_with_code/mat_files/',files(i).name);
    
    aa = load(mat_paths);       % Load mat file
    result = aa.results.res;    % read groungTruth of mat file
    new_result = result';       % Transposition
    % disp(result)

    
    [pathstr, name, ext] = fileparts(mat_paths);
    lower_name= lower(name);    % Converting uppercase letters to lowercase in strings
%     txtname = strcat(lower_name,'_BACF');
  
    txt_file_name = strcat(lower_name, '.txt');
    
    new = fullfile('/home/aibc/Wen/mat_otb_100_results_with_code/mat_otb_100_results_with_code/txt_files/',txt_file_name)
    fid = fopen(new,'wt');

    [m,n] = size(result);
    
    for i = 1:m
        for j = 1:n
            fprintf(fid,'%8.2f',result(i,j));
        end
            fprintf(fid,'\n');
    end

    fclose(fid);
end
