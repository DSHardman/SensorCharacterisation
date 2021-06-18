figure()
hold on
for i = 1:8
    plot(response(1:1500,i))
end

x = zeros(501,0);
[x(1), ~] = ginput(1);

for i = 1:499
    i
    hold off
    for j = 1:8
        plot(response(round(x(i)+950):round(x(i)+1050),j))
        hold on
    end
    [xn, ~] = ginput(1);
    x(i+1) = xn + x(i) + 949;
    
end

500
hold off
for j = 1:8
    plot(response(round(x(i)+850):round(x(i)+950),j))
    hold on
end
[xn, ~] = ginput(1);
x(501) = xn + x(500) + 849;
