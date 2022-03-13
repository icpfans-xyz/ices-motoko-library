import Result "mo:base/Result";
module {

    public let mainnetId = "lj532-6iaaa-aaaah-qcc7a-cai";

    public type Self = actor {
        register : shared () -> async Result.Result<Text, Text>;
        emit : shared (eventKey: Text, eventValue: [Text]) -> async Result.Result<Nat, Text>;
    };
}