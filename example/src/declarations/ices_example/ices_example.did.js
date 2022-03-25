export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'emitEvent' : IDL.Func([IDL.Text, IDL.Text, IDL.Text], [IDL.Bool], []),
    'register' : IDL.Func([], [IDL.Bool], []),
    'transfer' : IDL.Func(
        [IDL.Principal, IDL.Principal, IDL.Nat],
        [IDL.Bool],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
