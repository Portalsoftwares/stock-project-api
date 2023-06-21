import './bootstrap';
import { createApp } from 'vue'
import App from './App.vue'
axios.defaults.headers.common["Authorization"] = "Bearer " + JSON.parse(localStorage.getItem("token")) ?? '';
axios.defaults.headers.common["Accept"] = "application/json,text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
axios.defaults.baseURL = (process.env.API_PATH !== 'production') ? 'http://127.0.0.1:8000/api/v1' : '';
//IMPORT STYLE
import ElementPlus from 'element-plus'
import "./dist/app.css";
import 'element-plus/dist/index.css'
// import 'element-plus/lib/theme-chalk/base.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
// collapse
import { ElNotification, ElMessage, ElCollapseTransition, ElTable, ElPopover } from 'element-plus'
// fade/zoom
//IMPORT COMPONENTS
import store from "./store/index"
import router from "./router"
const app = createApp(App)
//COMPONENTS
app.use(ElNotification)
app.use(ElMessage)
app.component(ElTable)
app.component(ElPopover)
import km from 'element-plus/dist/locale/km.mjs'
app.component(ElCollapseTransition, ElCollapseTransition.name)
app.use(ElementPlus, { locale: km, });
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.use(store);
app.use(router);
app.mount('#app')
