function imshow_better(I)
% 定义边框宽度和颜色
border_width = 10;          % 边框宽度为10像素
border_color = [0, 0, 0];  % 白色边框 (RGB: [255, 255, 255])

% 获取图像大小
[rows, cols, channels] = size(I);

% 创建带有边框的新图像矩阵
I_with_border = uint8(zeros(rows + 2*border_width, cols + 2*border_width, channels));

% 填充边框区域为指定颜色
I_with_border(:, :, 1) = border_color(1);  % 红色通道
I_with_border(:, :, 2) = border_color(2);  % 绿色通道
I_with_border(:, :, 3) = border_color(3);  % 蓝色通道

% 将原图像嵌入到新图像中央
I_with_border(border_width+1:end-border_width, border_width+1:end-border_width, :) = I;

% 显示带边框的图像
imshow(I_with_border);
end
