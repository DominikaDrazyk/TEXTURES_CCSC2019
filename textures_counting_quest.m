eeglab
% enter space separated answers for questions in correct order, if a question is unvalid, enter '0' 
prompt = {'Enter proper answer or 0 if question unvalid, eg. 3 0 0'};
title = 'ANSWERS';
dims = [1 35];
answer = inputdlg(prompt,title,dims);

answer = regexp(answer, '\s+', 'split');
answer = vertcat(answer{:});

% load a data file
currEEG = pop_loadbv(pwd,'xxx.vhdr');
currEEG.setname='xxx.vhdr';

cfg                         = [];
cfg.dataset                 = currEEG.setname;
cfg.trialfun                = 'trialdefbyquest';
cfg.trialdef.pre            = 0.1;
cfg.trialdef.post           = 0.1;
cfg.ans_table               = answer;      % proper answear or 0 if question unvalid, eg. [3,0,6]

cfg                         = ft_definetrial(cfg);
data                        = ft_preprocessing(cfg);

t = cfg.trl;

selectbyquest(t,currEEG.setname,currEEG);         % creates new modif*dat modif*vmrk modif*vhdr file of selected trials  

%   Warning: unknown resolution (i.e. recording units) for channel 52 in txcn_07.vhdr
%   data.hdr.chanunit >>> 'uV'




