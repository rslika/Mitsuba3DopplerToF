clear
theta = pi / 4;
Rx = [1 0 0 0;
      0 cos(theta) -sin(theta) 0.5;
      0 sin(theta) cos(theta) 0.5;
      0 0 0 1];
[rows, cols] = size(Rx);

% 逐行打印矩阵
for i = 1:rows
    fprintf('%.2f %.2f %.2f %.2f ', Rx(i, :));
end