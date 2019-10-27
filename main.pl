% Verifica se um elemento X pertence a uma lista (segundo parâmetro), percorrendo toda a lista enviada comparando o primeiro elemento da mesma, e se não encontrar envia a cauda da lista para continuar.
pertence(X,[X|_]):-!.
pertence(X,[_|C]):-
	pertence(X,C).

% Procura a Distance e Caminho entre dois elementos (Inicio e Fim)
caminho(Inicio,Fim,Distancia,Caminho):-
	% Envia os parâmetros recebidos para a função 'caminho1', onde o '0' é a distancia inicial e a 'Distancia' será a distância final. Também passa o elemento alvo como lista.
	caminho1(Inicio,[Fim],0,Distancia,Caminho).


% Se a pessoa for ela mesma retorna distância como 0 e lista contendo somente ela como item. Condição de parada
caminho1(Pessoa,[Pessoa|ListaPessoas],Distancia,Distancia,[Pessoa|ListaPessoas]).

% Procura o caminho para o alvo percorrendo os adjacentes do inicio.
caminho1(Inicio,[Adjacente|ListaPessoas],Distancia,DistFinal,CaminhoFinal):-
	% Busca os adjacentes do adjacentes (Intermediario) e sua respectiva distancia
	laco(Intermediario,Adjacente,D1),
	% Verifica se o mesmo já não pertence a lista (já foi percorrido)
	not(pertence(Intermediario,[Adjacente|ListaPessoas])),
	% Soma a distancia atual com a distancia entre adjacente e intermediario
	D2 is Distancia+D1,
	% Continua a expandir a fronteira até encontrar o alvo (ou não), caso não, retorna 'false'
	caminho1(Inicio,[Intermediario,Adjacente|ListaPessoas],D2,DistFinal,CaminhoFinal).
