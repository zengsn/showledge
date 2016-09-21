//javascript 模块化
var subscribeJS = {
    //封装相关ajax的url
    URL: {
        addFocusUser: function(path) {
            return path + '/user/addFocusUser';
        },
        removeFocusUser: function(path) {
            return path + '/user/removeFocusUser';
        },
        addFocusCorpus: function(path) {
            return path + '/user/addFocusCorpus';
        },
        removeFocusCorpus: function(path) {
            return path + '/user/removeFocusCorpus';
        }
    },

    //添加用户关注
    addFocusAtUsers: function(focusUserId, path) {
        $.post(subscribeJS.URL.addFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users").attr("class", "btn btn-small follow following");
                $("#focus_at_users_a").attr("onclick", "subscribeJS.removeFocusAtUsers(" + focusUserId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i").attr("class", "fa fa-check");
                $("#focus_at_users_ul").attr("class", "btn btn-small btn-list");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //取消用户关注
    removeFocusAtUsers: function(focusUserId, path) {
        $.post(subscribeJS.URL.removeFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users").attr("class", "btn btn-small btn-success follow");
                $("#focus_at_users_a").attr("onclick", "subscribeJS.addFocusAtUsers(" + focusUserId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i").attr("class", "fa fa-plus");
                $("#focus_at_users_ul").attr("class", "btn btn-small btn-list btn-success");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //在用户列表上点击添加关注
    addFocusAtUsersLi: function(index, focusUserId, path) {
        $.post(subscribeJS.URL.addFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users_" + index).attr("class", "btn btn-small follow following");
                $("#focus_at_users_a_" + index).attr("onclick", "subscribeJS.removeFocusAtUsersLi(" + index + "," + focusUserId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i_" + index).attr("class", "fa fa-check");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //在用户列表上点击取消关注
    removeFocusAtUsersLi: function(index, focusUserId, path) {
        $.post(subscribeJS.URL.removeFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users_" + index).attr("class", "btn btn-small btn-success follow");
                $("#focus_at_users_a_" + index).attr("onclick", "subscribeJS.addFocusAtUsersLi(" + index + "," + focusUserId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i_" + index).attr("class", "fa fa-plus");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //在用户所创建文集页面上添加用户关注
    addFocusAtUsersCorpus: function(focusUserId, path) {
        $.post(subscribeJS.URL.addFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users").attr("class", "btn btn-small follow following");
                $("#focus_at_users_a").attr("onclick", "subscribeJS.removeFocusAtUsersCorpus(" + focusUserId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i").attr("class", "fa fa-fw fa-check");
                $("#focus_at_users_ul").attr("class", "btn btn-small notebook-share");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //在用户所创建文集页面上取消用户关注
    removeFocusAtUsersCorpus: function(focusUserId, path) {
        $.post(subscribeJS.URL.removeFocusUser(path), {
            "focusUserId": focusUserId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users").attr("class", "btn btn-small btn-success follow");
                $("#focus_at_users_a").attr("onclick", "subscribeJS.addFocusAtUsersCorpus(" + focusUserId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i").attr("class", "fa fa-plus");
                $("#focus_at_users_ul").attr("class", "btn btn-small btn-success notebook-share");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //添加文集关注
    addFocusCorpusAtUserCorpus: function(corpusId, path) {
        $.post(subscribeJS.URL.addFocusCorpus(path), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users").attr("class", "btn btn-small follow following");
                $("#focus_at_users_a").attr("onclick", "subscribeJS.removeFocusCorpusAtUserCorpus(" + corpusId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i").attr("class", "fa fa-fw fa-check");
                $("#focus_at_users_ul").attr("class", "btn btn-small notebook-share");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //取消文集关注
    removeFocusCorpusAtUserCorpus: function(corpusId, path) {
        $.post(subscribeJS.URL.removeFocusCorpus(path), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_users").attr("class", "btn btn-small btn-success follow");
                $("#focus_at_users_a").attr("onclick", "subscribeJS.addFocusCorpusAtUserCorpus(" + corpusId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_users_i").attr("class", "fa fa-plus");
                $("#focus_at_users_ul").attr("class", "btn btn-small btn-success notebook-share");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //在用户所关注的文集列表上点击进行关注
    addFocusCorpusAtUserCorpusLi: function(index, corpusId, path) {
        $.post(subscribeJS.URL.addFocusCorpus(path), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_corpus_" + index).attr("class", "btn follow following");
                $("#focus_at_corpus_a_" + index).attr("onclick", "subscribeJS.removeFocusCorpusAtUserCorpusLi(" + index + "," + corpusId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_corpus_i_" + index).attr("class", "fa fa-fw fa-check");
            } else {
                location.href = path + "/login";
            }
        })
    },

    //在用户所关注的文集列表上点击取消关注
    removeFocusCorpusAtUserCorpusLi: function(index, corpusId, path) {
        $.post(subscribeJS.URL.removeFocusCorpus(path), {
            "corpusId": corpusId
        },
        function(result) {
            if (result && result['success']) {
                $("#focus_at_corpus_" + index).attr("class", "btn btn-success follow");
                $("#focus_at_corpus_a_" + index).attr("onclick", "subscribeJS.addFocusCorpusAtUserCorpusLi(" + index + "," + corpusId + "," + '\'' + path + '\'' + ");");
                $("#focus_at_corpus_i_" + index).attr("class", "fa fa-fw fa-plus");
            } else {
                location.href = path + "/login";
            }
        })
    }
}