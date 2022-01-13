{% extends 'layouts/index.volt' %}

    {% block content %}

        <div id="cadastro_ticket" class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="glyphicon glyphicon-plus"></i>
                        &nbsp;Editar Noticia
                    </div>
                    {{ form('noticias/salvar', 'method': 'post', 'enctype' : 'multipart/form-data', 'name':'cadastrar') }}
                        
                        <div class="panel-body">
                            <div class="col-md-12"  id="conteudo">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <p><strong>Data de Criação:</strong> {{ date('d/m/Y H:i:s',strtotime(noticia.data_cadastro))}}</p>
                                                <p><strong>Data da Última Atualização:</strong>{{ date('d/m/Y H:i:s',strtotime(noticia.data_ultima_atualizacao))}}</p>
                                                <input type="hidden" value="{{noticia.id}}" name="id">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Titulo">Título <span class="error">(*)<span></label>
                                                <input type="text" value="{{noticia.titulo}}" width='100%' class= "form-control" name="titulo">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Categoria">Categoria <span class="error">(*)<span></label>
                                                <select name="categoria_id">
                                                    {% for categoria in categorias %}

                                                        <option value="{{categoria.id}}" {% if categoria.id == noticia.categoria_id %} selected {% endif %}>{{categoria.titulo}}</option>
                                                        
                                                    {% endfor %}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Publicado"> Publicado</label>
                                                <input type="checkbox" name="publicado" id="publicado" {% if noticia.publicado == 1 %} checked {% endif %}>
                                            </div>
                                        </div>
                                        <div class="row" id="visualizar">
                                            <div class="form-group col-sm-12">
                                                <label for ="Data Publicação">Data Publicação <span class="error">(*)<span></label>
                                                <input type="date" value="{{noticia.data_publicacao}}" width='100%' class= "form-control" name="data_publicacao">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Texto">Texto</label>
                                                <textarea class= "form-control" name="texto">{{ noticia.texto }}</textarea>
                                            </div>
                                        </div>
                                    </div>{#/.panel-body#}
                                </div>{#/.panel#}
                                <div class="row" style="text-align:right;">
                                    <div id="buttons-cadastro" class="col-md-12">
                                        <a href="{{ url(['for':'noticia.lista']) }}" class="btn btn-default">Cancelar</a>
                                        {{ submit_button('Gravar', "class": 'btn btn-primary') }}
                                    </div>
                                </div>
                            </div>{#/.conteudo#}
                        </div>{#/.panel-body#}
                    {{ end_form() }}
                </div>{#/.panel#}
            </div>{#/.col-md-12#}
        </div><!-- row -->

    {% endblock %}

    {%  block extrafooter %}
        
        <script>
            $(document).ready(function(){
                var checkbox = document.querySelector("#publicado");

                if(checkbox.checked === true) {
                    $("#visualizar").show();
                }else{
                    $("#visualizar").hide();
                }
                $('#publicado').mousedown(function() {
                    if (!$(this).is(':checked')) {
                        $("#visualizar").show();
                        $(this).trigger("change");
                    }else{
                        $("#visualizar").hide();
                        $(this).trigger("change");
                    }
                });

            });
        </script>
    {% endblock %}
