import Debug "mo:base/Debug";
import Bool "mo:base/Bool";
import Text "mo:base/Text";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Time "mo:base/Time";

import ICES "mo:ices/ICES";
import Router "mo:ices/Router";

actor {


  let overrideId : ?Text = null;

  type Event = Router.Event;
    type Transaction = Router.Transaction;
    
    let routerId = Option.get(overrideId, Router.mainnetId);

    let ices = ICES.ICES(?routerId);
    

    // Register the current Canister to ICES Main (Router) Canister
    public shared({caller}) func register() : async Bool {
        let result = await ices.register();
        switch result {
            case(#ok(msg)) Debug.print("Register success :" # msg);
            case(#err(errmsg)) Debug.print("emit fail: " # errmsg);
        };
        true;
    };

    // common  example
    public shared({caller}) func emitEvent(eventKey : Text, subKey : Text
    , subValue : Text) : async Bool {
        // TODO Your business


        let event : Event = {
            key = eventKey;
            values = [(subKey, #Text subValue,#Indexed)];
            caller = caller;
            time = Time.now();
        };

        let result = await ices.emit(event);
        switch result {
            case(#ok(index)) Debug.print("emit success");
            case(#err(errmsg)) Debug.print("emit fail: " # errmsg);
        };
        true;
    };


    // Event transation example
    public shared({caller}) func transfer(from: Principal, to: Principal, amount : Nat) : async Bool {
        // TODO Your business

        let transaction : Transaction = {
            from = Principal.toText(from);
            to = Principal.toText(to);
            amount = amount;
        };
        
        let event : Event = {
            key = "Transaction";
            values = [("subKey", #Transaction transaction,#Indexed)];
            caller = caller;
            time = Time.now();
        };
        
        let result = await ices.emit(event);
        switch result {
            case(#ok(index)) Debug.print("emit success");
            case(#err(errmsg)) Debug.print("emit fail: " # errmsg);
        };
        true;
    };
};
