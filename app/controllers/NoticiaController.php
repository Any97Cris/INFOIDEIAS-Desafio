<?php


class NoticiaController extends ControllerBase
{
    private $mensagemDeErro = '';

    public function listaAction()
    {
        $this->view->noticias = Noticia::find();
        $this->view->pick("noticia/listar");
    }

    public function cadastrarAction()
    {

        $categorias = Categoria::find();
        $this->view->categorias = $categorias;
        $this->view->pick("noticia/cadastrar");
    }

    public function editarAction($id)
    {

        if(empty($id) or !isset($id)){
            $this->response->redirect('');
        }else{
            
            $dados = Noticia::findFirst("id = '$id'");

                if($dados->count() > 0){
                    $this->view->noticia = $dados;
                    $categorias = Categoria::find();
                    $this->view->categorias = $categorias;
                }else{
                    $this->response->redirect('');
                }

            
        }

        $this->view->pick("noticia/editar");
    }

    public function salvarAction()
    {
        $dados = $this->request->getPost();

        if(empty($dados['titulo'])){
            $this->flashSession->error('Campo titulo é obrigratório');
            return $this->response->redirect(array('for' => 'noticia.cadastrar'));
        }

        if(strlen($dados['titulo']) < 5){
            $this->flashSession->error('Campo titulo não pode ser menor que 255 caracteres');
            return $this->response->redirect(array('for' => 'noticia.cadastrar'));
        
        }

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


            $this->flashSession->success('Atualizado com sucesso');

        }else{
            $noticia = new Noticia();
            $noticia->titulo = $dados['titulo'];
            $noticia->texto = $dados['texto'];
            $noticia->data_cadastro = date('Y-m-d H:i:s');
            $noticia->data_ultima_atualizacao = date('Y-m-d H:i:s');
            $noticia->categoria_id = $dados['categoria_id'];            
            $noticia->data_publicacao = $dados['data_publicacao'];            
            
            if(!empty($dados['publicado'])){
                
                $noticia->publicado = 1;
            }else{
                
                $noticia->publicado = 0;
            }
            $noticia->save();
            //exit;
            $this->flashSession->success('Salvo com sucesso');
        }       

        return $this->response->redirect(array('for' => 'noticia.lista'));
    }

     public function excluirAction($id)
     {
        if(empty($id) or !isset($id)){
            $this->response->redirect('');
        }else{
            
            $dados = Noticia::findFirst("id = '$id'");

                if($dados->count() > 0){
                    $dados->delete();
                    $this->flashSession->success('Excluido com sucesso');
                }else{
                    $this->response->redirect('');
                }

            
        }
        return $this->response->redirect(array('for' => 'noticia.lista'));
     }

}