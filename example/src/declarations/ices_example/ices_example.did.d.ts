import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'emitEvent' : (arg_0: string, arg_1: string, arg_2: string) => Promise<
      boolean
    >,
  'register' : () => Promise<boolean>,
  'transfer' : (arg_0: Principal, arg_1: Principal, arg_2: bigint) => Promise<
      boolean
    >,
}
