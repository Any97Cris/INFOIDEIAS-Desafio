<?php



use Phalcon\Mvc\Model;
use Phalcon\Paginator\Adapter\Model as Paginator;

class Categoria extends Model
{
    public $id;
    public $titulo;    
    
    public function initialize()
    {
        $this->setSource("categoria");
    }

    
}