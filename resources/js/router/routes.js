export default [
    {
        name: "Master",
        component: import('./../pages/layout/master.vue'),
        path: "/",
        redirect: '/dashboard',
        children: [
            {
                name: "Dashboard",
                component: import('./../pages/dashboard'),
                path: "/dashboard",
            },
            {
                name: "User",
                component: import('./../pages/user'),
                path: "/user",
            },
            {
                name: "student",
                component: import('./../pages/student'),
                path: "/student",
            },
            {
                name: "teacher",
                component: import('./../pages/teacher'),
                path: "/teacher",
            },
            {
                name: "subject",
                component: import('./../pages/subject'),
                path: "/subject",
            },
            {

                name: "class",
                component: import('./../pages/class'),
                path: "/class",
                exact: false,
            },
            {

                name: "class.detail",
                component: import('./../pages/class/class-detail'),
                path: "/class-detail",

            },
            {

                name: "reports",
                component: import('./../pages/report'),
                path: "/reports",

            }
        ]
    },
    {
        name: "Login",
        component: import('./../pages/auth/login'),
        path: "/login",
    },
    // {

    //     name: "preview",
    //     component: import('./../pages/preview'),
    //     path: "/preview",
    //     props: true,
    // }
]