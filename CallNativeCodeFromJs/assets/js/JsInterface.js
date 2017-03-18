var JsInterface = {
 
    envs: {},
    env_id: 0,

    callAPI: function(kind, params, callback) {
        if (!kind || !callback || typeof(callback) != 'function') {
            return;
        }

        var api = JsInterface;
        api.env_id += 1;
        var env = {};
        var eid = "id" + api.env_id;
        env.callback = function(result) {
            callback(result);
            delete api.envs[eid];
        };
        env.params = params;
        api.envs[eid] = env;
        
        var location = "smakino://api/";
        var envName = "JsInterface.envs." + eid + ".";
        location += kind + "/";
        location += envName + "params/";
        location += envName + "callback/";
        
        setTimeout(function(){document.location = location;}, 10);
    },

    sample: function(message, callback) {
        var params = {};
        params.message = message;
        JsInterface.callAPI("sample", JSON.stringify(params), callback);
    },

    openUrl: function(url, callback) {
        var params = {};
        params.url = url;
        JsInterface.callAPI("open_url", JSON.stringify(params), callback);
    }
};
