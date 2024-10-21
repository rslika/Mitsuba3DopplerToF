function rmse_value = calculate_rmse(I1, I2)
    % I1: 原始图像
    % I2: 处理后的图像
    % 将图像转换为double类型以确保计算精度
    I1 = double(I1);
    I2 = double(I2);
    
    % 计算均方误差
    mse = mean((I1(:) - I2(:)).^2);
    
    % 计算均方根误差
    rmse_value = sqrt(mse);
end
function psnr_value = calculate_psnr(I1, I2)
    % I1: 原始图像
    % I2: 处理后的图像
    % 将图像转换为double类型以确保计算精度
    I1 = double(I1);
    I2 = double(I2);
    
    % 计算均方误差（MSE）
    mse = mean((I1(:) - I2(:)).^2);
    
    % 最大像素值（假设图像为8位，即像素值范围为0到255）
    max_pixel = 255;
    
    % 计算PSNR
    psnr_value = 10 * log10((max_pixel^2) / mse);
end
