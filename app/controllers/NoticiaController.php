<?php


class NoticiaController extends ControllerBase
{
    private $mensagemDeErro = '';

    public function listaAction()
    {
        //busca no banco todas as noticias
        $this->view->noticias = Noticia::find();
        $this->view->pick("noticia/listar");
    }

    public function cadastrarAction()
    {
        //busca todas categorias para colocra no formulário de noticias na listagem categoria
        $this->view->categorias = Categoria::find();
        $this->view->pick("noticia/cadastrar");
    }

    public function editarAction($id)
    {
        //faz uma busca da noticia selecionada para mostrar no formulário os dados
        $dados = Noticia::findFirst("id = '$id'");
        
        //verifica se existe essa informação no banco para mostrar no formulário
        //caso não exista volta para a tela noticias
        if(!empty($dados)){            
            $this->view->noticia = $dados;
            //carregar as categorias do formulário
            $categorias = Categoria::find();
            $this->view->categorias = $categorias;
        }else{
            return $this->response->redirect(array('for' => 'noticia.lista'));
        }        

        $this->view->pick("noticia/editar");
    }

    public function salvarAction()
    {
        //pega os dados enviados no formulário
        $dados = $this->request->getPost();

        //critica para verificar se campo titulo esta vazio, caso esteja vazio não deixa cadastrar
        if(empty($dados['titulo'])){
            $this->flashSession->error('Campo titulo é obrigratório');
            return $this->response->redirect(array('for' => 'noticia.cadastrar'));
        }

        //critica para verificar se o titulo é maior que 255 caracteres
        if(strlen($dados['titulo']) > 255){
            $this->flashSession->error('Campo titulo não pode ser maior que 255 caracteres');
            return $this->response->redirect(array('for' => 'noticia.cadastrar'));
        
        }

        //lógica para verificar se tem id, se existir id faz atualização, se não cadastra uma nova noticia
        if(!empty($dados['id'])){
            $id = $dados['id'];
            $noticia = Noticia::findFirst("id = '$id'");

            $noticia->titulo = $dados['titulo'];
            $noticia->texto = $dados['texto'];            
            $noticia->data_ultima_atualizacao = date('Y-m-d H:i:s');
            $noticia->categoria_id = $dados['categoria_id'];

            $noticia->data_publicacao = $dados['data_publicacao'];            
            
            if(!empty($dados['publicado'])){
                
                $noticia->publicado = 1;
            }else{
                
                $noticia->publicado = 0;
            }

            $noticia->save();

            //mensagem de retorno para o usuario se atualizou com sucesso
            $this->flashSession->success('Atualizado com sucesso');

        }else{
            $noticia = new Noticia();
            $noticia->titulo = $dados['titulo'];
            $noticia->texto = $dados['texto'];
            $noticia->data_cadastro = date('Y-m-d H:i:s');
            $noticia->data_ultima_atualizacao = date('Y-m-d H:i:s');
            $noticia->categoria_id = $dados['categoria_id'];            
            $noticia->data_publicacao = $dados['data_publicacao'];            
            
            //verifica se o checkbox esta marcado
            if(!empty($dados['publicado'])){
                
                $noticia->publicado = 1;
            }else{
                
                $noticia->publicado = 0;
            }
            $noticia->save();

            //mensagem de retorno para o usuario se salvar com sucesso
            $this->flashSession->success('Salvo com sucesso');
        }       

        return $this->response->redirect(array('for' => 'noticia.lista'));
    }

     public function excluirAction($id)
     {
        //buscando o id selecionado
        $dados = Noticia::findFirst("id = '$id'");

        //verificar se encontrou id selecionado, se não encontrou envia para tela de noticias
        if(!empty($dados)){
            $dados->delete();
            $this->flashSession->success('Excluido com sucesso');
        }else{
            
            return $this->response->redirect(array('for' => 'noticia.lista'));
        }

        return $this->response->redirect(array('for' => 'noticia.lista'));
     }

}