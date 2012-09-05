-module(chicagoboss_postgresql_app_todo_controller, [Req]).
-compile(export_all).

list('GET', []) ->
    Todos = boss_db:find(pg_todo, []),
    {ok, [{todos, Todos}]};

list('POST', []) ->
    Todo = pg_todo:new(id, Req:post_param("todo"), erlang:now()),
    Create = Todo:save(),
    case Create of
        {ok, NewTodo} ->
            Todos = boss_db:find(my_todo, []),
            {ok, [{todos, Todos}]};
        {error, [ErrorMessages]} ->
            {ok, [{errors, ErrorMessages}]}
    end.
