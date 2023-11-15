import './bootstrap';
import { createApp } from 'vue'
import App from './App.vue'
axios.defaults.headers.common["Authorization"] = "Bearer " + JSON.parse(localStorage.getItem("token")) ?? '';
axios.defaults.baseURL = (process.env.API_PATH !== 'production') ? '/api/v1' : '';
//IMPORT STYLE
import ElementPlus from 'element-plus'
import "./dist/app.css";
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
// collapse
import { ElNotification, ElMessage, ElCollapseTransition, ElTable, ElPopover } from 'element-plus'
// fade/zoom
import VueApexCharts from "vue3-apexcharts";
//IMPORT COMPONENTS
import store from "./store/index"
//wait store from localstorage restored @vuexpersist
await store.restored
import router from "./router"
//Permissions
import { permissions } from './permissions';
import * as moment from 'moment'
const app = createApp(App)
//COMPONENTS
app.use(ElNotification)
app.use(ElMessage)
app.use(VueApexCharts)
app.use(permissions);
app.use(moment)
app.component(ElTable)
app.component(ElPopover)
//KH font in Elemt
import km from 'element-plus/dist/locale/km.mjs'
app.component(ElCollapseTransition, ElCollapseTransition.name)
app.use(ElementPlus, { locale: km, });
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}
app.use(store);
app.use(router);
app.mount('#app')
