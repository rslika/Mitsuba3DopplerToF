clear
n=2;
while(1)
  f0=readNPY("./"+num2str(n-2)+"_homo.npy");
  f1=readNPY("./"+num2str(n-1)+"_homo.npy");
  f2=readNPY("./"+num2str(n)+"_homo.npy");
  f3=readNPY("./"+num2str(n+1)+"_homo.npy");
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
%   for keytop=(0e-2:5e-2:50e-2)
  for keytop=0.25
  for keybot=(0e-2:5e-2:50e-2)
%   for keytop=40e-2
%   for keybot=25e-2
  top_range=keytop;
  bot_range=keybot;
    top=min((1+top_range)*max(pre,bac),(1-top_range)*max(pre,bac));
    bot=max((1+bot_range)*min(pre,bac),(1-bot_range)*min(pre,bac));
    %top=max((1+mb_range(m))*max(pre,bac),(1-mb_range(m))*max(pre,bac));
    %bot=min((1+mb_range(m))*min(pre,bac),(1-mb_range(m))*min(pre,bac));
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
    rgb_image = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    imshow(rgb_image);
    imwrite(rgb_image,"./"+num2str(n)+"_mb.png");

    f2_pre=res.*pre+~res.*f2;

    g2_pre=res.*gpre+~res.*g2;
      data=(g2./f2);
      data_pre=(g2_pre./f2_pre);

      data_min = min(prctile(data(:),1),prctile(data_pre(:),1));  % 获取数据最小值
      data_max = max(prctile(data(:),99),prctile(data_pre(:),99));  % 获取数据最大值
      data_abs = max(abs(data_max),abs(data_min));
      data_max=data_abs;
      data_min=-data_abs;

      data_norm = (data - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
      indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
      rgb_image = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
      imwrite(rgb_image,"./"+num2str(n)+"_speed.png");

      data_norm = (data_pre - data_min) / (data_max - data_min);  % 归一化到[0, 1]之间
      indexed_image = uint8(data_norm* 255);  % 将归一化数据映射到0-255
      rgb_image = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
      imwrite(rgb_image,"./"+num2str(n)+"_speed_pre.png")

  end
  end
end