import Result "mo:base/Result";
import Type "Types";
module {

    public let mainnetId = "lj532-6iaaa-aaaah-qcc7a-cai";

    type Event = Type.Event;

    public type Self = actor {
        register : shared () -> async Result.Result<Text, Text>;
        emit : shared (event : Event) -> async Result.Result<Nat, Text>;
    };
}