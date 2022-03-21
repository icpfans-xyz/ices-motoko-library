import Bool "mo:base/Bool";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
module {

    public type Transfer = {
        from : Principal;
        to: Principal;
        amount: Nat64;
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
        #Transfer : Transfer;
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
