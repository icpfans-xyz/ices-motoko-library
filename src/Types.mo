import Bool "mo:base/Bool";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
module {

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

};
