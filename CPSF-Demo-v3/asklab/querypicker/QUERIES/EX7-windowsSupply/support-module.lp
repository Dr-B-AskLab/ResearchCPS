% To reduce the output, manually ground the following rule for concerns C that you are interested in

relevantToFunc("cpsf:Cost","cpsf:bc2")                  :- concern("cpsf:Cost").
relevantToFunc("cpsf:TimeToMarket","cpsf:bc2")   :- concern("cpsf:TimeToMarket").
relevantToFunc("cpsf:Policy","cpsf:bc2")                :- concern("cpsf:Policy").
relevantToFunc("cpsf:Performance","cpsf:bc2")     :- concern("cpsf:Performance").
relevantToFunc("cpsf:Reliability","cpsf:bc2")          :- concern("cpsf:Reliability").
relevantToFunc("cpsf:Safety","cpsf:bc2")               :- concern("cpsf:Safety").
relevantToFunc("cpsf:Environment","cpsf:bc2")               :- concern("cpsf:Environment").

% Quick workaround since I forgot to include descriptions for the new properties
descr(P,P) :- atomic_statement(P,A), not input(P,"rdfs:comment",_).

% The pair <Clause_ID, A> is in the private part of the contract. A is a property/requirement
private_part(C,A) :- input(C,"cpsf:addProperty",P), atomic_statement(P,A).

holds(impacted(C,"cpsf:bc2",pos),S) :-
	step(S),
	private_part(_,A),
	holds(sat(A),S),
	atomic_statement(P,A),
	input(P,"cpsf:addConcern",C).

holds(impacted(C,"cpsf:bc2",neg),S) :-
	step(S),
	private_part(_,A),
	-holds(sat(A),S),
	atomic_statement(P,A),
	input(P,"cpsf:addConcern",C).


% There are some LKAS properties in the base ontology that cause
% certain concerns to be satisfied. This rule ensures that
% all concerns addressed by properties that are not in a
% contract's private part are impacted negatively
holds(impacted(C,F,neg),S) :-
	step(S),
	addresses(A,C,F),
	not private_part(_,A).

%% Link the internal names of clauses to their ontology names
%holds(sat("sufficient_material_for_building"), T):- step(T), holds(phi_1,T).
%-holds(sat("sufficient_material_for_building"), T):- step(T), not holds(phi_1,T).
%
%holds(sat("material_safe_for_building"), T):- step(T), holds(phi_2,T).
%-holds(sat("material_safe_for_building"), T):- step(T), not holds(phi_2,T).
%
%holds(sat("material_sufficiently_durable"), T):- step(T), holds(phi_2,T).
%-holds(sat("material_sufficiently_durable"), T):- step(T), not holds(phi_2,T).
%
%holds(sat("acceptable_shipping_cost"), T):- step(T), holds(phi_3,T).
%-holds(sat("acceptable_shipping_cost"), T):- step(T), not holds(phi_3,T).
%
%holds(sat("promptly_send_payment"), T):- step(T), holds(phi_4,T).
%-holds(sat("promptly_send_payment"), T):- step(T), not holds(phi_4,T).
