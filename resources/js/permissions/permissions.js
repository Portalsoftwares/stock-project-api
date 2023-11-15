import store from '../store';

export default {
    install: (app, options) => {
        app.config.globalProperties.can = function (value) {
            const data = store.state.auth.PERMISSIONS
            const permissions = data;
            let _return = false;
            if (!permissions) {
                return false;
            }
            if (!Array.isArray(permissions)) {
                return false;
            }
            if (value.includes('|')) {
                value.split('|').forEach(function (item) {
                    if (permissions.includes(item.trim())) {
                        _return = true;
                    }
                });
            } else if (value.includes('&')) {
                _return = true;
                value.split('&').forEach(function (item) {
                    if (!permissions.includes(item.trim())) {
                        _return = false;
                    }
                });
            } else {
                _return = permissions.includes(value.trim());
            }
            return _return;
        };
        app.config.globalProperties.is = function (value) {
            const data = store.state.auth.USER
            const roles = data.roles;
            let _return = false;
            if (!roles) {
                return false;
            }
            if (!Array.isArray(roles)) {
                return false;
            }
            if (value.includes('|')) {
                value.split('|').forEach(function (item) {
                    if (roles.includes(item.trim())) {
                        _return = true;
                    }
                });
            } else if (value.includes('&')) {
                _return = true;
                value.split('&').forEach(function (item) {
                    if (!roles.includes(item.trim())) {
                        _return = false;
                    }
                });
            } else {
                _return = roles.includes(value.trim());
            }
            return _return;
        };
    },
};

