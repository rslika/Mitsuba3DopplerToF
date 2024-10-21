clear
n=2;
psnr_max=0;
show_image=0;
while(1)
  f0=readNPY("./"+num2str(n-2)+"_homo.npy");
  f1=readNPY("./"+num2str(n-1)+"_homo.npy");
  f2=readNPY("./"+num2str(n)+"_homo.npy");
  f3=readNPY("./"+num2str(n+1)+"_homo.npy");
  if(~exist("./"+num2str(n+2)+"_homo.npy","file")) 
    break; 
  end
  f4=readNPY("./"+num2str(n+2)+"_homo.npy");

  g0=readNPY("./"+num2str(n-2)+"_hetero.npy");
  g1=readNPY("./"+num2str(n-1)+"_hetero.npy");
  g2=readNPY("./"+num2str(n)  +"_hetero.npy");
  g3=readNPY("./"+num2str(n+1)+"_hetero.npy");
  g4=readNPY("./"+num2str(n+2)+"_hetero.npy");

  pre=f1+(f1-f0);
  %pre=f1;
  bac=f3-(f4-f3);
  gpre=g1+(g1-g0);
  %gpre=g1;
  gbac=g3+(g4-g3);
  for keytop=(0e-2:5e-2:50e-2)
  for keybot=(0e-2:5e-2:50e-2)
  %for keytop=30e-2
  %for keybot=10e-2
    if n==3  
  top_range=keytop;
  bot_range=keybot;
    top=min((1+top_range)*max(pre,bac),(1-top_range)*max(pre,bac));
    bot=max((1+bot_range)*min(pre,bac),(1-bot_range)*min(pre,bac));
    %top=max((1+mb_range)*max(pre,bac),(1-mb_range)*max(pre,bac));
    %bot=min((1+mb_range)*min(pre,bac),(1-mb_range)*min(pre,bac));
    %pre_top=max(pre*(1+pre_range),pre*(1-pre_range));
    %pre_bot=min(pre*(1+pre_range),pre*(1-pre_range));

    %res=((f2>=pre_top|f2<pre_bot)&f2>bot&f2<top);
    res=(f2>bot&f2<top);
    res_p=res.*f2;
    res_i=uint8(res);
    %figure;
    %surf(res_i);
    %saveas(gcf,"./"+num2str(n)+"_mb.png")
    colormap_name = redblue(256);  % 选择颜色映射表（'jet', 'parula', 'hsv', 等）
    indexed_image = uint8(res_i * 255);  % 将归一化数据映射到0-255
    rgb_image_mb = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    %imshow(rgb_image);
    %imwrite(rgb_image,"./"+num2str(n)+"_mb.png");

    data=f2;
    f2_pre=res.*pre+~res.*f2;
    data_pre=f2_pre;
    data_min = min(prctile(data(:),1),prctile(data_pre(:),1));  % 获取数据最小值
    data_max = max(prctile(data(:),99),prctile(data_pre(:),99));  % 获取数据最大值
    data_norm = (data - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
    indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
    rgb_image_homo_ori = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    %figure();
    %imshow(rgb_image);
    %imwrite(rgb_image,"./"+num2str(n)+"_homo.png");

    data_norm = (data_pre - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
    indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
    rgb_image_homo_pre = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    %figure();
    %imshow(rgb_image);
    %imwrite(rgb_image,"./"+num2str(n)+"_homo_pre.png");

    data=g2;
    g2_pre=res.*gpre+~res.*g2;
    %g2_pre=res.*gbac+~res.*g2;
    data_pre=g2_pre;
    data_min = min(prctile(data(:),1),prctile(data_pre(:),1));  % 获取数据最小值
    data_max = max(prctile(data(:),99),prctile(data_pre(:),99));  % 获取数据最大值
    data_norm = (data - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
    indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
    rgb_image_hetero_ori = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    %figure();
    %imshow(rgb_image);
    %imwrite(rgb_image,"./"+num2str(n)+"_hetero.png");

    data_norm = (data_pre - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
    indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
    rgb_image_hetero_pre = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    %figure();
    %imshow(rgb_image);
    %imwrite(rgb_image,"./"+num2str(n)+"_hetero_pre.png");
%% 
%       for key2=(1:-0.05:0)
      for key2=0.47
      for key3=(2.0:0.2:3.0)
%       for key3=1.5
      data=(g2./f2);
      data_pre=(g2_pre./f2_pre);

      data_min = min(prctile(data(:),1),prctile(data_pre(:),1));  % 获取数据最小值
      data_max = max(prctile(data(:),99),prctile(data_pre(:),99));  % 获取数据最大值
      data_abs = max(abs(data_max),abs(data_min));
      data_max=data_abs;
      data_min=-data_abs;

      data_norm = (data - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
      indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
      rgb_image_ori = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
      if show_image==1
      figure(1);
      subplot(3, 1, 1); 
      imshow(rgb_image_ori);
      end
      imwrite(rgb_image_ori,"./"+num2str(n)+"_speed.png");

      data_norm = (data_pre - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
      indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
      rgb_image_pre = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
      if show_image==1
      figure(1);
      subplot(3, 1, 2); 
      imshow(rgb_image_pre);
      end
      imwrite(rgb_image_pre,"./"+num2str(n)+"_speed_pre.png")

      data_gt=readNPY("./"+num2str(n)+"_speed_gt.npy");
      data_gt=data_gt(:,:,1);
%       data_min = prctile(data_gt(:),1);  % 获取数据最小值
%       data_max = prctile(data_gt(:),99); % 获取数据最大值
%       data_abs = max(abs(data_max),abs(data_min));
%       data_max=data_abs;
%       data_min=-data_abs;

      data_gt_mean = mean(data_gt(:));         % 计算所有元素的均值
      data_gt_std = std(data_gt(:));           % 计算所有元素的标准差
      % 设置超出均值 ± 2 倍标准差的元素为 NaN
      data_gt_cleaned = data_gt ;
      data_gt_cleaned(abs(data_gt - data_gt_mean) > key3 * data_gt_std) = 0;

%       data_min = prctile(data_gt_cleaned(:),1);  % 获取数据最小值
%       data_max = prctile(data_gt_cleaned(:),99); % 获取数据最大值
%       data_abs = max(abs(data_max),abs(data_min));
%       data_max=data_abs;
%       data_min=-data_abs;
      data_norm = (data_gt_cleaned*key2 - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
      indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
      rgb_image_gt = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
      if show_image==1
      figure(1);
      subplot(3, 1, 3); 
      imshow(rgb_image_gt);
      end
      imwrite(rgb_image_gt,"./"+num2str(n)+"_speed_gt.png");
%% 

      % 读取图像
      gt_img= imread(num2str(n)+"_speed_gt.png");
      pre_img= imread(num2str(n)+"_speed_pre.png");
      img= imread(num2str(n)+"_speed.png");
%       gt_img= rgb_image_gt; 
%       pre_img= rgb_image_pre;
%       img= rgb_image;
      
      % 计算RMSE
      rmse_value = calculate_rmse(gt_img, img);
      fprintf('img RMSE: %.2f\n', rmse_value);
      
      % 计算PSNR
      psnr_value = calculate_psnr(gt_img, img);
      fprintf('img PSNR: %.2f dB\n', psnr_value);

      % 计算RMSE
      rmse_value_pre = calculate_rmse(gt_img, pre_img);
      fprintf('pre RMSE: %.2f\n', rmse_value_pre);
      
      % 计算PSNR
      psnr_value_pre = calculate_psnr(gt_img, pre_img);
      fprintf('pre PSNR: %.2f dB\n', psnr_value_pre);
        if(psnr_value_pre>psnr_max)
          psnr_max=psnr_value_pre;
          rmse_max=rmse_value_pre;
          psnr_ori=psnr_value;
          rmse_ori=rmse_value;
          key3_best=key3;
          key2_best=key2;
          keytop_best=keytop;
          keybot_best=keybot;
          rgb_image_gt_best=rgb_image_gt;
          rgb_image_pre_best=rgb_image_pre;
          rgb_image_ori_best=rgb_image_ori;
          rgb_image_mb_best=rgb_image_mb;
          rgb_image_homo_pre_best=rgb_image_homo_pre;
          rgb_image_hetero_pre_best=rgb_image_hetero_pre;
          rgb_image_homo_ori_best=rgb_image_homo_ori;
          rgb_image_hetero_ori_best=rgb_image_hetero_ori;
        end
      fprintf('keytop: %.5f keybot: %.5f key2: %.5f key3: %.5f \n\n', keytop,keybot,key2,key3);
      end
      end
    end
  end
  end
  n=n+1;
end
  fprintf('best keytop: %.5f best keybot: %.5f best key2: %.5f best key3: %.5f \n', keytop_best,keybot_best,key2_best,key3_best);
  fprintf('psnr_max : %.5f dB rmse_max : %.5f\n', psnr_max,rmse_max);
  fprintf('psnr_ori : %.5f dB rmse_ori : %.5f\n', psnr_ori,rmse_ori);
  figure(1);
  subplot(3,1,1);
  imshow(rgb_image_ori_best);
  imwrite(rgb_image_ori_best,"./rgb_image_ori_best.png");
  subplot(3,1,2);
  imshow(rgb_image_pre_best);
  imwrite(rgb_image_pre_best,"./rgb_image_pre_best.png");
  subplot(3,1,3);
  imshow(rgb_image_gt_best);
  imwrite(rgb_image_gt_best,"./rgb_image_gt_best.png");
  imwrite(rgb_image_homo_pre_best,"./rgb_image_homo_pre_best.png");
  imwrite(rgb_image_hetero_pre_best,"./rgb_image_hetero_pre_best.png");
  imwrite(rgb_image_homo_ori_best,"./rgb_image_homo.png");
  imwrite(rgb_image_hetero_ori_best,"./rgb_image_hetero.png");
  imwrite(rgb_image_mb_best,"./rgb_image_mb_best.png");



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




