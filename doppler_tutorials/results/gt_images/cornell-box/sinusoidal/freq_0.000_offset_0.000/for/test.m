clear
n=2;
while(1)
  f0=readNPY("./"+num2str(n-2)+".npy");
  f1=readNPY("./"+num2str(n-1)+".npy");
  f2=readNPY("./"+num2str(n)+".npy");
  f3=readNPY("./"+num2str(n+1)+".npy");
  f4=readNPY("./"+num2str(n+2)+".npy");

  pre=f1+(f1-f0);
  bac=f3-(f4-f3);
  range=6e-4;
  for m=1:length(range)
    top=(1+range(m))*max(pre,bac);
    bot=(1+range(m))*min(pre,bac);

    res=(f2>bot&f2<top);
    res_p=res.*f2;
    res_i=uint8(res);
    %figure;
    %surf(res_i);
    %saveas(gcf,"./"+num2str(n)+"_mb.png")
    colormap_name = jet(256);  % 选择颜色映射表（'jet', 'parula', 'hsv', 等）
    indexed_image = uint8(res_i * 255);  % 将归一化数据映射到0-255
    rgb_image = ind2rgb(indexed_image, colormap_name);  % 转换为RGB图像
    %imshow(rgb_image);
    imwrite(rgb_image,"./"+num2str(n)+"_mb.png");
  end
  n=n+1;
end