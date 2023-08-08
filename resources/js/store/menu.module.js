export const menu = {
  namespaced: true,
  state: {
    sideBarVisible: false,
    activeMenu: {}
  },
  getters: {
    activeMenu: state => state.activeMenu,
  },
  mutations: {
    getMenu(state, val) {
      state.activeMenu = val;
    }
  }
};
