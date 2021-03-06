clearvars
close all
Foldersave = 'D:\Modeling OCR2\Results\';
FoldersaveParam = [Foldersave,'Parameters\'];
mkdir(Foldersave)
mkdir(FoldersaveParam)
FolderSavehere = [Foldersave,'Trajectories\'];
mkdir(FolderSavehere)

%% Parameters Diffusion Coefficient
% Diffusion coefficient obtained using our MSD approach
% Data from Figure 4
Data_diffusion = [0.037045937	0.013191873
0.419430175	0.010722955
0.575814689	0.02268454
0.73711412	0.02654676
1.090046291	0.029374105
1.263147258	0.031801202
1.398938092	0.031493794
1.600700053	0.031577592
1.723068678	0.032157184
1.86647587	0.030429687
1.965952752	0.031183401
2.085869397	0.032415762
2.215174251	0.033206956
2.340550101	0.032430813
2.488690046	0.03219443
2.626580063	0.031354276
2.740631203	0.030239602
2.80722908	0.02943743
2.857117239	0.029277779
2.914981263	0.028816757
2.967891712	0.027928119
3.031186788	0.026573214
3.103484132	0.02649542
3.21438568	0.025975025
3.373644145	0.026414955
3.466272487	0.02570276
3.579820164	0.024345746
3.742853263	0.025480157
3.95440987	0.027352746
4.256167642	0.027353323
4.353123847	0.026441441
4.47903735	0.026294839
4.60671529	0.027085665
4.730310167	0.027013186
4.907061447	0.027502199
5.048030896	0.028259405
5.191061698	0.029056116
5.328913992	0.029149123
5.434098776	0.027805085
5.537902507	0.028125902
5.638965967	0.029352081
5.840657729	0.029671995
5.997927666	0.029766466
6.082537588	0.029184833
6.158873117	0.030581143
6.201055035	0.032295081
6.243941454	0.032837543
6.280309178	0.031389629
6.305331889	0.03092591
6.331867548	0.031389021
6.356305278	0.031324066
6.380017995	0.030769064
6.418373633	0.030312831
6.456390547	0.029905318
6.498409508	0.029168194
6.541898689	0.028633287
6.580507535	0.027936237
6.604954474	0.028622699
6.635120365	0.029285218
6.662155028	0.028028661
6.700531425	0.028796382
6.751715044	0.028462834
6.787049903	0.02859968
6.816943604	0.026506232
6.848795304	0.025278974
6.882391402	0.026033835
6.921193085	0.026269567
6.966772533	0.026839755
7.01048329	0.027159025
7.08969169	0.027583103
7.147520457	0.029380713
7.242484037	0.033096152
8	0.033096152
];
%% OPTION 1: increase of D by a factor 'factorDCincrease' for all the positions
% Let it at 1 for no increase - by default
factorDCincrease = 1;
%% OPTION 2: increase of D only in PCMC
% Let it at 1 for no increase - by default
% DC is increased in the X and Y directions
factorDCincrease_PCMC = 1;
%% OPTION 3: Diffusion Coefficient equals to 0
% Let it at 1 by default
% [1]: D not equal to 0
% [0]: D equal to 0
nulDiffusionCoefficient = 1;
%%
Data_diffusion(:,2) = smooth(Data_diffusion(:,2),'sgolay',3).*factorDCincrease*nulDiffusionCoefficient;
figure(1)
plot(Data_diffusion(:,1),Data_diffusion(:,2),'-k','linewidth',1.5)
xlabel('Position \mum')
ylabel('Diffusion coefficient \mum^2/s')
set(gca,'fontsize',14)
saveas(1,[FoldersaveParam,'Diffusion_coefficient.png'])
saveas(1,[FoldersaveParam,'Diffusion_coefficient.fig'])
%% Parameters Velocity
% Anterograde velocities obtained using our MSD approach
% Data from Figure 4
Data_antero_velocity = [-0.230327135	0.295993014
-0.137612711	0.574800883
-0.062286544	0.459416105
0.003739293	0.386214514
0.042074896	0.692667939
0.117433117	0.472953041
0.173498915	0.503815374
0.208230599	0.416691163
0.242525872	0.415029311
0.280230562	0.391121607
0.317004901	0.506200246
0.350371294	0.380540562
0.385964781	0.332328501
0.434152449	0.395334796
0.464751918	0.531383773
0.521091527	0.358102238
0.566342204	0.616055795
0.605465881	0.463621366
0.658366745	0.53125868
0.714349853	0.587335339
0.801611055	0.325606718
0.885605982	0.476550398
1.072493344	0.526406767
1.355261521	0.436776267
1.481524415	0.496866354
1.607113071	0.431981538
1.67835553	0.262919219
1.77117028	0.575200337
1.901408575	0.555012888
2.026891846	0.629675755
2.159041309	0.699427968
2.26701686	0.475574699
2.324000664	0.483158554
2.405139137	0.318760842
2.4752777	0.48554487
2.584175774	0.659500569
2.681642712	0.450917847
2.76460591	0.646828008
2.854117999	0.634020924
2.946658823	0.713883537
3.051480523	1.014455276
3.191727331	0.549620936
3.296356693	1.008853197
3.445951486	1.070701756
3.552086038	0.780921164
3.633894829	1.303113784
3.74554893	0.84656838
3.849188749	0.94679771
3.945601986	1.05236606
4.065890965	0.831789354
4.190410508	1.285915224
4.312272887	1.157675457
4.408555368	0.784196516
4.499210247	0.985017036
4.576939302	1.289677454
4.672466648	1.014010665
4.777098244	1.185484628
4.87090457	1.009764212
4.994159243	1.004498417
5.104385327	0.649589383
5.221633103	1.096170057
5.322168579	1.001225097
5.461811571	1.061784023
5.623338713	1.831374045
5.855468096	1.416061538
6.058272935	1.392281113
6.247363486	1.388057098
6.437399152	1.109616778
6.628498789	1.20432411
6.855885358	0.928911829
7 0.928911829
8 0.928911829
];

% Retrograde velocities obtained using our MSD approach
% Data from Figure 4
Data_velocity_retro = [-0.258255356	-0.464316776
-0.165472558	-0.390762535
-0.115824313	-0.571452422
-0.073616682	-0.507594226
-0.019804851	-0.58474266
0.01001477	-0.414427932
0.05840246	-0.680467451
0.103983953	-0.729673814
0.151911695	-0.557920488
0.189830396	-0.726453479
0.22519325	-0.721619876
0.261930506	-0.583736072
0.299460561	-0.516964654
0.333875535	-0.579746339
0.360453125	-0.484137991
0.393414555	-0.506596215
0.422310705	-0.460965992
0.455995001	-0.438498252
0.478512802	-0.479781215
0.497957655	-0.395528553
0.53522174	-0.525714812
0.582229997	-0.623994825
0.613832116	-0.435486483
0.646349696	-0.624546087
0.699475952	-0.863682553
0.757076477	-0.638846853
0.840731023	-0.716024518
0.982686641	-1.397998847
1.396998601	-0.562215302
1.775416806	-0.83805772
2.008278243	-0.499077019
2.691502212	-0.886681455
3.134698037	-0.403065127
3.482878004	-0.904461427
4.118850217	-0.528752708
4.535779595	-0.722274486
4.822003056	-0.617288976
5.051406899	-0.782612222
5.442152048	-0.694589
6.480789594	-0.814477079
6.856830447	-0.594374141
7 -0.594374141
8.1 -0.594374141
];

Data_antero_velocity(:,2) = smooth(Data_antero_velocity(:,2),'sgolay',3);
Data_velocity_retro(:,2) = smooth(Data_velocity_retro(:,2),'sgolay',3);

figure(2)
hold off
plot(Data_antero_velocity(:,1),Data_antero_velocity(:,2),'-k','linewidth',1.5)
hold on
plot(Data_velocity_retro(:,1),Data_velocity_retro(:,2),'-b','linewidth',1.5)
xlabel('Position \mum')
ylabel('velocity \mum/s')
legend('A','R')
set(gca,'fontsize',14)
saveas(2,[FoldersaveParam,'Velocities.png'])
saveas(2,[FoldersaveParam,'Velocities.fig'])

%% Cilium segments and IFT/Diffusion Ratio
% the in-silico cilium is divided in 6 segments as followed:
% dendrite: -10 um < X <= -0.8 um
% base: -0.8 um < X <= -0.01 um
% TZ: -0.01 um < X <= 0.8 um
% Proximal segment: 0.8 um < X <= 3.5 um
% Distal segment: 3.5 um < X <= 6.5 um
% Tip: 6.5 um < X
%% Standard OPTION
% For IFT + Diffusion (Figure 5B)
% Ratio IFT/Diffusion
dendrire_percentage = 1;
PCMC_percentage = 0;
TZ_percentage = 1;
PS_percentage = 0.05;
DS_percentage = 0.15;
Tip_percentage = 0;
%% OPTION 
% % For Diffusion only (Figure 5B)
% % Ratio IFT/Diffusion
% dendrire_percentage = 0;
% PCMC_percentage = 0;
% TZ_percentage = 0;
% PS_percentage = 0;
% DS_percentage = 0;
% Tip_percentage = 0;
%% OPTION
% % For no Diffusion except in PCMC (Figure S5C left)
% % Ratio IFT/Diffusion
% dendrire_percentage = 1;
% PCMC_percentage = 0;
% TZ_percentage = 1;
% PS_percentage = 1;
% DS_percentage = 1;
% Tip_percentage = 1;
%% Ratio IFT/Diffusion
% Positions
Pos_percentage = [[-10:0.01:-0.79]';[-0.8:0.01:-0.01]';[0:0.01:0.8]';[0.81:0.01:3.5]';[3.51:0.01:6.5]';[6.6:0.01:8]'];
% Values
Percentage_transport_antero = [dendrire_percentage.*ones(size([-10:0.01:-0.79],2),1);PCMC_percentage.*ones(size([-0.8:0.01:-0.01],2),1);TZ_percentage*ones(size([0:0.01:0.8],2),1);PS_percentage*ones(size([0.81:0.01:3.5],2),1);DS_percentage*ones(size([3.51:0.01:6.5],2),1);Tip_percentage*ones(size([6.6:0.01:8],2),1)];

Data_percentage_transp_antero = [Pos_percentage Percentage_transport_antero];

% Apply the same values in the retrograde direction
Data_percentage_transp_retro = Data_percentage_transp_antero;

%% OPTION Conservation of the number of molecules
% [1] = Inject a new molecule when one molecule goes outside the dendrite (X < -2 um)
% [0] = NOT inject a new molecule
Inject_molecule_ON = 1;

%% Parameters for the simulation
% Maximal size of the in-silico cilium
lim_cilia = 7.5;
% Ratio between anterograde and retrograde IFT train frequencies
proba_antero = 1/3;
% Time between 2 consecutives data points
dt = 0.1;
% Radius of the in-silico cilium
Radius = 0.1;
% Size of the sliding window ( MSD) used to analyse experimental data 
WW =15;
% Maximal number of steps
Nstep = 5000;
% Number of trajectories per position
maxtraj = 50;
% Precision of localization
Precision_localization = 30/1000;

%% Initialization of variables
Xtot = [];
Ytot = [];
Xtot2 = [];
Ytot2 = [];
Diff_on = [1 0];
in = 1;

%% Generating the trajectories

% Initial position of the molecules 
for x0 = 1:1:lim_cilia
    
    [x0 lim_cilia]

    for ik = 1:maxtraj
        % Initial X Position of the molecules from 0 um to 6 um (lim_cilia = 7.5 um)
        X = [x0-1];
        % Initial Y Position of the molecules
        Y = [0];
        % Initial mode of transport - 
        % [1 or -1] = anterograde or retrogarde directed, [0] = diffusive 
        State_true = [1];
        % Arbitrary value of the velocity for the first point
        Parameter_GT = [0];

        it = 1;
        Time =[it];       
        Diff_onstat=[0];
        i = 1;
        stop_traj = 1;
        
        for i =1:Nstep
            if stop_traj ==1
                if it<=Nstep-1
                    [it Nstep]
                    % Calculate the last X coordinate
                    CUMX = cumsum(X);
                    % If the molecule is at the base
                    if CUMX(end)<0 & CUMX(end)>-0.8

                        it = it+1;
                        % Diffusion coefficient in the X direction (first experimental value)
                        diffusion_coefficient = Data_diffusion(1,2)*factorDCincrease_PCMC;
                        % Diffusion coefficient in the Y direction
                        diffusion_coefficienty = diffusion_coefficient/3/factorDCincrease*factorDCincrease_PCMC;

                        % step size - Gaussian distribution
                        x = (randn(1,1).*sqrt(2.*diffusion_coefficient.*dt));
                        y = randn(1,1).*sqrt(2.*diffusion_coefficienty.*dt);

                        % GT
                        State_true = [State_true;0]; % diffusive transport
                        Parameter_GT = [Parameter_GT;diffusion_coefficient];

                        % calculate last position Y
                        if isempty(Y)==0
                            CUM = cumsum(Y);
                        else
                            CUM = y;
                        end

                        % Boundaries condition in the Y direction (cylinder)
                        % Store Y
                        if abs((CUM(end))+y)> Radius & abs((CUM(end))-y)< Radius
                            Y = [Y;-y];
                        elseif abs((CUM(end))+y)> Radius & abs((CUM(end))-y)> Radius
                            Y = [Y;-y/2];
                        else
                            Y = [Y;y];
                        end
                        % Store X and Time variables
                        X = [X;x];
                        Time = [Time;it];

                    elseif CUMX(end)<=-0.8
                    % If the molecule is in the dendrite 

                        if CUMX(end)<=-2
                            % If the molecule is in the dendrite and goes outside the
                            % in silico-cilium
                            %% OPTION
                            % == Inject ot not a new molecule (Conservation of # molecules)
                            stop_traj = Inject_molecule_ON;                         
                           %%
                            if stop_traj == 0
                            else
                                for ih = 1:round(1.2/dt)
                                    it = it+1;

                                    % anterograde directed transport in X direction
                                    velocity_dendrite = 1.5;
                                    x = velocity_dendrite*dt;
                                    State_true = [State_true;1];
                                    Parameter_GT = [Parameter_GT;velocity_dendrite];


                                    % Diffusion in Y direction
                                    diffusion_coefficienty = diffusion_coefficient/3/factorDCincrease;
                                    y = randn(1,1).*sqrt(2.*diffusion_coefficienty.*dt);

                                    % Last Y coordinate
                                    if isempty(Y)==0
                                        CUM = cumsum(Y);
                                    else
                                        CUM = y;
                                    end

                                    % Boundaries condition (Y direction)
                                    % Store Y
                                    if abs((CUM(end))+y)> Radius & abs((CUM(end))-y)< Radius
                                        Y = [Y;-y];
                                    elseif abs((CUM(end))+y)> Radius & abs((CUM(end))-y)> Radius
                                        Y = [Y;-y/2];
                                    else
                                        Y = [Y;y];
                                    end

                                    % Store X and Time
                                    X = [X;x];
                                    Time = [Time;it];
                                end
                            end
                        else                    
                            stop_traj = 1;
                            % If the molecule is in the dendrite but not at the
                            % minimal position limite (-2 um)
                            % Retrograde transport in the X direction
                            velocity_dendrite = 1.5;
                            x = -velocity_dendrite*dt;

                            State_true = [State_true;-1];
                            Parameter_GT = [Parameter_GT;-velocity_dendrite];
                            % Diffusion in the Y direction
                            diffusion_coefficienty = diffusion_coefficient/3/factorDCincrease;
                            y = randn(1,1).*sqrt(2.*diffusion_coefficienty.*dt);

                            if isempty(Y)==0
                                CUM = cumsum(Y);
                            else
                                CUM = y;
                            end
                            % Boundaries condition in the Y direction
                            % Store Y
                            if abs((CUM(end))+y)> Radius & abs((CUM(end))-y)< Radius
                                Y = [Y;-y];
                            elseif abs((CUM(end))+y)> Radius & abs((CUM(end))-y)> Radius
                                Y = [Y;-y/2];
                            else
                                Y = [Y;y];
                            end

                            % Store X and Time
                            X = [X;x];
                            Time = [Time;it];
                        end

                    elseif CUMX(end)>=lim_cilia
                       % If the molecule is at the tip of the cilium

                        it = it+1;

                        % Last experimental Diffusion coefficient
                        diffusion_coefficient = Data_diffusion(end,2);
                        diffusion_coefficienty = diffusion_coefficient/3/factorDCincrease;
                        y = randn(1,1).*sqrt(2.*diffusion_coefficienty.*dt);

                        % Boundarie condition (X direction) at the tip / force negative step
                        x = -abs(randn(1,1).*sqrt(2.*diffusion_coefficient.*dt));

                        State_true = [State_true;0];
                        Parameter_GT = [Parameter_GT;diffusion_coefficient];

                        if isempty(Y)==0
                            CUM = cumsum(Y);
                        else
                            CUM = y;
                        end
                        % Boundaries condition in Y direction
                        % Store Y
                        if abs((CUM(end))+y)> Radius & abs((CUM(end))-y)< Radius
                            Y = [Y;-y];
                        elseif abs((CUM(end))+y)> Radius & abs((CUM(end))-y)> Radius
                            Y = [Y;-y/2];
                        else
                            Y = [Y;y];
                        end
                        % Store X and Time
                        X = [X;x];
                        Time = [Time;it];

                    else
                    % If the molecule is in the cilium

                        % Set the direction of the directed transport if
                        % directed - Gives [1] for anterograde and [0] for
                        % retrograde
                        retro_antero_proba = randsrc(1,1,[1,0;proba_antero,1-proba_antero]);

                        % Apply the locatin dependent ratio IFT/Diffusion
                        % Gives [1] for diffusive transport and [0] for directed transport                
                        Diff_on = [Diff_on;Time(end)+1 randsrc(1,1,[1,0;1-mean(Data_percentage_transp_antero(CUMX(end)>=Pos_percentage(:,1)-0.05 & CUMX(end)<=Pos_percentage(:,1)+0.05,2)),mean(Data_percentage_transp_antero(CUMX(end)>=Pos_percentage(:,1)-0.05 & CUMX(end)<=Pos_percentage(:,1)+0.05,2))])];

                        % Apply the type of transport in the window width
                        for ialpha = 1:WW
                            % Last value of the X coordinate
                            CUMX = cumsum(X);
                            % Implement step in time
                            it = it+1;

                            % Calculate location-dependant parameters
                            % Anterograde velocity
                            v_antero = mean(Data_antero_velocity(CUMX(end)>=Data_antero_velocity(:,1)-1 & CUMX(end)<=Data_antero_velocity(:,1)+1,2));
                            % Retrograde velocity
                            v_retro = mean(Data_velocity_retro(CUMX(end)>=Data_velocity_retro(:,1)-1 & CUMX(end)<=Data_velocity_retro(:,1)+1,2));    
                            % Diffusion coefficient
                            diffusion_coefficient = mean(Data_diffusion(CUMX(end)>=Data_diffusion(:,1)-1 & CUMX(end)<=Data_diffusion(:,1)+1,2));

                            % Parameter in the X direction
                            if Diff_on(end,2) == 1
                                % Diffusion [1]
                                if CUMX(end)>lim_cilia
                                    % The molecule reachs the tip / force
                                    % negative step
                                    x = -abs(randn(1,1).*sqrt(2.*diffusion_coefficient.*dt));
                                else
                                    % Molecule stays inside the cilium
                                    x = (randn(1,1).*sqrt(2.*diffusion_coefficient.*dt));
                                end

                                % Store Ground Truth
                                State_true = [State_true;0];
                                Parameter_GT = [Parameter_GT;diffusion_coefficient];                             
                                Diff_onstat = [Diff_onstat;Diff_on(end,2)];

                            elseif retro_antero_proba == 1 & Diff_on(end,2) == 0
                                % If Anterograde Directed transport

                                if CUMX(end)<lim_cilia
                                    % Molecule not reach the tip
                                    x = v_antero.*dt;

                                    State_true = [State_true;1];
                                    Parameter_GT = [Parameter_GT;v_antero];
                                else
                                    % Molecule reach the tip / force negative step
                                    % and force diffusion
                                    x = -abs(randn(1,1).*sqrt(2.*diffusion_coefficient.*dt));

                                    State_true = [State_true;0];
                                    Parameter_GT = [Parameter_GT;diffusion_coefficient];
                                end

                                Diff_onstat = [Diff_onstat;Diff_on(end,2)];
                            elseif retro_antero_proba == 0 & Diff_on(end,2) == 0
                                % If Retrograde Directed transport

                                if CUMX(end)>0
                                    % Molecule not reach the base
                                    x = v_retro.*dt;
                                    State_true = [State_true;-1];
                                    Parameter_GT = [Parameter_GT;v_retro];
                                else
                                    % Molecule reachs the base / force diffusion
                                    x = (randn(1,1).*sqrt(2.*diffusion_coefficient.*dt));
                                    State_true = [State_true;0];
                                    Parameter_GT = [Parameter_GT;diffusion_coefficient];
                                end

                            Diff_onstat = [Diff_onstat;Diff_on(end,2)];
                            end

                            % Parameter in the Y direction
                            diffusion_coefficienty = diffusion_coefficient/3/factorDCincrease;
                            y = randn(1,1).*sqrt(2.*diffusion_coefficienty.*dt);

                            if isempty(Y)==0
                                CUM = cumsum(Y);
                            else
                                CUM = y;
                            end
                            % Boundaries condition Y direction
                            if abs((CUM(end))+y)> Radius & abs((CUM(end))-y)< Radius
                                Y = [Y;-y];
                            elseif abs((CUM(end))+y)> Radius & abs((CUM(end))-y)> Radius
                                Y = [Y;-y/2];
                            else
                                Y = [Y;y];
                            end

                            X = [X;x];
                            Time = [Time;it];
                        end



                    end
                else
                end
            else
            end
        end
        in = in+1;
        
        % At the end of the generated trajectory, add the Noise / Precision
        % of localization (PL)
        
        % Convert Time in seconds
        Timedt = Time.*dt;
        % Calculate the X coordinate
        PositionX = cumsum(X);
        % Add the PL - Gaussian distribution
        Noise = Precision_localization.*randn(size(PositionX,1),1);
        PositionX = PositionX+Noise;
        
        % Plot the trajectory X = f(Time)
        % And overlap the Ground Truth (Directed (red) or diffusive (blue) transport)
        figure(1)
        hold off
        plot(Timedt,PositionX','o-k','linewidth',2)
        hold on
        plot(Timedt(State_true==1),PositionX(State_true==1)','or','linewidth',2)
        plot(Timedt(State_true==-1),PositionX(State_true==-1)','or','linewidth',2)
        plot(Timedt,State_true,'ob','linewidth',2)
        xlabel('Time')
        ylabel('Position')
        set(gca,'fontsize',16)
        ylim([-1.5 8])
        saveas(1,[FolderSavehere,'Nstep ' num2str(in,'%.f'),'__Trajectory_kymopar.png'])
        saveas(1,[FolderSavehere,'Nstep ' num2str(in,'%.f'),'__Trajectory_kymopar.fig'])
        % Calculate the Y coordinates
        PositionY = cumsum(Y);
        % And add the PL
        NoiseY = Precision_localization.*randn(size(PositionY,1),1);
        PositionY =PositionY+NoiseY;
        
        % Plot X - Y trajectory / red when direct transport
        figure(3)
        hold off
        plot(PositionX,PositionY,'o-k','linewidth',2)
        hold on
        plot(PositionX(State_true==1),PositionY(State_true==1)','or','linewidth',2)
        plot(PositionX(State_true==-1),PositionY(State_true==-1)','or','linewidth',2)
        xlabel('X')
        ylabel('Y')
        set(gca,'fontsize',16)
        axis equal
        saveas(3,[FolderSavehere,'Nstep ' num2str(in,'%.f'),'__Trajectory_XY.png'])
        saveas(3,[FolderSavehere,'Nstep ' num2str(in,'%.f'),'__Trajectory_XY.fig'])
        %%
        % Save trajectory in .mat file
        save([FolderSavehere,'_' num2str(in,'%.f'),'.mat'])
        % Store X and Y coordinates with ground truth
        Xtot = [Xtot;Time PositionX State_true Parameter_GT];
        Ytot = [Ytot;Time PositionY];
    end
end

%%
% Segments of the different part in the cilium
TZpos = [0:0.1:1]; % Transition Zone
PSpos = [1.1:0.1:3.5]; % Proximal Segment
DSpos = [3.6:0.1:6.5]; % Distal Segment
Tippos = [6.6:0.1:9]; % Tip



%%
% Calculate ratio IFT/Diffusion location dependent using simulated
% trajectories
TZ_lim = 0.8;
PS_lim = 3.5;
DS_lim = 6.5;
Proba_trans_TZ = size(Xtot(abs(Xtot(:,3))>0.1 & Xtot(:,2)<=TZ_lim  & Xtot(:,2)>0,2),1)./size(Xtot(Xtot(:,2)<=TZ_lim  & Xtot(:,2)>0,1),1)
Proba_trans_PS = size(Xtot(abs(Xtot(:,3))>0.1 & Xtot(:,2)<=PS_lim  & Xtot(:,2)>TZ_lim,2),1)./size(Xtot(Xtot(:,2)<=PS_lim  & Xtot(:,2)>TZ_lim,2),1)
Proba_trans_DS = size(Xtot(abs(Xtot(:,3))>0.1 & Xtot(:,2)<=DS_lim  & Xtot(:,2)>PS_lim,2),1)./size(Xtot(Xtot(:,2)<=DS_lim  & Xtot(:,2)>PS_lim,2),1)
Proba_trans_tip = size(Xtot(abs(Xtot(:,3))>0.1 & Xtot(:,2)>DS_lim,2),1)./size(Xtot(Xtot(:,2)>DS_lim,2),1)


Ground_Truth_ratio = [1 0.05 0.15 0]
Experimental_Ratio = [0.7 0.05 0.14 0]
Simulated_ratio = [Proba_trans_TZ Proba_trans_PS Proba_trans_DS Proba_trans_tip]
%%
% Save all variables in a mat file
save([FolderSavehere,'Results.mat'])
