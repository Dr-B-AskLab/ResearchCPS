% ======== SIMPLE EXAMPLE 1 ========
%       -- to be used together with theory*.lp
%          and with step1-{optimistic,skeptical,pessimistic}.lp
%
% SYSTEM DESCRIPTION
% Input device 1 can operate in one of slow-mode and fast-mode.
% The SAM determines the mode of operation of input device 1.
% Normally, input device 1 reads inputs with a consistent frequency.
% If the basic type of input device 1 is configured to use
% encrypted memory and fast-mode, then the device will be
% unable to maintain a consistent frequency of reading.
%
% CONFIGURATION
% The SAM and input device 1 are configured to use encrypted 
% memory and secure boot. 
% The basic type of input device 1 is used.
% The SAM is configured to set input device 1 to slow-mode.
%
% Questions:
%   1. Is the functionality concern satisfied?
%   2. Is the functional aspect satisfied?
%   3. Are all aspects satisfied?
% 
% Answers:
%   1. Yes
%   2. Yes (because all concerns and sub-concerns of functional aspect are satisfied)
%   3. Yes (because all aspects are satisfied)




% ------ Initial state of the CPS ------

% Properties
% ---Observations
obs(sat("encrypted_mem_input1"),false).
obs(sat("encrypted_mem_sam"),false).
obs(sat("sec_boot_input1"),false).
obs(sat("sec_boot_sam"),false).
obs(sat("slow_mode_input1"),false).

step(0).

% TO BE CHANGED IN ONTOLOGY <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 
% --- not needed ---
% Must rename cpsf:addressedByProperty to cpsf:addresses and invert arguments
%input(P,"cpsf:addresses",C) :- input(C,"cpsf:addressedByProperty",P).

% TO BE CHANGED IN ONTOLOGY <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 
% --- not needed ---
%% Must populate cpsf:addressesAtFunc -- set to bc1 by default
%other_func(P,C,"cpsf:bc1") :-
%	input(P,"cpsf:addressesAtFunc",F), 
%	input(C,"cpsf:addressedByProperty",P),
%	F != "cpsf:bc1".
%input(P,"cpsf:addressesAtFunc","cpsf:bc1") :- 
%	input(C,"cpsf:addressedByProperty",P),
%	not other_func(P,C,"cpsf:bc1").

% impacts of requirements -- shortcut using addresses/3, from cpsf:addressedByProperty and cpsf:addressesAtFunc
%holds(impacted(C,F,pos),S) :-
%	step(S),
%	addresses(A,C,F),
%	holds(sat(A),S).

