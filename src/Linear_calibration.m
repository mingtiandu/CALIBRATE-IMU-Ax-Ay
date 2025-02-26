clear all;clc;close all;

%%
data_ax_g = csvread("data\ax.csv",1,0);
data_ay_g = csvread("data\ay.csv",1,0);

% Data from Orientation 1 (X-axis aligned with gravity)
ax_g = -data_ax_g(:,1)/100; % Replace with your measured ax value (should be close to 9.81)
ay_0 = data_ax_g(:,2)/100; % Replace with your measured ay value (should be close to 0)

% Data from Orientation 2 (Y-axis aligned with gravity)
ax_0 = data_ay_g(:,1)/100; % Replace with your measured ay value (close to 9.81)
ay_g = data_ay_g(:,2)/100; % Replace with your measured ax value (close to 0)

%%
% Compute X-axis parameters
bias_x = mean(ax_0); % Bias is the offset when ax should be 0
reference_ax = zeros(1,length(ax_g));
reference_ax(1,:) = 9.81;
scale_x = reference_ax/(ax_g - bias_x).';

% Compute Y-axis parameters
bias_y = mean(ay_0); % Bias is the offset when ay should be 0
reference_ay = zeros(1,length(ay_g));
reference_ay(1,:) = 9.81;
scale_y = reference_ay/(ay_g - bias_y).';

fprintf('Scale X: %.4f, Bias X: %.4f\n', scale_x, bias_x);
fprintf('Scale Y: %.4f, Bias Y: %.4f\n', scale_y, bias_y);

%% Plot calibration scatter
figure;
subplot(2,1,1)
scatter(ax_g, ay_0, 100, 'b', 'filled'); % Plot data points
hold on;
x_fit = scale_x * (ax_g - bias_x); % Best-fit line
y_fit = scale_y * (ay_0 - bias_y);
scatter(x_fit, y_fit, 100, 'r', 'filled');
xlabel('gravity perpendicular ax');
ylabel('gravity parallel ay');
title('Linear Calibration of ax');
axis([9.3 10.3 -0.3 0.3])
grid on;
hold off;
subplot(2,1,2)
scatter(ay_g, ax_0, 100, 'b', 'filled'); % Plot data points
hold on;
x_fit = scale_x * (ax_0 - bias_x); % Best-fit line
y_fit = scale_y * (ay_g - bias_y);
scatter(y_fit,x_fit , 100, 'r', 'filled');
xlabel('gravity perpendicular ay');
ylabel('gravity parallel ax');
title('Linear Calibration of ay');
axis([9.3 10.3 -0.2 0.2])
grid on;
hold off;