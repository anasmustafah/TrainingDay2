%% Basic performance measures
%TIC/TOC

tic; A=rand(1e3); toc

%% Processing time.
t1 = cputime;
A=rand(1e3);
t2 = cputime;
delta_t = t2-t1

%% 2013b onwards TIMEIT
myFunc = @() rand(1e3);
t = timeit(myFunc)