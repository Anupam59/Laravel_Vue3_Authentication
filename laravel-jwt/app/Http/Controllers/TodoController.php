<?php

namespace App\Http\Controllers;

use App\Models\TodoModel;
use Illuminate\Http\Request;

class TodoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function getTodoAll(){
        $Todo = TodoModel::orderBy('todo_id','desc')->get();
        return $Todo;
    }

    function TodoDelete($Id){
        $Todo= TodoModel::where('todo_id','=',$Id)->delete();
        if($Todo==true){
            return 1;
        }
        else{
            return 0;
        }
    }

    function TodoDetails($Id){
        $Todo = TodoModel::where('todo_id','=',$Id)->get();
        return $Todo;
    }


    function TodoUpdate(Request $req){
        $todo_id= $req->input('todo_id');
        $title= $req->input('title');
        $docs= $req->input('docs');
        $image= $req->input('image');
        $updated_at = date('Y-m-d');

        $Todo = TodoModel::where('todo_id','=',$todo_id)->update([
            'title'=>$title,
            'docs'=>$docs,
            'image'=>$image,
            'updated_at'=>$updated_at
        ]);
        if($Todo==true){
            return 1;
        }
        else{
            return 0;
        }
    }


    function TodoAdd(Request $req){
        $title= $req->input('title');
        $docs= $req->input('docs');
        $image= $req->input('image');
        $created_at = date('Y-m-d');
        $updated_at = date('Y-m-d');

        $result= TodoModel::insert([
            'title'=>$title,
            'docs'=>$docs,
            'image'=>$image,
            'created_at'=>$created_at,
            'updated_at'=>$updated_at
        ]);
        if($result==true){
            return 1;
        }
        else{
            return 0;
        }
    }
}
