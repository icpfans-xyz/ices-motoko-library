import Result "mo:base/Result";
import Time "mo:base/Time";
module {

    public let mainnetId = "lj532-6iaaa-aaaah-qcc7a-cai";

    public type Transaction = {
        from : Text;
        to: Text;
        amount: Nat;
    };

    public type EventValue = {
        #I64 : Int64;
        #U64 : Nat64;
        #Vec : [EventValue];
        #Slice : [Nat8];
        #Text : Text;
        #True;
        #False;
        #Float : Float;
        #Principal : Principal;
        #Transaction : Transaction;
    };

    public type Indexed = {
        #Indexed;
        #Not;
    };

    public type Event = {
        time : Time.Time;
        key : Text;
        values : [(Text, EventValue, Indexed)];
        caller : Principal;
    };

    public type Self = actor {
        register : shared () -> async Result.Result<Text, Text>;
        emit : shared (event : Event) -> async Result.Result<Nat, Text>;
    };
}