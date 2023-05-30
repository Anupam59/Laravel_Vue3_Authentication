<template>
    <div class="container">

        <h5 class="card-title text-center">TODO Update</h5>
      
        <div class="mb-3">

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Todo Title</label>
                <input type="text" class="form-control" v-model="TodoTitle">
            </div>

            <div class="mb-3">
                <label class="form-label">Todo Docs</label>
                <input type="text" class="form-control" v-model="TodoDocs">
            </div>

            <button @click="UpdateTodo" class="btn btn-primary">Update Todo</button>

        </div>

    </div>
  
  </template>
  

  <script>
    import axios from "axios";
    import {toast} from "vue3-toastify";
  export default {
    name: 'UpdatePart',
    data:function (){
      return{
        TodoTitle:'',
        TodoDocs:'',
        TodoId:'',
      }
    },
  
    created: async function(){
        let todoid = this.$route.params.todoid;
        this.TodoDetails(todoid);
    },
  
    methods:{

        async TodoDetails (todoid){
        await axios.post('TodoDetails/'+todoid).then((response)=>{
            this.TodoTitle = response.data[0].title;
            this.TodoDocs = response.data[0].docs;
            this.TodoId = response.data[0].todo_id;
        }).catch((e)=>{
          console.log(e)
        });
      },

  
      async UpdateTodo (){
        await axios.post('TodoUpdate',{
            todo_id: this.TodoId,
            title: this.TodoTitle,
            docs: this.TodoDocs,
        }).then((response)=>{
          
          console.log(response);
          toast("Update Todo Successfully !", {autoClose: 1000});
          this.$router.push('/')

        }).catch((e)=>{
          console.log(e)
        });

      },
  
    }
  }
  </script>
  