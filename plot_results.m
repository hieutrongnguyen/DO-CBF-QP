
t_saved = 0:Ts:Tsim; t_saved = t_saved';
m = 1650; g = 9.81;

umin = -0.3; umax = 0.3;
vd = 24;

%% Plot control signals
figure;

if case_num == 3
    p1 = plot(t_saved, out_nominal.u/(m*g), ...
        t_saved, out_L1.u/(m*g), ...
        t_saved, out_DO.u/(m*g), ...
        t_saved, umax*ones(size(t_saved)), ...
        t_saved, umin*ones(size(t_saved)));
    p1(1).LineWidth = 2; p1(1).LineStyle = ':'; p1(1).Color = "#FF00FF";  % Nominal CBF 77AC30
    p1(2).LineWidth = 2;  p1(2).Color = "#0072BD"; % L1 CBF
    p1(3).LineWidth = 2; p1(3).Color = "#FF0000"; % DO CBF
    p1(4).LineWidth = 1; p1(4).LineStyle = '--'; p1(4).Color = "#7E2F8E";
    p1(5).LineWidth = 1; p1(5).LineStyle = '--'; p1(5).Color = "#EDB120";
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
    ylabel('Control input u (N)', 'fontweight', 'bold', 'fontsize', 15);
    legend('Nominal CBF', 'L1 CBF', 'Proposed DO CBF', 'Location', 'northeast');

    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
    ylim([1.1*umin 1.1*umax])

    hold on
    rectangle('Position',[3.2 -0.29 3.0 0.27])
    x = [1.3*6.1/20 1.1*8.1/20];
    y = [1.1*0.3/0.7 1.1*0.37/0.7];
    annotation('textarrow', x, y);
    legend('off')

    axes('Position', [.45 .65 .35 .2])
    box on
    p4 = plot(t_saved, out_L1.u/(m*g), ...
        t_saved, out_DO.u/(m*g));
    p4(1).LineWidth = 2; p4(1).Color = "#0072BD";
    p4(2).LineWidth = 2; p4(2).Color = "#FF0000";
    % grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
    xlim([3.4 6])
    ylim([-0.3 -0.05])

else
    p1 = plot(t_saved, out_nominal.u/(m*g), ...
        t_saved, out_L1.u/(m*g), ...
        t_saved, out_DO.u/(m*g));
    p1(1).LineWidth = 2; p1(1).LineStyle = ':'; p1(1).Color = "#FF00FF";  % Nominal CBF 77AC30
    p1(2).LineWidth = 2;  p1(2).Color = "#0072BD"; % L1 CBF
    p1(3).LineWidth = 2; p1(3).Color = "#FF0000"; % DO CBF
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 17);
    ylabel('Control input u (N)', 'fontweight', 'bold', 'fontsize', 17);
    legend('Nominal CBF', 'L1 CBF', 'Proposed DO CBF', 'Location', 'northeast', ...
           'FontSize', 15);

    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
end

%% Plot velocities
figure;

if case_num == 3
    p2 = plot(t_saved, vd*ones(size(t_saved)), ...
              t_saved, out_nominal.x2, ...
              t_saved, out_L1.x2, ...
              t_saved, out_DO.x2);
    p2(1).LineWidth = 1; p2(1).LineStyle = '--'; p2(1).Color = 	"#000000";
    p2(2).LineWidth = 2; p2(2).LineStyle = ':'; p2(2).Color = "#FF00FF";  % Nominal CBF 77AC30
    p2(3).LineWidth = 2; p2(3).Color = "#0072BD"; % L1 CBF
    p2(4).LineWidth = 2; p2(4).Color = "#FF0000"; % DO CBF 
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
    ylabel('Velocity (m/s)', 'fontweight', 'bold', 'fontsize', 15);
    legend('Command velocity', 'Nominal CBF', 'L1 CBF', 'Proposed DO CBF', ...
        'Location', 'southwest', 'AutoUpdate', 'off', 'FontSize', 15);
    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
    ylim([7 27])
    
else
    p2 = plot(t_saved, vd*ones(size(t_saved)), ...
              t_saved, out_nominal.x2, ...
              t_saved, out_L1.x2, ...
              t_saved, out_DO.x2);
    p2(1).LineWidth = 1; p2(1).LineStyle = '--'; p2(1).Color = 	"#000000";
    p2(2).LineWidth = 2; p2(2).LineStyle = ':'; p2(2).Color = "#FF00FF";  % Nominal CBF 77AC30
    p2(3).LineWidth = 2; p2(3).Color = "#0072BD"; % L1 CBF
    p2(4).LineWidth = 2; p2(4).Color = "#FF0000"; % DO CBF 
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 17);
    ylabel('Velocity (m/s)', 'fontweight', 'bold', 'fontsize', 17);
    legend('Command velocity', 'Nominal CBF', 'L1 CBF', 'Proposed DO CBF',  ...
        'Location', 'southwest', 'AutoUpdate', 'off', 'FontSize', 15);
    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
    ylim([7 27])
end

%% Plot CBF functions
figure;

if case_num == 3
    p3 = plot(t_saved, out_nominal.h, ...
              t_saved, out_L1.h, ...
              t_saved, out_DO.h, ...
              t_saved, zeros(size(t_saved)));
    p3(1).LineWidth = 2; p3(1).LineStyle = ':'; p3(1).Color = "#FF00FF";  % Nominal CBF 77AC30
    p3(2).LineWidth = 2; p3(2).Color = "#0072BD"; % L1 CBF
    p3(3).LineWidth = 2; p3(3).Color = "#FF0000"; % DO CBF 
    p3(4).LineWidth = 1; p3(4).LineStyle = '--'; p3(4).Color = 	"#000000";
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 15);
    ylabel('D - \tau v (m)', 'fontweight', 'bold', 'fontsize', 15);
    legend('Nominal CBF', 'L1 CBF', 'Proposed DO CBF', ...
           'AutoUpdate','off', 'FontSize', 13);
    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
   
else
    p3 = plot(t_saved, out_nominal.h, ...
              t_saved, out_L1.h, ...
              t_saved, out_DO.h, ...
              t_saved, zeros(size(t_saved)));
    p3(1).LineWidth = 2; p3(1).LineStyle = ':'; p3(1).Color = "#FF00FF";  % Nominal CBF 77AC30
    p3(2).LineWidth = 2; p3(2).Color = "#0072BD"; % L1 CBF
    p3(3).LineWidth = 2; p3(3).Color = "#FF0000"; % DO CBF 
    p3(4).LineWidth = 1; p3(4).LineStyle = '--'; p3(4).Color = 	"#000000";
    xlabel('Time (sec)', 'fontweight', 'bold', 'fontsize', 17);
    ylabel('D - \tau v (m)', 'fontweight', 'bold', 'fontsize', 17);
    grid on
    ax = gca;
    ax.FontWeight = 'bold';
    ax.LineWidth = 1.3;
    
    if case_num == 1
        hold on
        rectangle('Position',[5 -3 15 6])
        % quiver(8, 5, 1, 27, 'LineWidth', 3, 'Color', "#000000")
        x = [7.5/20 9.5/20];
        y = [1.2*22/90 1.2*42/90];
        annotation('textarrow', x, y);
        
        axes('Position',[.5 .6 .37 .3])
        box on
        p4 = plot(t_saved, out_nominal.h, ...
                  t_saved, out_L1.h, ...
                  t_saved, out_DO.h, ...
                  t_saved, zeros(size(t_saved)));
        p4(1).LineWidth = 2; p4(1).LineStyle = ':'; p4(1).Color = "#FF00FF";  % Nominal CBF 
        p4(2).LineWidth = 2; p4(2).Color = "#0072BD"; % L1 CBF
        p4(3).LineWidth = 2; p4(3).Color = "#FF0000"; % DO CBF 
        p4(4).LineWidth = 1; p4(4).LineStyle = '--'; p4(4).Color = 	"#000000";
        % grid on
        ax = gca;
        ax.FontWeight = 'bold';
        ax.LineWidth = 1.3;
        xlim([5 20])
        ylim([-0.1 0.1])
    else
        hold on
        rectangle('Position',[5 -3 15 6])
        % quiver(8, 5, 1, 27, 'LineWidth', 3, 'Color', "#000000")
        x = [7.5/20 9.5/20];
        y = [1.2*26/90 1.2*42/90];
        annotation('textarrow', x, y);
        
        axes('Position',[.5 .6 .37 .3])
        box on
        p4 = plot(t_saved, out_nominal.h, ...
                  t_saved, out_L1.h, ...
                  t_saved, out_DO.h, ...
                  t_saved, zeros(size(t_saved)));
        p4(1).LineWidth = 2; p4(1).LineStyle = ':'; p4(1).Color = "#FF00FF";  % Nominal CBF 77AC30
        p4(2).LineWidth = 2; p4(2).Color = "#0072BD"; % L1 CBF
        p4(3).LineWidth = 2; p4(3).Color = "#FF0000"; % DO CBF 
        p4(4).LineWidth = 1; p4(4).LineStyle = '--'; p4(4).Color = 	"#000000";
        % grid on
        ax = gca;
        ax.FontWeight = 'bold';
        ax.LineWidth = 1.3;
        xlim([5 20])
        ylim([-0.5 0.5])
    end
end

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

%% Print simulation time
fprintf("Simulation time of nominal CBF: %.4f seconds\n", elapsedTime_nominal);
fprintf("Simulation time of L1: %.4f seconds\n", elapsedTime_L1);
fprintf("Simulation time of DO: %.4f seconds\n", elapsedTime_DO);

