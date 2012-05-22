function state = gaplotchange(options, state, flag)
% GAPLOTCHANGE Plots the logarithmic change in the best score from the 
% previous generation.
%  
persistent last_best % Best score in the previous generation

if(strcmp(flag,'init')) % Set up the plot
	set(gca,'xlim',[1,options.Generations],'Yscale','log');
	hold on;
	xlabel Generation
	title('Change in Best Fitness Value')
end

best = min(state.Score); % Best score in the current generation
if state.Generation == 0 % Set last_best to best.
	last_best = best;
else
	change = last_best - best; % Change in best score 
	last_best=best;
	plot(state.Generation, change, '.r');
	title(['Change in Best Fitness Value'])
end