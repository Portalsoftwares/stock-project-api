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
                meta: {
                    permission: 'user-view',
                    title: 'user',
                },
            },
            {
                name: "student",
                component: import('./../pages/student'),
                path: "/student",
                meta: {
                    permission: 'student-view',
                    title: 'student',
                },
            },
            {
                name: "teacher",
                component: import('./../pages/teacher'),
                path: "/teacher",
                meta: {
                    permission: 'teacher-view',
                    title: 'teacher',
                },
            },
            {
                name: "subject",
                component: import('./../pages/subject'),
                path: "/subject",
                meta: {
                    permission: 'subject-view',
                    title: 'subject',
                },
            },
            {

                name: "class",
                component: import('./../pages/class'),
                path: "/class",
                exact: false,
                meta: {
                    permission: 'class-view',
                    title: 'class',
                },
            },
            {

                name: "class.detail",
                component: import('./../pages/class/class-detail'),
                path: "/class-detail",

            },
            {

                name: "score-type",
                component: import('./../pages/score-type'),
                path: "/score-type",
                meta: {
                    permission: 'exam-view',
                    title: 'exam',
                },

            },
            {

                name: "time",
                component: import('./../pages/time'),
                path: "/time",
                meta: {
                    permission: 'time-view',
                    title: 'time',
                },

            },
            {

                name: "academic",
                component: import('./../pages/academic'),
                path: "/academic",
                meta: {
                    permission: 'academic-view',
                    title: 'academic',
                },

            },
            {

                name: "reports",
                component: import('./../pages/report'),
                path: "/reports",
                meta: {
                    permission: 'report-view',
                    title: 'report',
                },

            },
            {

                name: "setting",
                component: import('./../pages/setting'),
                path: "/setting",
                meta: {
                    permission: 'preference-view',
                    title: 'preference',
                },

            }
        ]
    },
    {
        name: "Login",
        component: import('./../pages/auth/login'),
        path: "/login",
    },
    // Not Found page
    {
        name: 'not found',
        path: '/:pathMatch(.*)*',
        component: import('./../pages/notfound'), // page('error/PageNotFound')
        meta: {
            title: '404 Not Found',
        },
    },
    {

        name: "no-permission",
        component: import('./../pages/nopermission'),
        path: "/no-permission",
        meta: {
            title: 'no permission',
        },

    }
]