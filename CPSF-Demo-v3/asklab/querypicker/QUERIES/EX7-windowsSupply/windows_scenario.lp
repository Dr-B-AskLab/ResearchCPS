%%%%%INSTANCES DEFINITIONS

example(case).


%%% Example 1 -- No broken windows and everything is alright
broken_percentage(0) 	  	:- example(1).
initial_w_available(1000) 	:- example(1).
min_w_quality(0)			:- example(1).
max_w_quality(3)			:- example(1).
windows_amount(500)			:- example(1).
init(available_windows(1000,Q1..Q2)) :- example(1), min_w_quality(Q1), max_w_quality(Q2).

%%% Example 2 -- 10% windows broken, Seller replace them with same quality windows
broken_percentage(10) 	  	:- example(2).
initial_w_available(1000) 	:- example(2).
min_w_quality(0)			:- example(2).
max_w_quality(3)			:- example(2).
windows_amount(550)			:- example(2).
init(available_windows(1000,1)) :- example(2).
init(available_windows(550,2)) :- example(2).
init(available_windows(1000,3)) :- example(2).

%%% Example 3 -- 10% windows broken, Seller replace them with diff quality windows (solar panel requirement satisfied)
broken_percentage(10) 	  	:- example(3).
initial_w_available(400) 	:- example(3).
min_w_quality(0)			:- example(3).
max_w_quality(3)			:- example(3).
windows_amount(220)			:- example(3).
windows_amount(330)			:- example(3).
init(available_windows(1000,1)) :- example(3).
init(available_windows(500,2)) :- example(3).
init(available_windows(1000,3)) :- example(3).

%%% Example 4 -- 10% windows broken, Seller replace them with diff quality windows (no solar panel requirement satisfied)
broken_percentage(10) 	  	:- example(4).
initial_w_available(400) 	:- example(4).
min_w_quality(0)			:- example(4).
max_w_quality(2)			:- example(4).
windows_amount(220)			:- example(4).
windows_amount(330)			:- example(4).
init(available_windows(1000,1)) :- example(4).
init(available_windows(500,2)) :- example(4).
init(available_windows(0,3)) :- example(4).


%Windows predicate -> windows(quantity,quality,heating_capacity(?))
%min_w_quality(0).
%max_w_quality(4).

min_heating_capacity(0).
max_heating_capacity(4).

%initial_w_available(1000). %Maybe add quality
initial_w_shipped(0).
initial_w_delivered(0).
initial_w_broken(0).

windows_to_buy(500).

minimum_quality(1).
minimum_environmental_quality(2).

%broken_quantity(1000). % For now constant
%broken_percentage(10). % For now constant

%windows_amount(50).
%windows_amount(100).
%windows_amount(150).
%windows_amount(220).
%windows_amount(330).
%windows_amount(500).
%windows_amount(550).
%windows_amount(500).
%windows_amount(550).

%initial_available_windows(10,Q1..Q2,C1..C2) :- min_w_quality(Q1), max_w_quality(Q2), min_heating_capacity(C1), max_heating_capacity(C2).


windows_cost(10). %Add quality dependance?
shipping_cost(50).

initial_fund_available(200000).
initial_fund_spent(0).

money_amount(100).
money_amount(500).
money_amount(1000).
money_amount(1500).
money_amount(2000).
money_amount(3500).
money_amount(4500).
money_amount(5000).
money_amount(5500).


%%%%%DOMAIN

%Initialization

%%%%%PREDICATES DEFINITIONS -- INSTANCE'S INDEPENDENT
%Windows predicate -> windows(quantity,quality,heating_capacity(?))
windows_quality(Q1..Q2) :- min_w_quality(Q1), max_w_quality(Q2).
%windows_heating_capacity(C1..C2) :- min_heating_capacity(C1), max_heating_capacity(C2).

#const maxTime=4.

step(0..maxTime).

init(available_fund(I))      :- initial_fund_available(I).
init(spent_fund(I,windows))  :- initial_fund_spent(I).
init(spent_fund(I,shipping)) :- initial_fund_spent(I).

%init(available_windows(I,Q1..Q2)) :- min_w_quality(Q1), max_w_quality(Q2), initial_w_available(I).
init(shipped_windows(I,Q1..Q2))   :- min_w_quality(Q1), max_w_quality(Q2), initial_w_shipped(I). %At the momement single receiver 
init(delivered_windows(I,Q1..Q2)) :- min_w_quality(Q1), max_w_quality(Q2), initial_w_delivered(I). %At the momement single receiver 
init(broken_windows(I,Q1..Q2))    :- min_w_quality(Q1), max_w_quality(Q2), initial_w_broken(I). %At the momement single receiver 

%%%Rules

%Amount after transactions management
	%Assume complete description --holds(lumber_board(0,G), 0)  :-  grade(G), not assume(lumber_board(_,G)).
holds(available_windows(X,Q), 0) :-  init(available_windows(X,Q)).
holds(shipped_windows(X,Q), 0)   :-  init(shipped_windows(X,Q)).
holds(delivered_windows(X,Q), 0) :-  init(delivered_windows(X,Q)).
holds(broken_windows(X,Q), 0)    :-  init(broken_windows(X,Q)).

holds(available_fund(X), 0) :-  init(available_fund(X)).
holds(spent_fund(X,T), 0)   :-  init(spent_fund(X,T)).


%Actually delivered windows -- we assume the difference is broken so not in available either
holds(available_windows(X-Z,Q), T+1)  :-  step(T), holds(available_windows(X,Q), T), observation(shipped(Z,Q),T).
holds(available_windows(X  ,Q), T+1)  :-  step(T), holds(available_windows(X,Q), T), not observation(shipped(_,Q),T).

holds(shipped_windows(X+Z,Q), T+1)    :-  step(T), holds(shipped_windows(X,Q), T), observation(shipped(Z,Q),T).
holds(shipped_windows(X  ,Q), T+1)    :-  step(T), holds(shipped_windows(X,Q), T), not observation(shipped(_,Q),T).

holds(delivered_windows(X+Z,Q), T+1)  :-  step(T), holds(delivered_windows(X,Q), T), observation(delivered(Z,Q),T).
holds(delivered_windows(X  ,Q), T+1)  :-  step(T), holds(delivered_windows(X,Q), T), not observation(delivered(_,Q),T).


holds(broken_windows(X+(S-D),Q), T+1) :-  step(T), holds(broken_windows(X,Q), T), observation(shipped(S,Q),T), observation(delivered(D,Q),T).
holds(broken_windows(X      ,Q), T+1) :-  step(T), holds(broken_windows(X,Q), T), not observation(shipped(_,Q),T).
holds(broken_windows(X      ,Q), T+1) :-  step(T), holds(broken_windows(X,Q), T), not observation(delivered(_,Q),T).


%holds(needed(X),0) :- windows_to_buy(X).
%holds(needed(X'),T+1) :- step(T), step(T+1), observation(shipped(S,_),T), holds(needed(X),T), X'=X-S.

%Delivered generation
%observation(shipped(500,2), 0).
% At the first step, buy exactly what you need
observation(shipped(X,Q), 0):- windows_to_buy(X), minimum_environmental_quality(Q), holds(available_windows(X',Q),0), X'>=X.
% At the following time steps, buy what you need to make up for any issues with the previous deliveries
1{ observation(shipped(B-Y,Q), T):windows_quality(Q), minimum_quality(MQ), Q >= MQ, holds(available_windows(A,Q),0), A>=B-Y }1 :- step(T), Y = #sum{X,Q : observation(delivered(X,Q), T'), step(T'), T'<T}, windows_to_buy(B), Y<B.
:- step(T), holds(available_windows(X1,Q), T), observation(shipped(X2,Q), T), X2 > X1.
% only one shipment at a time
:- step(T), observation(shipped(X,Q), T), observation(shipped(X',Q'), T), X!=X'.
:- step(T), observation(shipped(X,Q), T), observation(shipped(X',Q'), T), Q!=Q'.

%observation(delivered(S-B,Q),T) :- step(T), observation(shipped(S,Y), T), broken_quantity(B).
observation(delivered(S-((S/100)*B),Q),T) :- step(T), observation(shipped(S,Q), T), broken_percentage(B).

%Basic Constraints
%:- step(T), T > 0, observation(shipped(X1,Q),T), holds(available_windows(I,Q), T), init(available_windows(I,Q)). %Impossible that initial availability is the same if delivered
%:- step(T), #count{windows_quality(Q), windows_amount(X): observation(shipped(X,Q),T)} > 1.

%Payment Management
{observation(paid(X,  windows),	T) : money_amount(X)} 1 :- step(T).
:- step(T), observation(paid(X,  windows),	T), holds(available_fund(Y), T), Y < X.

{observation(paid(X, shipping), T) : money_amount(X)} 1 :- step(T).
:- step(T), observation(paid(X,  shipping),	T), holds(available_fund(Y), T), Y < X.

holds(available_fund(A-P), T+1)	:-  step(T), holds(available_fund(A), T), P = #sum{M : observation(paid(M,_), T)}.
holds(available_fund(A  ), T+1)	:-  step(T), holds(available_fund(A), T), not observation(paid(_,_), T).


holds(spent_fund(S+P,Y), T+1)	:-	step(T), holds(spent_fund(S,Y), T), observation(paid(P,Y), T).
holds(spent_fund(S  ,Y), T+1)	:-	step(T), holds(spent_fund(S,Y), T), not observation(paid(_,Y), T).


%%%CLAUSES

% S: Seller
% B: Buyer

% C1: S responsible_for		shipped(500,Q), MQ <= Q								when	by_week 4 (between T1 and T2) -- We are not sure on how many windows will break
% C2: S	responsible_for		delivered(500,Q), MQ <= Q							when	by_week 4 (between T1 and T2) -- This enforces the right delivery
% C3: B	responsible_for		paid(windows_needed*windows_cost)  				 	when  	by_week 4
% C4: B	responsible_for		exists(X), X >= shipping_cost, paid(X, shipping)  	when  	by_week 4

% C5: S responsible_for		delivered(500,Q), ENV_Q <= Q						when	by_week 4 (between T1 and T2) -- For the solar panel requirement


clause(c1, seller,	phi_1, by(3,4)).
clause(c1_mono, seller,	phi_1_mono, by(3,4)). %To enforce mono quality if possible
clause(c2, seller,	phi_2, by(3,4)).
clause(c2_mono, seller,	phi_2_mono, by(3,4)). %To enforce mono quality if possible
clause(c3, buyer,	phi_3, by(3,4)).
clause(c4, buyer,	phi_4, by(3,4)).

clause(c5, seller,	phi_5, by(3,4)).

%New Constraint -- impossibile to  have total received windows different from total requested windows
:- Y = #sum{X,Q : holds(delivered_windows(X,Q), maxTime+1)}, Y != B, windows_to_buy(B).


%%% CLAUSE 1 -- PHI 1 -- Different encoding are possible swithcing between observation and hold

%% Multi Quality

holds(phi_1, T) :- step(T), Y = #sum{X : holds(shipped_windows(X,Q), T), windows_quality(Q)}, Y >= B, windows_to_buy(B).
%holds(phi_1, T) :- step(T), Y = #sum{X,Q,T1 : observation(shipped(X, Q), T1), Q>=MQ, T>=T1}, Y >= B, windows_to_buy(B), minimum_quality(MQ).

%%% Mono Quality -- we add this so that the windows are all the same quality if possible -- only activated when the previous is
holds(phi_1_mono, T) :- step(T), holds(shipped_windows(X,Q), T), X >= B, windows_to_buy(B).

%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% CLAUSE 2 -- PHI 2 -- Different encoding are possible swithcing between observation and hold

%% Multi Quality
holds(phi_2, T) :- step(T), Y = #sum{X : holds(delivered_windows(X,Q), T), windows_quality(Q)}, Y >= B, windows_to_buy(B).

%%% Mono Quality -- we add this so that the windows are all the same quality if possible -- only activated when the previous is
holds(phi_2_mono, T) :- step(T), holds(delivered_windows(X,Q), T), X >= B, windows_to_buy(B).
multi_quality_delivered :- not holds(phi_2_mono,_).
%%% Prints the windows distribution
final_multi_distribution(Y,Q) :- multi_quality_delivered, holds(delivered_windows(Y,Q), maxTime+1), Y > 0.
final_mono_distribution(Y,Q)  :- not multi_quality_delivered, holds(delivered_windows(Y,Q), maxTime+1), Y >= B, windows_to_buy(B).


%holds(phi_2, T) :- step(T), Y = #sum{X,Q,T1 : observation(delivered(X, Q), T1), Q>=MQ, T>=T1}, Y >= B, windows_to_buy(B), minimum_quality(MQ).
%
%%% Mono Quality -- we add this so that the windows are all the same quality if possible -- only activated when the previous is
%holds(phi_2_mono, T) :- step(T), holds(delivered_windows(X, Q), T), Q>=MQ, X >= B, windows_to_buy(B), minimum_quality(MQ), holds(phi_2, T).
%
%%%% Prints the windows distribution
%replacement(X,Q,T) :- step(T), holds(phi_2, T), not holds(phi_2_mono, T),
%					observation(delivered(X, Q), T1), T >= T1.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% CLAUSE 3 -- PHI 3

%% paying the full contract

% Payment independet from delivery status
holds(phi_3, T) :- step(T), holds(spent_fund(P,windows), T), P >= B*C, windows_to_buy(B), windows_cost(C).
% Only delivered windows version
%holds(phi_3, T) :- step(T), holds(spent_fund(P,windows), T), P >= X*C, holds(delivered_windows(X,Q),maxTime), windows_cost(C), minimum_quality(MQ)

%%% paying as needed -- REMOVED For now because we allow delayed payment (needed only before week 4)
%holds(phi_3, T) :- step(T), holds(board_cost(0), T).

%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% CLAUSE 4 -- PHI 4

%For now is just a single shipping cost, we can make it dependent of every single transaction
holds(phi_4, T) :- step(T), holds(spent_fund(P,shipping), T), shipping_cost(C), P >= C.

%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% CLAUSE 5 -- PHI 5

holds(phi_5, T) :- step(T), Y = #sum{X,Q,T1 : observation(delivered(X, Q), T1), Q>=ENV_Q, T>=T1}, Y >= B, windows_to_buy(B), minimum_environmental_quality(ENV_Q).
%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% satisfaction of clauses

satisfies(C, T) :- step(T), clause(C, _, F, by(N)), T<=N, holds(F, T).
not_satisfies(C, T) :- step(T), clause(C, _, F, by(N)), T<=N, not holds(F, T).
satisfies(C, T) :- step(T), clause(C, _, F, by(M,N)), M<=T, T<=N, holds(F, T).
not_satisfies(C, T) :- step(T), clause(C, _, F, by(M,N)), M<=T, T<=N, not holds(F, T).

good(N) :- N = #count{C : satisfies(C, maxTime)}.
#maximize {N : good(N)}.
%#maximize {Z : holds(available_fund(Z), maxTime+1)}.


%%%

%#maximize {Z : holds(available_fund(Z), maxTime+1)}.

%*
#show.

% #show holds/2.
#show occurs/2.
#show observation/2.
#show received(board(X,Y), T) : observation(delivered(X,Y), T).
#show satisfies(X) : satisfies(X, maxTime).
#show not_satisfies(X) : not_satisfies(X, maxTime).
#show replacement/2.
 #show good/1.
*%



holds(sat("sufficient_material_for_building"), T):- step(T), holds(phi_1,T).
-holds(sat("sufficient_material_for_building"), T):- step(T), not holds(phi_1,T).

holds(sat("material_ready_for_building"), T):- step(T), holds(phi_2,T). %Name changed from "material_safe_for_building" to "material_ready_for_building"
-holds(sat("material_ready_for_building"), T):- step(T), not holds(phi_2,T). %Name changed from "material_safe_for_building" to "material_ready_for_building"

holds(sat("material_sufficiently_durable"), T):- step(T), holds(phi_2,T).
-holds(sat("material_sufficiently_durable"), T):- step(T), not holds(phi_2,T).


holds(sat("promptly_send_payment"),		T):- step(T), holds(phi_3,T).
-holds(sat("promptly_send_payment"), 	T):- step(T), not holds(phi_3,T).


holds(sat("acceptable_shipping_cost"),	T):- step(T), holds(phi_4,T).
-holds(sat("acceptable_shipping_cost"), T):- step(T), not holds(phi_4,T).

%%%%% Newly introduced requirement
holds(sat("solar_panel_requirement"), T):- step(T), holds(phi_5,T).
-holds(sat("solar_panel_requirement"), T):- step(T), not holds(phi_5,T).


%%%%%%%%% SHOWS and DEBUG

total(A) :- A = #sum{X,Q,T1 : observation(delivered(X, Q), T1), Q>=ENV_Q, T>=T1}, T = maxTime, minimum_environmental_quality(ENV_Q).
final_sat(X) :- holds(sat(X),_).
aval_w(X,Y,T) :- holds(available_windows(X,Y), T).
ship_w(X,Y,T) :- holds(shipped_windows(X,Y), T).
obs_ship(X,Y,T) :- observation(shipped(X,Y), T).

obs_payment(X,Y,T) :- observation(paid(X, Y),	T).
aval_fund(A,T) :- holds(available_fund(A), T).
spent_fund(S,Y,T) :- holds(spent_fund(S,Y), T).

%%%% Prints the windows distribution
replacement(X,Q,T) :- step(T), T>0, observation(shipped(X, Q), T).


%*
#show final_sat/1.
#show final_mono_distribution/2.
#show final_multi_distribution/2.
%#show replacement/3.
%#show total/1.
%#show aval_w/3.
%#show ship_w/3.
%#show obs_ship/3.
%#show obs_payment/3.
%#show aval_fund/2.
%#show spent_fund/3.
%holds(sat("mono1"), T):- step(T), holds(phi_1_mono,T).
%-holds(sat("mono1"), T):- step(T), not holds(phi_1_mono,T).
%holds(sat("mono2"), T):- step(T), holds(phi_2_mono,T).
%-holds(sat("mono2"), T):- step(T), not holds(phi_2_mono,T).
*%
