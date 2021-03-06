-module(util).
-export([
    pick_random/1,
    pretty_print_atom/1,
    grammatical_concatenate/1,
    pretty_print_list/1
]).

-spec pick_random([any(), ...]) -> any().
pick_random(List) ->
    lists:nth(rand:uniform(length(List)), List).

-spec pretty_print_atom(atom()) -> string().
pretty_print_atom(Atom) ->
    Str = atom_to_list(Atom),
    string:join([string:titlecase(Lexeme) || Lexeme <- string:lexemes(Str, [$_])], " ").

-spec grammatical_concatenate([atom(), ...]) -> string().
grammatical_concatenate([H]) ->
    pretty_print_atom(H);
grammatical_concatenate([H, T]) ->
    string:join([pretty_print_atom(H), pretty_print_atom(T)], " and ");
grammatical_concatenate([H | T]) ->
    All = [pretty_print_atom(S) || S <- [H | T]],
    Last = pretty_print_atom(lists:last(T)),
    string:join([string:join(lists:droplast(All), ", "), Last], " and ").

-spec pretty_print_list(string()) -> ['ok'].
pretty_print_list(L) ->
    [io:format([Li | "~n"]) || Li <- L].

