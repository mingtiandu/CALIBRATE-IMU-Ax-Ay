% Load your recorded data (replace 'your_data.mat' with your actual data file)
load('your_data.mat'); % Assuming your data is stored in variables 'ax' and 'ay'

% Example data (replace with your actual data)
ax = [0.1, 0.2, 0.15, 0.1, 0.2];
ay = [9.7, 9.8, 9.9, 9.8, 9.85];

% Calculate bias for ax and ay
bias_ax = mean(ax);
bias_ay = mean(ay);

% Known reference value (gravity)
reference_value = 9.81;

% Calculate scale factor for ax and ay
scale_factor_ax = reference_value / bias_ax;
scale_factor_ay = reference_value / bias_ay;

% Calibrate the raw data for ax and ay
calibrated_ax = (ax - bias_ax) * scale_factor_ax;
calibrated_ay = (ay - bias_ay) * scale_factor_ay;

% Display calibrated data
disp('Calibrated Data for ax:');
disp(calibrated_ax);

disp('Calibrated Data for ay:');
disp(calibrated_ay);

% Display scale factors and biases
disp(['Scale Factor for ax: ', num2str(scale_factor_ax)]);
disp(['Scale Factor for ay: ', num2str(scale_factor_ay)]);
disp(['Bias for ax: ', num2str(bias_ax)]);
disp(['Bias for ay: ', num2str(bias_ay)]);