<template>
    <div class="container">

        <h5 class="card-title text-center">TODO Create</h5>
      
        <div class="mb-3">

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Todo Title</label>
                <input type="text" class="form-control" v-model="TodoTitle">
            </div>

            <div class="mb-3">
                <label class="form-label">Todo Docs</label>
                <input type="text" class="form-control" v-model="TodoDocs">
            </div>

            <button @click="AddTodo" class="btn btn-primary">Add Todo</button>

        </div>

    </div>
  
  </template>
  

  <script>
    import axios from "axios";
    import {toast} from "vue3-toastify";
  export default {
    name: 'CreatePart',
    data:function (){
      return{
        TodoTitle:'',
        TodoDocs:'',
      }
    },
  
    created: function(){
    //   this.getTodoAll()
    },
  
    methods:{
  
      async AddTodo (){
        await axios.post('TodoAdd',{
            title: this.TodoTitle,
            docs: this.TodoDocs,
        }).then((response)=>{
          
          console.log(response);
          toast("Add Todo Successfully !", {autoClose: 1000});
          this.$router.push('/')

        }).catch((e)=>{
          console.log(e)
        });

      },
  
    }
  }
  </script>
  