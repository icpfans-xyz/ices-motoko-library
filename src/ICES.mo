import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Option "mo:base/Option";

import Router "Router";

module {

    public class ICES(
        overrideId    : ?Text
    ) {
        // instance ICES
        let routerId = Option.get(overrideId, Router.mainnetId);

        Debug.print("real  routerId :" # routerId);

        let router: Router.Self = actor(routerId);
        // to call ICES main
        // Register the current Canister to ICES Main (Router) Canister
        public func register() : async Bool {
            // TODO Your Project ID or Name （customize）
            let projectId = "your project id or name";
            let result = await router.register(projectId);
            switch result {
                case(#ok(msg)) Debug.print("Register success :" # msg);
                case(#err(errmsg)) Debug.print("Register fail: " # errmsg);
            };
            true;
        };


        public func login(eventValue: [Text]) : async Bool {
            let eventKey = "ICES_USER";
            // let eventValue = [param1, param2];
            let result = await router.emit(eventKey, eventValue);
            switch result {
                case(#ok(index)) Debug.print("emit success");
                case(#err(errmsg)) Debug.print("emit fail: " # errmsg);
            };
            true;
        };

        public func emit(eventKey: Text, eventValue: [Text]) : async Bool {
            let result = await router.emit(eventKey, eventValue);
            switch result {
                case(#ok(index)) Debug.print("emit success");
                case(#err(errmsg)) Debug.print("emit fail: " # errmsg);
            };
            true;
        };

    };
}