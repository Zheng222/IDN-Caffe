clear; 
%% To do data augmentation
folder = '291/';
savepath = '291-aug/';
filepaths_91 = dir(fullfile(folder,'*.bmp'));
filepaths_200 = dir(fullfile(folder,'*.jpg'));
filepaths = cat(1,filepaths_91,filepaths_200);
if ~exist(savepath,'file')
    mkdir(savepath);
end

for i = 1 : length(filepaths)
    filename = filepaths(i).name;
    [add, im_name, type] = fileparts(filepaths(i).name);  %add is path, im_name is filename, and type is extention name
    image = imread(fullfile(folder, filename));
    
    count = 0;
    
    for angle = 0: 90 :270
        
        im_rot = imrotate(image, angle);
        
        for scale = 1.0 : -0.1 : 0.6
            im_down = imresize(im_rot, scale, 'bicubic');

            for j = 3 : -2 : 1  % 3--> not flip, 1-->flip horizontally
                if j == 3
                    im_flip = im_down;
                else
                    im_flip = flip(im_down, j);
                end
                imwrite(im_flip, [savepath im_name, '_' num2str(count) '.bmp']);
                count = count + 1;
            end

        end
    end  
end
