<?php



use Phalcon\Mvc\Model;
use Phalcon\Paginator\Adapter\Model as Paginator;

class Noticia extends Model
{
    public $id;
    public $titulo;
    public $texto;
    public $data_ultima_atualizacao;
    public $data_cadastro;
    public $categoria_id;
    public $publicado;
    public $data_publicacao;

    public function initialize()
    {
        $this->setSource("noticia");
    }

    
}