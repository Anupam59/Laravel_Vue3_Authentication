<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TodoModel extends Model
{
    use HasFactory;
    public $table = 'todo';
    public $primaryKey = 'todo_id';
    public $incrementing = true;
    public $keyType = 'int';
    public $timestamps = false;
}
