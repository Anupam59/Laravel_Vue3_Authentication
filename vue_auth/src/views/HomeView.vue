<template>
  <div class="container">
    <div class="row">
      <div class="col mt-3">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title text-center">TODO DATA</h5>

    

            <router-link to="/create" class="btn btn-sm btn-success mb-3">Add New</router-link>

            <div class="table-responsive">
              <table class="table table-striped">

                <thead>
                <tr class="table-primary">
                  <th scope="col">#</th>
                  <th scope="col">Title</th>
                  <th scope="col">Docs</th>
                  <th scope="col">Data</th>
                  <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>



                <tr v-for="(todo,key) in todoAll" :key="todo.todo_id">
                  <th>{{key+1}}</th>
                  <td>{{todo.title}}</td>
                  <td>{{todo.docs}}</td>
                  <td>@{{todo.updated_at}}</td>
                  <td>

                    <router-link :to="`/update/${todo.todo_id}`">
                      <span class="mx-2">
                        <font-awesome-icon :icon="['fas', 'eye']" />
                      </span>
                    </router-link>

                    <a @click="DeleteTodo(todo.todo_id)">
                      <span class="mx-2">
                        <font-awesome-icon :icon="['fas', 'trash']" />
                      </span>
                    </a>

                  </td>
                </tr>



                </tbody>

              </table>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<script>
  import axios from "axios";
  import {toast} from "vue3-toastify";
export default {
  name: 'HomeView',
  data:function (){
    return{
      todoAll:[],
      TodoTitle:'',
      TodoDocs:'',
    }
  },

  created: function(){
    this.getTodoAll()
  },

  methods:{

    async getTodoAll () {
      await axios.post('getTodoAll').then((response)=>{
        console.log(response.data);
        this.todoAll = response.data;
      }).catch((e)=>{
        console.log(e)
      });
    },


    async DeleteTodo (todo_id){
      
      await axios.post('TodoDelete/'+todo_id).then((response)=>{
        console.log(response);
          this.getTodoAll()
          toast("Delete Todo Successfully !", {autoClose: 1000});
        }).catch((e)=>{
          console.log(e)
        });
    
    },

  }
}
</script>
