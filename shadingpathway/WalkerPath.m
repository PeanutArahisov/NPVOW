classdef WalkerPath 
    properties(Constant=true, Access = private)
        %All paths are independent from the generateWalker output or alike.
        %Therefore, to set up a new path:
        % 1) record it here as a new class property
        % 2) add a condition to the parseKey function
        
        
        %mocap data files
        AC_arm_left = 'NPVOW\mocap\arm\larm.csv';
        AC_arm_left_movie = 'NPVOW\arm\';
        AC_arm_left_noiseless_orig = 'NPVOW\arm\_n-0_s-0-0_r-0-0-0_v-0-0';
        AC_arm_left_noiseless_skewed = 'NPVOW\arm\_n-0_s-0-0_r-0-0-0_v--45-0';
        
        %CoRepresentation Experiment 1 Stimuli
        CR1_C_female_0_la0 = 'NPVOW\CoRepActions\catching\';
        
        %diamond parts each separately on gray background, lit below and above              
        StNW1_d_h90 = 'NPVOW\walker\test\diamondparts\h90\';                    
        StNW1_d_h270 = 'NPVOW\walker\test\diamondparts\h270\';
        StNW1_d_lb90 = 'NPVOW\walker\test\diamondparts\lb90\';
        StNW1_d_lb270 = 'NPVOW\walker\test\diamondparts\lb270\';
        StNW1_d_lla90 = 'NPVOW\walker\test\diamondparts\lla90\';
        StNW1_d_lla270 = 'NPVOW\walker\test\diamondparts\lla270\';
        StNW1_d_lll90 = 'NPVOW\walker\test\diamondparts\lll90\';
        StNW1_d_lll270 = 'NPVOW\walker\test\diamondparts\lll270\';
        StNW1_d_lua90 = 'NPVOW\walker\test\diamondparts\lua90\';
        StNW1_d_lua270 = 'NPVOW\walker\test\diamondparts\lua270\';
        StNW1_d_lul90 = 'NPVOW\walker\test\diamondparts\lul90\';
        StNW1_d_lul270 = 'NPVOW\walker\test\diamondparts\lul270\';
        StNW1_d_rla90 = 'NPVOW\walker\test\diamondparts\rla90\';
        StNW1_d_rla270 = 'NPVOW\walker\test\diamondparts\rla270\';
        StNW1_d_rll90 = 'NPVOW\walker\test\diamondparts\rll90\';
        StNW1_d_rll270 = 'NPVOW\walker\test\diamondparts\rll270\';
        StNW1_d_rua90 = 'NPVOW\walker\test\diamondparts\rua90\';
        StNW1_d_rua270 = 'NPVOW\walker\test\diamondparts\rua270\';
        StNW1_d_rul90 = 'NPVOW\walker\test\diamondparts\rul90\';
        StNW1_d_rul270 = 'NPVOW\walker\test\diamondparts\rul270\';
        StNW1_d_ub90 = 'NPVOW\walker\test\diamondparts\ub90\';
        StNW1_d_ub270 = 'NPVOW\walker\test\diamondparts\ub270\';
        
        %walkers with diamond parts
        StNW1_d_90_168 = 'NPVOW\walker\test\POSSIBLESTNW1as0.5ss0.3ds0.4se10_t30av10o5pl30o10m0\towa_168\';  
        
        %walker generated by Nick  
        Nick_c_45_n = 'NPVOW\walker\external_walking\45\';
        Nick_c_315_n = 'NPVOW\walker\external_walking\315\';
        Nick_c_0_n_bw = 'NPVOW\walker\external_walking\0bw\';
        Nick_c_45_n_bw = 'NPVOW\walker\external_walking\45bw\';
        Nick_c_315_n_bw = 'NPVOW\walker\external_walking\315bw\';
        Nick_c_45_n_bw_running = 'NPVOW\walker\external_running\45bw\';
        Nick_c_315_n_bw_running = 'NPVOW\walker\external_running\315bw\';
        Nick_c_0_n_bw_running = 'NPVOW\walker\external_running\0bw\';

        
        %walkers with cylindrical parts
        StNW1_c_0_n = 'NPVOW\walker\test\newjoris\270\';
        StNW1_c_45_n = 'NPVOW\walker\test\newjoris\315\';
        StNW1_c_315_n = 'NPVOW\walker\test\newjoris\225\';
        StNW1_c_90_n = 'NPVOW\walker\test\newjoris\0\';
        StNW1_c_270_n = 'NPVOW\walker\test\newjoris\180\';        
        
        %black and white walkers with cylindrical parts
        StNW1_c_45_bw = 'NPVOW\walker\test\bwjoris\45\';
        StNW1_c_315_bw = 'NPVOW\walker\test\bwjoris\315\';
        
        %morphed paths
        Morph_StNW1_c_45_315_l05 = 'NPVOW\walker\test\pxlmorph\c_45_315_la0.5';
        Morph_StNW1_c_0_0_l05 = 'NPVOW\walker\test\pxlmorph\c_0_0_la0.5';
        Morph_StNW1_c_90_270_l05 = 'NPVOW\walker\test\pxlmorph\c_90_270_la0.5';
        
        %morph of the walker generated by Nick    
        Morph_Nick_c_45_315_l05 = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.5';
        Morph_Nick_c_45_315_l05_bw = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.5_bw';
        Morph_Nick_c_45_315_l025_bw = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.25_bw';
        Morph_Nick_c_45_315_l075_bw = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.75_bw';        
        Morph_Nick_c_45_315_l09_bw = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.9_bw';        
        Morph_Nick_c_45_315_l01_bw = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.1_bw';
        Morph_Nick_c_45_315_l05_g_6_b = 'NPVOW\walker\test\pxlmorph\nick_45_315_la0.5_g_6_b';
        
        %simulation keys
        Sim_c_45_315_n = 'NPVOW\walker\simres\c_45-315_n\';
        Sim_c_45_315_bw = 'NPVOW\walker\simres\c_45-315_bw\';
        Sim_c_45_315_n_bw = 'NPVOW\walker\simres\c_45-315_n_bw\';
        Sim_c_45_315_n_nick = 'NPVOW\walker\simres\c_45-315_n_nick\';
        Sim_c_45_315_n_nick_bw = 'NPVOW\walker\simres\c_45-315_n_nick_bw';
        Sim_c_45_315_0_n_nick_bw = 'NPVOW\walker\simres\c_45-315-0_n_nick_bw';
        Sim_arm_orsk = 'NPVOW\arm\simres\arm_original_skewed';
    end
    
    methods(Static, Access = public)
        %class users can call this method as WalkerPath.getPath(pathkey)
        %e.g. WalkerPath.getPath('st-d-t-168-m') will give a path to:
        %st: StNW1 walker
        %d: rendered with diamond parts
        %t: walking towards
        %168: lit at 168 angle with a vertical meridian
        %m: arbitrary meta if neccessary
        function dirpath = getPath (pathkey)
            path = WalkerPath.parseKey(pathkey);
            dirpath = fullfile(formCorePath, path);
        end
    end
    
    methods(Static, Access = private)
        function dirpath = parseKey (pathkey)
            %NOTE: simply returns the full path by easily-typed key 
            %(which is the whole point of this class).
            %but if I ever want more sophisticated key parsing, I would
            %only need to rewrite this method to parse it and nothing else 
            %(which is also another useful point of having this class).
            switch pathkey
                %Left Arm mocap data
                case 'leftarm-data'
                    dirpath = WalkerPath.AC_arm_left;
                case 'leftarm-movie'
                    dirpath = WalkerPath.AC_arm_left_movie;
                case 'leftarm-noiseless-orig'    
                    dirpath = WalkerPath.AC_arm_left_noiseless_orig;
                case 'leftarm-noiseless-skewed'
                    dirpath = WalkerPath.AC_arm_left_noiseless_skewed;                    
                    
                %%CoRepresentation Experiment 1 Stimuli
                case 'cr-c-0-la0.0'
                    dirpath = WalkerPath.CR1_C_female_0_la0;
                
                %diamond parts each separately on gray background, lit below and above
                case 'st-d-h90'
                    dirpath = WalkerPath.StNW1_d_h90;                    
                case 'st-d-h270'
                    dirpath = WalkerPath.StNW1_d_h270;
                case 'st-d-lb90'
                    dirpath = WalkerPath.StNW1_d_lb90;
                case 'st-d-lb270'
                    dirpath = WalkerPath.StNW1_d_lb270;
                case 'st-d-lla90'
                    dirpath = WalkerPath.StNW1_d_lla90;
                case 'st-d-lla270'
                    dirpath = WalkerPath.StNW1_d_lla270;
                case 'st-d-lll90'
                    dirpath = WalkerPath.StNW1_d_lll90;
                case 'st-d-lll270'
                    dirpath = WalkerPath.StNW1_d_lll270;
                case 'st-d-lua90'
                    dirpath = WalkerPath.StNW1_d_lua90;
                case 'st-d-lua270'
                    dirpath = WalkerPath.StNW1_d_lua270;
                case 'st-d-lul90'
                    dirpath = WalkerPath.StNW1_d_lul90;
                case 'st-d-lul270'
                    dirpath = WalkerPath.StNW1_d_lul270;
                case 'st-d-rla90'
                    dirpath = WalkerPath.StNW1_d_rla90;
                case 'st-d-rla270'
                    dirpath = WalkerPath.StNW1_d_rla270;
                case 'st-d-rll90'
                    dirpath = WalkerPath.StNW1_d_rll90;
                case 'st-d-rll270'
                    dirpath = WalkerPath.StNW1_d_rll270;
                case 'st-d-rua90'
                    dirpath = WalkerPath.StNW1_d_rua90;
                case 'st-d-rua270'
                    dirpath = WalkerPath.StNW1_d_rua270;
                case 'st-d-rul90'
                    dirpath = WalkerPath.StNW1_d_rul90;
                case 'st-d-rul270'
                    dirpath = WalkerPath.StNW1_d_rul270;
                case 'st-d-ub90'
                    dirpath = WalkerPath.StNW1_d_ub90;
                case 'st-d-ub270'
                    dirpath = WalkerPath.StNW1_d_ub270;
                             
                %walkers with diamond parts
                case 'st-d-90-168'
                    dirpath = WalkerPath.StNW1_d_90_168;
                    
                %walkers with cylindrical parts
                case 'st-c-0-n'
                    dirpath = WalkerPath.StNW1_c_0_n;
                case 'st-c-45-n'
                    dirpath = WalkerPath.StNW1_c_45_n;
                case 'st-c-315-n'
                    dirpath = WalkerPath.StNW1_c_315_n;
                case 'st-c-90-n'
                    dirpath = WalkerPath.StNW1_c_90_n;
                case 'st-c-270-n'
                    dirpath = WalkerPath.StNW1_c_270_n;     
                    
                %walkers generated by Nick   
                case 'n-c-45-n'
                    dirpath = WalkerPath.Nick_c_45_n;
                case 'n-c-315-n'
                    dirpath = WalkerPath.Nick_c_315_n;
                case 'n-c-0-n-bw'
                    dirpath = WalkerPath.Nick_c_0_n_bw;                    
                case 'n-c-45-n-bw'
                    dirpath = WalkerPath.Nick_c_45_n_bw;
                case 'n-c-315-n-bw'
                    dirpath = WalkerPath.Nick_c_315_n_bw;
                case 'n-c-0-n-bw-run'
                    dirpath = WalkerPath.Nick_c_0_n_bw_running;
                case 'n-c-45-n-bw-run'
                    dirpath = WalkerPath.Nick_c_45_n_bw_running;
                case 'n-c-315-n-bw-run'
                    dirpath = WalkerPath.Nick_c_315_n_bw_running;                    
                
                    
                    
                %black and white walkers with cylindrical parts
                case 'st-c-45-n-bw'
                    dirpath = WalkerPath.StNW1_c_45_bw;
                case 'st-c-315-n-bw'
                    dirpath = WalkerPath.StNW1_c_315_bw;
                    
                %pathkeys for the morphs
                case 'morph-c-45-315-n-la0.5'
                    dirpath = WalkerPath.Morph_StNW1_c_45_315_l05;
                case 'morph-c-0-0-n-la0.5'
                    dirpath = WalkerPath.Morph_StNW1_c_0_0_l05;    
                case 'morph-c-90-270-n-la0.5'
                    dirpath = WalkerPath.Morph_StNW1_c_90_270_l05;  
                    
                %morph of the walker generated by Nick    
                case 'morph-nick-c-45-315-n-la0.5'
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l05;
                case 'morph-nick-c-45-315-n-la0.5-bw'
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l05_bw;
                case 'morph-nick-c-45-315-n-la0.75-bw'
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l075_bw;
                case 'morph-nick-c-45-315-n-la0.25-bw'
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l025_bw;     
                case 'morph-nick-c-45-315-n-la0.9-bw'
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l09_bw;     
                case 'morph-nick-c-45-315-n-la0.1-bw'
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l01_bw; 
                case 'morph-nick-c-45-315-n-la0.5-g-6-b'    
                    dirpath = WalkerPath.Morph_Nick_c_45_315_l05_g_6_b;
                    
                %simulation results for RBF networks pathkeys
                case 'sim-c-45-315-n'
                    dirpath = WalkerPath.Sim_c_45_315_n;
                case 'sim-c-45-315-bw'
                    dirpath = WalkerPath.Sim_c_45_315_bw;                 
                case 'sim-c-45-315-n-bw'
                    dirpath = WalkerPath.Sim_c_45_315_n_bw;
                case 'sim-c-45-315-n-nick'
                    dirpath = WalkerPath.Sim_c_45_315_n_nick;
                case 'sim-c-45-315-n-nick-bw'
                    dirpath = WalkerPath.Sim_c_45_315_n_nick_bw;
                case 'sim-c-45-315-0-n-nick-bw'
                    dirpath = WalkerPath.Sim_c_45_315_0_n_nick_bw;
                case 'sim-arm-orsk'
                    dirpath = WalkerPath.Sim_arm_orsk;
                    
                %just display the error message, so {getPath} will just return the {userpath}    
                otherwise
                    display('WARNING: Requested unknown path, returning the {userpath}')
                    dirpath = '';
            end
        end
    end
    
end

%Get the working path to which I right-concatenate the inner path
function corepath = formCorePath
    corepath = strcat(strtok(userpath,';'),filesep);
end