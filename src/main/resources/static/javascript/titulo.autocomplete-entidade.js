var Financeiro = Financeiro || {};

Financeiro.Autocomplete = (function () {

    function Autocomplete() {

    }

    Autocomplete.prototype.iniciar = function () {
        $.ajax({

            type: 'GET',
            url: '/entidades/filtro?nome=',
            success: function(response) {
                var entidadesServidor = response;
                var entidadesSugestao = {};

                for(var i = 0; i < entidadesServidor.length; i++) {
                    entidadesSugestao[entidadesServidor[i].nome] = entidadesServidor[i].flag;
                }

                $('input.autocomplete').autocomplete({
                    data: entidadesSugestao,
                    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
                    onAutocomplete: function(texto) {
                        onSendItem(texto);
                    },
                    minLength: 1 // The minimum length of the input for the autocomplete to start. Default: 1.
                  });

                  function onSendItem(texto) {
                    var codigo = 0;
                    entidadesServidor.filter(function (obj) {
                        if(obj.nome.trim() === texto.trim()) {
                            codigo = obj.codigo;
                        }
                    });

                    if(codigo > 0) {
                        $('#entidade').attr('value', codigo);
                    }

                  }

            }

        });
    };

    return Autocomplete;

}());

$(function () {

    var autocomplete = new Financeiro.Autocomplete();
    autocomplete.iniciar();

});