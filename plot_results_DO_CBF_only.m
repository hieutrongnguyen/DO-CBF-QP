
t_saved = 0:Ts:Tsim; t_saved = t_saved';
m = 1650; g = 9.81;

umin = -0.3; umax = 0.3;
vd = 24;

%% Plot control signals
figure;

if case_num == 3
    p1 = plot(t_saved, out_DO.u/(m*g), ...
        t_saved, umax*ones(size(t_saved)), ...
        t_saved, umin*ones(size(t_saved)));
    p1(1).LineWidth = 2; p1(1).Color = "#FF0000"; % DO CBF
    p1(2).LineWidth = 1; p1(2).LineStyle = '--'; p1(2).Color = "#7E2F8E";
    p1(3).LineWidth = 1; p1(3).LineStyle = '--'; p1(3).Color = "#EDB120";
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
    ylabel('Control input u (N)', 'fontweight', 'bold', 'fontsize', 15);
    legend('Proposed DO CBF', 'Location', 'northeast', ...
           'FontSize', 15);

    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
    
    ylim([1.1*umin 1.1*umax]);
    
else
    p1 = plot(t_saved, out_nominal.u/(m*g), ...
        t_saved, out_L1.u/(m*g), ...
        t_saved, out_DO.u/(m*g));
    p1(1).LineWidth = 2; p1(1).LineStyle = ':'; p1(1).Color = "#FF00FF";  % Nominal CBF 77AC30
    p1(2).LineWidth = 2;  p1(2).Color = "#0072BD"; % L1 CBF
    p1(3).LineWidth = 2; p1(3).Color = "#FF0000"; % DO CBF
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 17);
    ylabel('Control input u (N)', 'fontweight', 'bold', 'fontsize', 17);
    legend('Proposed DO CBF', 'Location', 'northeast', ...
           'FontSize', 15);

    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
end

%% Plot velocities
figure;

p2 = plot(t_saved, vd*ones(size(t_saved)), ...
    t_saved, out_DO.x2);
p2(1).LineWidth = 1; p2(2).LineStyle = '--'; p2(2).Color = 	"#000000";
p2(2).LineWidth = 2; p2(2).Color = "#FF0000"; % DO CBF
xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
ylabel('Velocity (m/s)', 'fontweight', 'bold', 'fontsize', 15);
legend('Command velocity', 'Proposed DO CBF', ...
    'Location', 'southwest', 'AutoUpdate', 'off', 'FontSize', 15);
grid on
ax = gca;
ax.FontWeight = 'bold';
ax.LineWidth = 1.3;
ylim([7 27])

%% Plot CBF functions
figure;

p3 = plot(t_saved, out_DO.h, ...
    t_saved, zeros(size(t_saved)));
p3(1).LineWidth = 2; p3(1).Color = "#FF0000"; % DO CBF
p3(2).LineWidth = 1; p3(2).LineStyle = '--'; p3(2).Color = 	"#000000";
xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
ylabel('D - \tau v (m)', 'fontweight', 'bold', 'fontsize', 15);
legend('Proposed DO CBF', ...
    'AutoUpdate','off', 'FontSize', 15);
grid on
ax = gca;
ax.FontWeight = 'bold';
ax.LineWidth = 1.3;

%% Plot decay variables
if case_num == 3
    figure;
    omega_column = reshape(out_DO.omega, [], 1);
    p5 = plot(t_saved, omega0+omega_column);
    p5(1).LineWidth = 2; p5(1).Color = "#FF0000";
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
    ylabel('$\omega (t)$', 'fontweight', 'bold', 'fontsize', 15, 'Interpreter','Latex');
    legend('Optimal - decay variable', 'FontSize', 13);
    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;

end


