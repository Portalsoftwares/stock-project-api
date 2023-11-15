
// import axios from "axios";
import axios from "axios";
import vuexLocal from '../plugins/vuexPersist';
export const auth = {
  namespaced: true,
  state: {
    LOGGINED: JSON.parse(localStorage.getItem('logined')) ?? false,
    TOKEN: JSON.parse(localStorage.getItem('token')) ?? '',
    USER: JSON.parse(localStorage.getItem('user')) ?? '',
    PERMISSIONS: JSON.parse(localStorage.getItem('permissions')) ?? '',
  },
  getters: {
    user: state => state.USER
  },
  mutations: {
    //LOGIN 
    SET_TOKEN(state, value) {
      //SET SATE
      state.TOKEN = value.token;
      state.USER = value.user;
      //get permission 
      let permissions = []
        if (value.user) {
          let role = value.user.roles[0].permissions
          role.forEach(element => {
            permissions=[...permissions,element.name]
          });
        }
      state.PERMISSIONS = permissions;
      state.LOGGINED = true;
      //LOCAL STORE

      localStorage.setItem('token', JSON.stringify(state.TOKEN));
      localStorage.setItem('user', JSON.stringify(state.USER));
      localStorage.setItem('permissions', JSON.stringify(state.PERMISSIONS));
      localStorage.setItem('logined', JSON.stringify(state.LOGGINED));
      const success = "ok";
      return success;
    },
    // LOGOUT
    CLEAR_TOKEN(state) {
      //SET SATE
      state.TOKEN = null;
      state.USER = null;
      state.PERMISSIONS = null;
      state.LOGGINED = false;
      //LOCAL STORE
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      localStorage.removeItem('logined');
      localStorage.removeItem('permissions');
    }
  },
  actions: {
    // LOGIN 
    async LOGIN_SYSTEM({ commit }, payload) {
      const response = await axios.post('/login', payload).then(response => {
        // SET STATE AND LOCAL STORE
        axios.defaults.headers.common['Authorization'] = `Bearer ${response.data.token}`;
        commit('SET_TOKEN', response.data)
        return response;
      }).catch(function (error) {
        return error;
      });
      return response;
    },
    async LOGOUT_SYSTEM({ commit }) {
      const response = await axios.post('/logout').then((response) => {
        // CLEAR STATE AND LOCAL STORE
        commit('CLEAR_TOKEN');
        return response;
      }).catch(function (error) {
        return error;
      });
      return response;

    }
  },
  plugins: [vuexLocal.plugin],
};