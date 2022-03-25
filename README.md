![](https://www.ices.one/logo.svg)

# The ICES (Internet Computer Event System) Motoko Library

Event log storage and analysis service on the Internet Computer

> ICES (Internet Computer Event System) is a canister custom event log storage and analysis service on Dfinity. It mainly solves the problem that canister's interaction records cannot be publicly queried. Any canister can access ICES without permission, store the interactive data permanently, and query it through the public API and dashboard provided by ICES.

## IC Mainnet demo
* Demo https://opxi6-diaaa-aaaah-abhrq-cai.raw.ic0.app
* Explorer [https://explorer.ices.one](https://explorer.ices.one)


## Guides and Documentation

To start using the ICES Motoko Library to integrate ICES into your Motoko-based Canister, visit our documentation or the examples folder in this repository.

- [ICES Motoko Library Documentation](https://doc.ices.one/)
- [ICES Motoko Library Examples](https://github.com/icpfans-xyz/ices/tree/main/example/motoko)

# IC Mainnet demo
* Demo https://opxi6-diaaa-aaaah-abhrq-cai.raw.ic0.app
* Explorer [https://explorer.ices.one](https://explorer.ices.one)


## Requirements

  - [DFX cli](https://smartcontracts.org/docs/quickstart/local-quickstart.html)
  - [Vessel Motoko package manager](https://github.com/dfinity/vessel) 

## Getting started

You're required to have [Vessel Motoko package manager](https://github.com/dfinity/vessel) binary installed and configured in your operating system.

Here's a quick breakdown, but use the original documentation for latest details:

- You understand the basics of `dfx cli`, otherwise take the time to learn [dfx getting started](https://smartcontracts.org/docs/quickstart/local-quickstart.html)

- Download a copy of the [Vessel binary](https://github.com/dfinity/vessel/releases) from the [release page](https://github.com/dfinity/vessel/releases) or build one yourself

- Add the [Vessel binary](https://github.com/dfinity/vessel/releases) location to your [PATH](https://en.wikipedia.org/wiki/PATH_(variable)) (e.g. for macOS one of the quickest ways to achieve this would be to symlink the binary in the /usr/local/bin directory which is included in [PATH](https://en.wikipedia.org/wiki/PATH_(variable)) by default)

- Run [Vessel](https://github.com/dfinity/vessel/releases) init in your project root.

  ```sh
  vessel init
  ```

- Edit `package-set.dhall` to include the [ICES Motoko Library](https://github.com/icpfans-xyz/ices-motoko-library) as described in [add the library to a project](#add-the-library-to-a-project).

- Include the `vessel sources` command in the `build > packtool` of your `dfx.json`

  ```sh
  ...
  "defaults": {
    "build": {
      "packtool": "vessel sources"
    }
  }
  ...
  ```

- From then on, you can simply run the [dfx build command](https://smartcontracts.org/docs/developers-guide/cli-reference/dfx-build.html) or [dfx deploy](https://smartcontracts.org/docs/developers-guide/cli-reference/dfx-deploy.html)

  ```sh
  dfx build
  ```
  
  ```sh
  dfx deploy <canister>
  ```

## Add the library to a project

After you have initialised [Vessel](https://github.com/dfinity/vessel), edit the `package-set.dhall` and include the [ICES Motoko library](https://github.com/icpfans-xyz/ices-motoko-library) and the version, as available in the releases of [ICES Motoko Library](https://github.com/icpfans-xyz/ices-motoko-library).

In the example below of our `package-set.dhall`, we are using `v0.1.0`:

```sh
let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let
  additions =
      [
            { dependencies = [] : List Text
            , name = "base"
            , repo = "https://github.com/dfinity/motoko-base.git"
            , version = "494824a2787aee24ab4a5888aa519deb05ecfd60"
            },
            { name = "ices"
            , repo = "https://github.com/icpfans-xyz/ices-motoko-library"
            , version = "v0.1.0"
            , dependencies = [] : List Text
            }
      ] : List Package

in  additions
```
Make sure you also add the library as a dependency to your `vessel.dhall` file like this:
```sh
{
  dependencies = [ "base", "ices" ],
  compiler = Some "0.6.2"
}
```
We've assumed that you have followed `Vessel` initialisation e.g. the init and the `dfx.json`. 

Here's a breakdown of a project initialised by the [dfx cli](https://smartcontracts.org/docs/developers-guide/cli-reference.html):

1) Create a new Motoko project called `ICES-motoko-example` (it's a random name that we selected for our example, you can name it whatever you want)

  ```sh
  dfx new ices-motoko-example
  ```

2) Initialise Vessel

  ```sh
  vessel init
  ```

3) Add the ICES Motoko library to `package-set.dhall`, as described in [Add the library to a project](#add-the-library-to-a-project)

4) Edit `dfx.json` and set `vessel sources` in the `defaults > build > packtool`

  ```sh
  {
    "canisters": {
      "ices-motoko-example": {
        "main": "src/ices-motoko-example/main.mo",
        "type": "motoko"
      }
    },
    "defaults": {
      "build": {
        "args": "",
        "packtool": "vessel sources"
      }
    },
    "networks": {
      "local": {
        "bind": "127.0.0.1:8000",
        "type": "ephemeral"
      }
    },
    "version": 1
  }
  ```





## 🔗 Links

* Website **[https://ices.one/](https://ices.one/)**
* Twitter **[https://twitter.com/icesHQ](https://twitter.com/icesHQ)**
* Code **[https://github.com/icpfans-xyz/ices](https://github.com/icpfans-xyz/ices)**
