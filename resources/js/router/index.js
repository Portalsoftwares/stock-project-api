import { createRouter, createWebHistory } from "vue-router";
import routes from "./routes";
import store from "../store/index";

const router = Router();
export default router;

function Router() {
    const router = new createRouter({
        history: createWebHistory(),
        routes,
    });
    return router;
}
router.beforeEach(async (to, from) => {

    const MenuData = [
        {
            path: "/dashboard",
            name: "ដាសបត"
        },
        {
            path: "/user",
            name: "អ្នកប្រើប្រាស់"
        },
        {
            path: "/teacher",
            name: "គ្រូបង្រៀន"
        },
        {
            path: "/student",
            name: "សិស្សានុសិស្ស"
        },
        {
            path: "/subject",
            name: "មុខវិជ្ជា"
        },
        {
            path: "/class",
            name: "ថ្នាក់រៀន"
        },
        {
            path: "/class-detail",
            name: "ថ្នាក់រៀន លំអិត"
        },
        {
            path: "/score-type",
            name: "ប្រភេទពិន្ទុ"
        },
        {
            path: "/time",
            name: "ម៉ោងសិក្សា"
        },
        {
            path: "/academic",
            name: "ឆ្នាំសិក្សា"
        },
        {
            path: "/reports",
            name: "របាយការណ៍"
        },
        {
            path: "/setting",
            name: "ការកំណត់"
        }

    ]
    console.log(to)
    let menuActive = MenuData.filter((row) => row.path == to.path);
    if (menuActive != null) {
        store.commit('menu/getMenu', menuActive[0]);
    }
    // make sure the user is authenticated
    const isAuthenticated = JSON.parse(localStorage.getItem('logined')) ?? false;
    // ❗️ Avoid an infinite redirect
    if (!isAuthenticated && to.name !== 'Login') {
        // redirect the user to the login page
        return { name: 'Login' }
    }
    if (isAuthenticated && to.name == 'Login') {
        return { name: 'Master' }
    }



})