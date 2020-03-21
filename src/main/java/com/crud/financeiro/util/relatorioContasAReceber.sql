SELECT

    --DADOS DO TITULO
    t.data_de_validade as "Data de validade",
    t.data_de_emissao as "Data de emissao",
    t.descricao as "Descricao do titulo",
    t.valor,
    t.valor_original as "Valor original",

    -- DADOS DA ENTIDADE
    e.nome as "Nome do cliente",

    -- DADOS DO TIPO DE PAGAMENTO

    tp.descricao as "Tipo de pagamento"

FROM titulo AS t
    , entidade AS e
    , tipo_de_pagamento AS tp

WHERE

    -- JOINS
        t.entidade_id = e.codigo
    AND tp.codigo = t.tipo_de_pagamento_id

    -- CONDICOES
    AND t.tipo = 'ENTRADA' AND t.situacao = 'PAGAMENTO_NAO_REALIZADO'
    AND t.data_de_validade BETWEEN "2017-01-01" AND "2017-12-01"