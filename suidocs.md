========================
CODE SNIPPETS
========================
TITLE: Organizing Move Project Directory Structure
DESCRIPTION: Demonstrates the recommended directory structure for a Move project, showing the separation of source files, tests, and examples. Examples are placed in a separate directory to avoid inclusion in package bytecode while still being testable.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/open-sourcing-libraries.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
sources/
    protocol.move
    library.move
tests/
    protocol_test.move
examples/
    my_example.move
Move.toml
```

----------------------------------------

TITLE: Checking Sui Client Version - Bash
DESCRIPTION: Verify that the Sui client is installed correctly by running the `--version` command. This command should output the installed client version.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_0

LANGUAGE: bash
CODE:
```
# It should print the client version. E.g. sui-client 1.22.0-036299745.
sui client --version
```

----------------------------------------

TITLE: Installing Sui using Chocolatey on Windows
DESCRIPTION: This command installs Sui using the Chocolatey package manager on Windows systems. It provides a straightforward installation method for Windows users.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/before-we-begin/install-sui.md#2025-04-22_snippet_1

LANGUAGE: bash
CODE:
```
choco install sui
```

----------------------------------------

TITLE: Constraint Verification Examples
DESCRIPTION: Examples showing how constraints are checked at instantiation sites for structs.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/generics.md#2025-04-22_snippet_14

LANGUAGE: move
CODE:
```
public struct Foo<T: copy> { x: T }

public struct Bar { x: Foo<u8> }
//                         ^^ valid, u8 has `copy`

public struct Baz<T> { x: Foo<T> }
//                            ^ ERROR! T does not have 'copy'
```

----------------------------------------

TITLE: Installing Sui using Cargo on MacOS and Linux
DESCRIPTION: This command installs and builds Sui locally using the Cargo package manager. It requires Rust to be installed on the system. The command targets the mainnet branch of the Sui repository.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/before-we-begin/install-sui.md#2025-04-22_snippet_2

LANGUAGE: bash
CODE:
```
cargo install --git https://github.com/MystenLabs/sui.git sui --branch mainnet
```

----------------------------------------

TITLE: Defining Method Aliases in Move 2024
DESCRIPTION: Shows examples of defining method aliases in Move 2024 using the `use fun ... as ...` syntax. Includes examples for both local aliases (foreign types) and exported aliases (types defined in the same module).

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/2024-migration-guide.md#_snippet_10

LANGUAGE: Move
CODE:
```
// my_module.move
// Local: type is foreign to the module
use fun my_custom_function as vector.do_magic;
```

LANGUAGE: Move
CODE:
```
// sui-framework/kiosk/kiosk.move
// Exported: type is defined in the same module
public use fun kiosk_owner_cap_for as KioskOwnerCap.kiosk;
```

----------------------------------------

TITLE: Installing Sui using Homebrew on MacOS
DESCRIPTION: This command installs Sui using the Homebrew package manager on MacOS systems. It's a simple one-line installation method for MacOS users.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/before-we-begin/install-sui.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
brew install sui
```

----------------------------------------

TITLE: Defining Valid Module Names in Move
DESCRIPTION: Shows examples of valid module names in Move. Module names can start with a lowercase or uppercase letter and can contain underscores and numbers after the first character.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/modules.md#2025-04-22_snippet_3

LANGUAGE: move
CODE:
```
module a::my_module {}
module a::foo_bar_42 {}
```

----------------------------------------

TITLE: Basic Method Call Examples
DESCRIPTION: Shows practical examples of method calls in Move, including value access and mutable borrowing operations.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/method-syntax.md#2025-04-22_snippet_1

LANGUAGE: move
CODE:
```
coin.value();
*nums.borrow_mut(i) = 5;
```

----------------------------------------

TITLE: Move Lock Package Section Example
DESCRIPTION: Example of package sections in Move.lock file showing how dependencies are recorded with their sources.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/packages.md#2025-04-22_snippet_12

LANGUAGE: ini
CODE:
```
[[move.package]]
name = "A"
source = { git = "https://github.com/b/c.git", subdir = "e/f", rev = "a1b2c3" }

[[move.package]]
name = "B"
source = { local = "../local-dep" }
```

----------------------------------------

TITLE: Expected Failure Test Examples in Move
DESCRIPTION: Demonstrates various ways to use the #[expected_failure] annotation with test functions, including simple aborts and error conditions.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/unit-testing.md#2025-04-22_snippet_1

LANGUAGE: move
CODE:
```
#[test]
#[expected_failure]
public fun this_test_will_abort_and_pass() { abort 1 }

#[test]
#[expected_failure]
public fun test_will_error_and_pass() { 1/0; }

#[test] // Will pass since test fails with the expected abort code constant.
#[expected_failure(abort_code = ENotFound)] // ENotFound is a constant defined in the module
public fun test_will_error_and_pass_abort_code() { abort ENotFound }

#[test] // Will fail since test fails with a different error than expected.
#[expected_failure(abort_code = my_module::ENotFound)]
public fun test_will_error_and_fail() { 1/0; }

#[test, expected_failure] // Can have multiple in one attribute. This test will pass.
public fun this_other_test_will_abort_and_pass() { abort 1 }
```

----------------------------------------

TITLE: Getting Epoch Start Timestamp in Sui Move
DESCRIPTION: This snippet shows how to obtain the Unix timestamp (in milliseconds) corresponding to the start of the current epoch. This information is also available via the transaction context.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/programmability/epoch-and-time.md#_snippet_1

LANGUAGE: Move
CODE:
```
fun get_epoch_start_time(ctx: &tx_context::TxContext): u64 {
    tx_context::epoch_start_timestamp_ms(ctx)
}
```

----------------------------------------

TITLE: Example Sui Package Address
DESCRIPTION: An example object ID (address) for a published Sui package, typically found in the transaction output. This address is required to interact with the package.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_12

LANGUAGE: plaintext
CODE:
```
0x468daa33dfcb3e17162bbc8928f6ec73744bb08d838d1b6eb94eac99269b29fe
```

----------------------------------------

TITLE: Example Output of Sui Account Objects Query (Plaintext)
DESCRIPTION: This snippet shows an example of the output returned by the `sui client objects` command. It displays details for one or more objects owned by the account, including the object ID, version, digest, and object type, confirming the presence and type of the expected object (e.g., `todo_list::TodoList`).

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_22

LANGUAGE: plaintext
CODE:
```
╭  ...                                                                                  ╮
│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
│ │ objectId   │  0x20e0bede16de8a728ab25e228816b9059b45ebea49c8ad384e044580b2d3e553  │ │
│ │ version    │  22                                                                  │ │
│ │ digest     │  /DUEiCLkaNSgzpZSq2vSV0auQQEQhyH9occq9grMBZM=                        │ │
│ │ objectType │  0x468d..29fe::todo_list::TodoList                                   │ │
│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
|  ...                                                                                  |
```

----------------------------------------

TITLE: Defining a Macro in Move 2024
DESCRIPTION: Illustrates how to define a macro in Move 2024 using the `macro fun` syntax. Shows an example of a simple `for` loop macro.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/2024-migration-guide.md#_snippet_11

LANGUAGE: Move
CODE:
```
// can be called as for!(0, 10, |i| call(i));
macro fun for($start: u64, $stop: u64, $body: |u64|) {
    let mut i = $start;
    let stop = $stop;
    while (i < stop) {
        $body(i);
        i = i + 1
    }
}
```

----------------------------------------

TITLE: Dev Address Configuration Example
DESCRIPTION: Example of package manifest showing how to configure named addresses for development mode using dev-addresses section.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/packages.md#2025-04-22_snippet_9

LANGUAGE: ini
CODE:
```
[package]
name = "example_pkg"
...
[addresses]
named_addr = "_"

[dev-addresses]
named_addr = "0xC0FFEE"
```

----------------------------------------

TITLE: Example of While Loop in Move
DESCRIPTION: Refers to an external example demonstrating a simple `while` loop in Move with a basic condition.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/control-flow.md#_snippet_4

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/control-flow.move:while_loop}}
```

----------------------------------------

TITLE: Creating a New Move Package
DESCRIPTION: Creates a new Move package named 'test_example' and changes the current directory to it.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/unit-testing.md#2025-04-22_snippet_8

LANGUAGE: bash
CODE:
```
$ sui move new test_example; cd test_example
```

----------------------------------------

TITLE: Publishing Sui Package with JSON Output (Bash)
DESCRIPTION: Provides a bash command example for publishing a Sui package and receiving the transaction output in JSON format, useful for programmatic processing.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_11

LANGUAGE: bash
CODE:
```
$ sui client publish --gas-budget 100000000 --json
```

----------------------------------------

TITLE: Accessing Methods on Built-in Types (Move)
DESCRIPTION: Provides examples of using new associated methods available on built-in Move types in the 2024 edition, such as converting vectors to strings or addresses to bytes.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/2024-migration-guide.md#_snippet_7

LANGUAGE: Move
CODE:
```
fun aliases() {
    // vector to string and ascii string
    let str: String = b"Hello, World!".to_string();
    let ascii: ascii::String = b"Hello, World!".to_ascii_string();

    // address to bytes
    let bytes = @0xa11ce.to_bytes();
}
```

----------------------------------------

TITLE: Module Alias Usage Example
DESCRIPTION: Example showing how to create and use module aliases with vector and option types.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/uses.md#2025-04-22_snippet_1

LANGUAGE: move
CODE:
```
use std::vector;
use std::option as o;

fun new_vec(): vector<o::Option<u8>> {
    let mut v = vector[];
    vector::push_back(&mut v, o::some(0));
    vector::push_back(&mut v, o::none());
    v
}
```

----------------------------------------

TITLE: Method Usage Example
DESCRIPTION: Demonstrates valid and invalid method calls based on function parameter order.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/method-syntax.md#2025-04-22_snippet_3

LANGUAGE: move
CODE:
```
fun example(x: a::m::X) {
    x.foo(); // valid
    // x.bar(true); ERROR!
}
```

----------------------------------------

TITLE: Using Vector Borrowing Operator in Move
DESCRIPTION: Demonstrates how to use the `[]` borrowing operator with a `vector` in Move. Shows examples of getting immutable references (`&`), mutable references (`&mut`), and copying the element value.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/2024-migration-guide.md#_snippet_8

LANGUAGE: Move
CODE:
```
fun play_vec() {
    let v = vector[1,2,3,4];
    let first = &v[0];         // calls vector::borrow(v, 0)
    let first_mut = &mut v[0]; // calls vector::borrow_mut(v, 0)
    let first_copy = v[0];     // calls *vector::borrow(v, 0)
}
```

----------------------------------------

TITLE: Function Constraint Examples
DESCRIPTION: Examples demonstrating constraint checking in function definitions and calls.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/generics.md#2025-04-22_snippet_15

LANGUAGE: move
CODE:
```
fun unsafe_consume<T>(x: T) {
    // ERROR! x does not have 'drop'
}

fun consume<T: drop>(x: T) {
    // valid, x will be dropped automatically
}

public struct NoAbilities {}

fun foo() {
    let r = NoAbilities {};
    consume<NoAbilities>(NoAbilities);
    //      ^^^^^^^^^^^ ERROR! NoAbilities does not have 'drop'
}
```

----------------------------------------

TITLE: Method Alias Usage Example
DESCRIPTION: Shows how to create and use method aliases with the use fun syntax.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/method-syntax.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
module b::example;

use fun a::cup::cup_borrow as Cup.borrow;
use fun a::cup::cup_value as Cup.value;
use fun a::cup::cup_swap as Cup.set;

fun example(c: &mut Cup<u64>) {
    let _ = c.borrow(); // resolves to a::cup::cup_borrow
    let v = c.value(); // resolves to a::cup::cup_value
    c.set(v * 2); // resolves to a::cup::cup_swap
}
```

----------------------------------------

TITLE: Running Sui Move Test Help Command
DESCRIPTION: Displays help information for the 'sui move test' command, showing available options and their descriptions.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/unit-testing.md#2025-04-22_snippet_7

LANGUAGE: bash
CODE:
```
$ sui move test --help
```

----------------------------------------

TITLE: Directory Structure Example for Move Book Samples
DESCRIPTION: Demonstrates the expected directory structure for storing Move code samples, showing how samples directory mirrors the src directory hierarchy

SOURCE: https://github.com/mystenlabs/move-book/blob/main/packages/samples/sources/README.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
samples/
    basic-syntax/
        address.move
```

----------------------------------------

TITLE: Macro Usage Examples with Map
DESCRIPTION: Examples showing how to use the map macro with different lambda expressions and type annotations.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions/macros.md#2025-04-22_snippet_3

LANGUAGE: move
CODE:
```
let v = vector[1, 2, 3];
let doubled: vector<u64> = map!(v, |x| 2 * x);
let bytes: vector<vector<u8>> = map!(v, |x| std::bcs::to_bytes(&x));
```

----------------------------------------

TITLE: Member Alias Usage Example
DESCRIPTION: Example demonstrating how to use member aliases for functions.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/uses.md#2025-04-22_snippet_3

LANGUAGE: move
CODE:
```
use std::vector::push_back;
use std::option::some as s;

fun new_vec(): vector<std::option::Option<u8>> {
    let mut v = vector[];
    vector::push_back(&mut v, s(0));
    vector::push_back(&mut v, std::option::none());
    v
}
```

----------------------------------------

TITLE: Illustrating Move Ownership and References in Functions (Move)
DESCRIPTION: This snippet provides examples of Move functions demonstrating how values are handled based on how they are passed: `take` shows moving a value by ownership, `borrow` shows immutable borrowing using a reference, and `borrow_mut` shows mutable borrowing using a mutable reference. These examples highlight the core concepts of Move's ownership and borrowing system.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/storage/storage-functions.md#_snippet_0

LANGUAGE: Move
CODE:
```
/// Moved by value
public fun take<T>(value: T) { /* value is moved here! */ abort 0 }

/// For immutable reference
public fun borrow<T>(value: &T) { /* value is borrowed here! can be read */ abort 0 }

/// For mutable reference
public fun borrow_mut<T>(value: &mut T) { /* value is mutably borrowed here! */ abort 0 }
```

----------------------------------------

TITLE: Basic Test Function Declaration in Move
DESCRIPTION: Examples of correct and incorrect test function declarations using the #[test] annotation. Shows that test functions must have no parameters.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/unit-testing.md#2025-04-22_snippet_0

LANGUAGE: move
CODE:
```
#[test] // OK
fun this_is_a_test() { ... }

#[test] // Will fail to compile since the test takes an argument
fun this_is_not_correct(arg: u64) { ... }
```

----------------------------------------

TITLE: Copy Ability Constraint Examples
DESCRIPTION: Examples showing constraint checking with the copy ability.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/generics.md#2025-04-22_snippet_16

LANGUAGE: move
CODE:
```
fun unsafe_double<T>(x: T) {
    (copy x, x)
    // ERROR! T does not have 'copy'
}

fun double<T: copy>(x: T) {
    (copy x, x) // valid, T has 'copy'
}

public struct NoAbilities {}

fun foo(): (NoAbilities, NoAbilities) {
    let r = NoAbilities {};
    double<NoAbilities>(r)
    //     ^ ERROR! NoAbilities does not have 'copy'
}
```

----------------------------------------

TITLE: Installing mdbook via Cargo
DESCRIPTION: Command to install mdbook using Cargo, the Rust package manager. This is a prerequisite for working with the Move book.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/README.md#2025-04-22_snippet_0

LANGUAGE: shell
CODE:
```
cargo install mdbook
```

----------------------------------------

TITLE: Constant Naming Examples
DESCRIPTION: Examples of valid constant names following Move naming conventions.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/constants.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
const FLAG: bool = false;
const EMyErrorCode: u64 = 0;
const ADDRESS_42: address = @0x42;
```

----------------------------------------

TITLE: Example Transaction Effects Output
DESCRIPTION: This snippet shows a sample output of transaction effects, detailing the transaction's status, created and mutated objects, gas usage summary, and dependencies.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_7

LANGUAGE: plaintext
CODE:
```
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: GpcDV6JjjGQMRwHpEz582qsd5MpCYgSwrDAq1JXcpFjW                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 411                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x160f7856e13b27e5a025112f361370f4efc2c2659cb0023f1e99a8a84d1652f3                         │
│  │ Owner: Account Address ( 0x091ef55506ad814920adcef32045f9078f2f6e9a72f4cf253a1e6274157380a1 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 8y6bhwvQrGJHDckUZmj2HDAjfkyVqHohhvY1Fvzyj7ec                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x468daa33dfcb3e17162bbc8928f6ec73744bb08d838d1b6eb94eac99269b29fe                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: Ein91NF2hc3qC4XYoMUFMfin9U23xQmDAdEMSHLae7MK                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x4ea1303e4f5e2f65fc3709bc0fb70a3035fdd2d53dbcff33e026a50a742ce0de                         │
│  │ Owner: Account Address ( 0x091ef55506ad814920adcef32045f9078f2f6e9a72f4cf253a1e6274157380a1 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 7ydahjaM47Gyb33PB4qnW2ZAGqZvDuWScV6sWPiv7LTc                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x4ea1303e4f5e2f65fc3709bc0fb70a3035fdd2d53dbcff33e026a50a742ce0de                         │
│  │ Owner: Account Address ( 0x091ef55506ad814920adcef32045f9078f2f6e9a72f4cf253a1e6274157380a1 )  │
│  │ Version: 8                                                                                     │
│  │ Digest: 7ydahjaM47Gyb33PB4qnW2ZAGqZvDuWScV6sWPiv7LTc                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 10404400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    7Ukrc5GqdFqTA41wvWgreCdHn2vRLfgQ3YMFkdks72Vk                                                   │
│    7d4amuHGhjtYKujEs9YkJARzNEn4mRbWWv3fn4cdKdyh                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

----------------------------------------

TITLE: Constant References Example
DESCRIPTION: Example showing how constants can reference other constants within the same module.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/constants.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
const BASE: u8 = 4;
const SQUARE: u8 = BASE * BASE;
```

----------------------------------------

TITLE: Function Parameters and Return Types in Move
DESCRIPTION: Examples of Move functions with various parameter and return type configurations.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions.md#2025-04-22_snippet_6

LANGUAGE: move
CODE:
```
fun add(x: u64, y: u64): u64 { x + y }

fun useless() { }

fun zero(): u64 { 0 }

fun one_two_three(): (u64, u64, u64) { (0, 1, 2) }

fun just_unit(): () { () }
fun just_unit() { () }
fun just_unit() { }
```

----------------------------------------

TITLE: Named Address Module Example in Move
DESCRIPTION: Example showing how to reference renamed named addresses in a Move module, demonstrating access to address after renaming in package dependencies.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/packages.md#2025-04-22_snippet_7

LANGUAGE: move
CODE:
```
module N::A {
    public fun x(): address { @P1N }
}
```

----------------------------------------

TITLE: Nested Import Example
DESCRIPTION: Example of using nested imports to bring multiple names into scope.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/uses.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
use std::{
    vector::{Self as vec, push_back},
    string::{String, Self as str}
};

fun example(s: &mut String) {
    let mut v = vec::empty();
    push_back(&mut v, 0);
    push_back(&mut v, 10);
    str::append_utf8(s, v);
}
```

----------------------------------------

TITLE: Example: Variable Shadowing (Move)
DESCRIPTION: Provides an example of shadowing a variable by redeclaring it with the same name using `let` in Move.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/primitive-types.md#_snippet_3

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/primitive-types.move:shadowing}}
```

----------------------------------------

TITLE: Example Usage of Option in Move (Creation/Operations)
DESCRIPTION: This placeholder indicates an example Move code snippet demonstrating how to create `Option` values using `option::some` and `option::none`, and potentially other operations available for `Option` types.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/option.md#_snippet_2

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/option.move:usage}}
```

----------------------------------------

TITLE: Simple Constant Value Examples
DESCRIPTION: Examples of constants with simple value assignments for different primitive types.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/constants.md#2025-04-22_snippet_3

LANGUAGE: move
CODE:
```
const MY_BOOL: bool = false;
const MY_ADDRESS: address = @0x70DD;
const BYTES: vector<u8> = b"hello world";
const HEX_BYTES: vector<u8> = x"DEADBEEF"
```

----------------------------------------

TITLE: Basic Constant Usage Example
DESCRIPTION: Example showing how to declare and use a constant in a Move module with a permission check.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/constants.md#2025-04-22_snippet_1

LANGUAGE: move
CODE:
```
module a::example;

const MY_ADDRESS: address = @a;

public fun permissioned(addr: address) {
    assert!(addr == MY_ADDRESS, 0);
}
```

----------------------------------------

TITLE: Getting Type Names using std::type_name in Move
DESCRIPTION: This snippet demonstrates how to use the `std::type_name::get<T>()` function to obtain the runtime type name for different types in Move. It shows examples for a primitive type (`u64`) and a custom struct (`MyStruct`), printing the resulting type names using `std::debug::print`.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/type-reflection.md#_snippet_0

LANGUAGE: Move
CODE:
```
module 0x1::type_reflection_example {
    use std::debug;
    use std::type_name;

    struct MyStruct {}

    public entry fun main() {
        let u64_type = type_name::get<u64>();
        debug::print(&u64_type);

        let struct_type = type_name::get<MyStruct>();
        debug::print(&struct_type);
    }
}
```

----------------------------------------

TITLE: Module Naming Convention in Move
DESCRIPTION: Demonstrates proper module naming using snake_case with descriptive but concise names.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/coding-conventions.md#2025-04-22_snippet_0

LANGUAGE: move
CODE:
```
module book::conventions { /* ... */ }
module book::common_practices { /* ... */ }
```

----------------------------------------

TITLE: Running Move Books Locally with mdBook in Bash
DESCRIPTION: Commands to serve the Move Book and Move Language Reference locally using mdBook. These commands start local servers for both books, making them accessible at http://localhost:3000.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/README.md#2025-04-22_snippet_0

LANGUAGE: bash
CODE:
```
$ mdbook serve book
$ mdbook serve reference
```

----------------------------------------

TITLE: Example of If Condition in Move
DESCRIPTION: Refers to an external example demonstrating how an `if` expression works in Move, likely showing a simple conditional execution.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/control-flow.md#_snippet_1

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/control-flow.move:if_condition}}
```

----------------------------------------

TITLE: Compiling Move Package (Sui CLI)
DESCRIPTION: Demonstrates how to compile a Move package using the `sui move build` command. It shows the basic command run from the package directory and an alternative using the `--path` flag when run from outside the directory. Compilation creates a `build` folder containing compiled bytecode and dependencies.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_8

LANGUAGE: bash
CODE:
```
# run from the `hello_world` folder
$ sui move build

# alternatively, if you didn't `cd` into it
$ sui move build --path hello_world
```

----------------------------------------

TITLE: Pattern Examples in Move
DESCRIPTION: Illustrates various pattern types including literals, constants, variables, wildcards, constructors, at-patterns, or-patterns, and multi-arity wildcards.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/control-flow/pattern-matching.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
// literal pattern
1

// constant pattern
MyConstant

// variable pattern
x

// wildcard pattern
_

// constructor pattern that matches `MyEnum::Variant` with the fields `1` and `true`
MyEnum::Variant(1, true)

// constructor pattern that matches `MyEnum::Variant` with the fields `1` and binds the second field's value to `x`
MyEnum::Variant(1, x)

// multi-arity wildcard pattern that matches multiple fields within the `MyEnum::Variant` variant
MyEnum::Variant(..)

// constructor pattern that matches the `x` field of `MyStruct` and binds the `y` field to `other_variable`
MyStruct { x, y: other_variable }

// at-pattern that matches `MyEnum::Variant` and binds the entire value to `x`
x @ MyEnum::Variant(..)

// or-pattern that matches either `MyEnum::Variant` or `MyEnum::OtherVariant`
MyEnum::Variant(..) | MyEnum::OtherVariant(..)

// same as the above or-pattern, but with explicit wildcards
MyEnum::Variant(_, _) | MyEnum::OtherVariant(_, _)

// or-pattern that matches either `MyEnum::Variant` or `MyEnum::OtherVariant` and binds the u64 field to `x`
MyEnum::Variant(x, _) | MyEnum::OtherVariant(_, x)

// constructor pattern that matches `OtherEnum::V` and if the inner `MyEnum` is `MyEnum::Variant`
OtherEnum::V(MyEnum::Variant(..))
```

----------------------------------------

TITLE: Demonstrating Address Substitution in Move
DESCRIPTION: Illustrates how named addresses are substituted with their numerical values during compilation. This example shows the equivalence of using named and numerical addresses.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/modules.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
fun example() {
    my_addr::m::foo(@my_addr);
}
```

LANGUAGE: move
CODE:
```
fun example() {
    0xC0FFEE::m::foo(@0xC0FFEE);
}
```

----------------------------------------

TITLE: Running Move Unit Tests (Sui CLI)
DESCRIPTION: Shows the basic command `sui move test` to execute unit tests defined within a Move package. This command compiles the package in test mode, discovers functions marked with `#[test]`, and runs them, reporting the results.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_10

LANGUAGE: bash
CODE:
```
$ sui move test
```

----------------------------------------

TITLE: Invalid Reference to Reference Example in Move
DESCRIPTION: Demonstrates that Move does not allow references to references, showing an example that will not compile.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/primitive-types/references.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
let x = 7;
let y: &u64 = &x;
let z: &&u64 = &y; // ERROR! will not compile
```

----------------------------------------

TITLE: Sui Client Publish Command Output (Bash)
DESCRIPTION: The output of the `sui client publish` command shows the steps taken, including dependency updates, building, on-chain verification, and the final transaction digest.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_5

LANGUAGE: bash
CODE:
```
$ sui client publish --gas-budget 100000000
UPDATING GIT DEPENDENCY https://github.com/MystenLabs/sui.git
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY DeepBook
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING todo_list
Successfully verified dependencies on-chain against source.
Transaction Digest: GpcDV6JjjGQMRwHpEz582qsd5MpCYgSwrDAq1JXcpFjW
```

----------------------------------------

TITLE: Setting Environment Variables for Sui Transaction
DESCRIPTION: Sets environment variables for the package ID and the active Sui client address. These variables are used later in transaction commands. Replace the example PACKAGE_ID with your published package's address.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_13

LANGUAGE: bash
CODE:
```
export PACKAGE_ID=0x468daa33dfcb3e17162bbc8928f6ec73744bb08d838d1b6eb94eac99269b29fe
export MY_ADDRESS=$(sui client active-address)
```

----------------------------------------

TITLE: Updating Rust to the latest stable version
DESCRIPTION: This command updates the Rust compiler to the latest stable version. It's recommended to ensure the system has the most recent Rust version before installing Sui.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/before-we-begin/install-sui.md#2025-04-22_snippet_3

LANGUAGE: bash
CODE:
```
rustup update stable
```

----------------------------------------

TITLE: Running Filtered Move Tests (Sui CLI)
DESCRIPTION: Illustrates how to run a subset of Move unit tests using the `sui move test` command by providing a filter string. Only tests whose names contain the specified string (e.g., "test_hello") will be executed.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_12

LANGUAGE: bash
CODE:
```
$ sui move test test_hello
```

----------------------------------------

TITLE: Example of If-Else for Assignment in Move
DESCRIPTION: Refers to an external example showing how `if` and `else` are used to assign a value to a variable, emphasizing the requirement for both branches to return a value of the same type.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/control-flow.md#_snippet_2

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/control-flow.move:if_else}}
```

----------------------------------------

TITLE: Requesting Coins with Sui Client CLI (Bash)
DESCRIPTION: Use the `sui client faucet` command to request test coins for your account in devnet or testnet environments. The output confirms the request and advises checking balance later.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_1

LANGUAGE: bash
CODE:
```
$ sui client faucet
Request successful. It can take up to 1 minute to get the coin. Run sui client gas to check your gas coins.
```

----------------------------------------

TITLE: More Invalid Ability Declarations
DESCRIPTION: Additional examples showing invalid ability declarations for key and store abilities.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/abilities.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
public struct NoAbilities {}

public struct MyData has key {
    f: NoAbilities, // Error 'NoAbilities' does not have 'store'
}

public struct MyDataEnum has store {
    Variant1,
    Variant2(NoAbilities), // Error 'NoAbilities' does not have 'store'
}
```

----------------------------------------

TITLE: Function Definition with Method Support
DESCRIPTION: Example showing how functions in a type's defining module can be called as methods when the type is the first argument.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/method-syntax.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
module a::m;

public struct X() has copy, drop, store;
public fun foo(x: &X) { ... }
public fun bar(flag: bool, x: &X) { ... }
```

----------------------------------------

TITLE: Move Toolchain Version Section
DESCRIPTION: Example of toolchain version section in Move.lock file containing compiler version, edition, and flavor information.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/packages.md#2025-04-22_snippet_13

LANGUAGE: ini
CODE:
```
[move.toolchain-version]
compiler-version = <string> # The version of the Move compiler used to build the package, e.g. "1.21.0"
edition = <string> # The edition of the Move language used to build the package, e.g. "2024.alpha"
flavor = <string> # The flavor of the Move compiler used to build the package, e.g. "sui"
```

----------------------------------------

TITLE: Listing New Package Contents - Bash
DESCRIPTION: After creating a new package, use the `ls -l` command to list the contents of the newly created directory. This shows the default `Move.toml`, `sources`, and `tests` entries.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_2

LANGUAGE: bash
CODE:
```
$ ls -l hello_world
Move.toml
sources
tests
```

----------------------------------------

TITLE: Exhaustive Pattern Matching Examples in Move
DESCRIPTION: Demonstrates how to make pattern matching exhaustive in Move by adding wildcard patterns or fully matching on remaining values. The examples show corrections to the previously non-exhaustive matches.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/control-flow/pattern-matching.md#2025-04-22_snippet_12

LANGUAGE: move
CODE:
```
fun f(x: MyEnum): u8 {
    match (x) {
        MyEnum::Variant(1, true) => 1,
        MyEnum::Variant(_, _) => 1,
        MyEnum::OtherVariant(_, 3) => 2,
        // Now exhaustive since this will match all values of MyEnum::OtherVariant
        MyEnum::OtherVariant(..) => 2,

    }
}

fun match_pair_bool(x: Pair<bool>): u8 {
    match (x) {
        Pair(true, true) => 1,
        Pair(true, false) => 1,
        Pair(false, false) => 1,
        // Now exhaustive since this will match all values of Pair<bool>
        Pair(false, true) => 1,
    }
}
```

----------------------------------------

TITLE: Option Handling Macro Usage Examples in Move
DESCRIPTION: Demonstrates practical uses of the Option handling macros. Examples include conditionally printing Option values, checking for specific values, and transforming the type of the contained value.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions/macros.md#2025-04-22_snippet_17

LANGUAGE: move
CODE:
```
fun examples(opt: Option<u64>) {
    // print the value if it exists
    inspect!(&opt, |x| std::debug::print(x));

    // check if the value is 0
    let is_zero = is_some_and!(&opt, |x| *x == 0);

    // upcast the u64 to a u256
    let str_opt = map!(opt, |x| x as u256);
}
```

----------------------------------------

TITLE: Module-Level Use Declaration
DESCRIPTION: Example showing use declarations inside a module context.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/uses.md#2025-04-22_snippet_6

LANGUAGE: move
CODE:
```
module a::example;

use std::vector;

fun new_vec(): vector<Option<u8>> {
    let mut v = vector[];
    vector::push_back(&mut v, 0);
    vector::push_back(&mut v, 10);
    v
}

use std::option::{Option, some, none};
```

----------------------------------------

TITLE: Running Move Tests with Path (Sui CLI)
DESCRIPTION: Demonstrates running Move unit tests using the `sui move test` command with the `--path` flag. This is useful when executing the command from a directory outside the Move package root, specifying the location of the package to test.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_11

LANGUAGE: bash
CODE:
```
$ sui move test --path hello_world
```

----------------------------------------

TITLE: Vector Move Semantics Example
DESCRIPTION: Example showing how move semantics work with vectors to prevent accidental copies.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/primitive-types/vector.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
let x = vector[10];
let y = move x;
let z = x; // ERROR! x has been moved
(y, z)
```

----------------------------------------

TITLE: Example: Variable Declaration and Assignment (Move)
DESCRIPTION: Demonstrates practical usage of `let` and `let mut` keywords for declaring and initializing variables in Move.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/primitive-types.md#_snippet_1

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/primitive-types.move:variables_and_assignment}}
```

----------------------------------------

TITLE: Expression Block Use Declaration
DESCRIPTION: Example demonstrating use declarations within expression blocks.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/uses.md#2025-04-22_snippet_7

LANGUAGE: move
CODE:
```
module a::example;

fun new_vec(): vector<Option<u8>> {
    use std::vector::push_back;
    use std::option::{Option, some, none};

    let mut v = vector[];
    push_back(&mut v, some(0));
    push_back(&mut v, none());
    v
}
```

----------------------------------------

TITLE: Example Usage of Option in Move (Registry)
DESCRIPTION: This placeholder indicates an example Move code snippet demonstrating the use of the `Option` type, likely within a registry or data structure context, such as representing an optional field like a middle name.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/option.md#_snippet_1

LANGUAGE: Move
CODE:
```
{{#include ../../../packages/samples/sources/move-basics/option.move:registry}}
```

----------------------------------------

TITLE: Default Test Module Template - Move
DESCRIPTION: The `tests/` directory contains Move tests. The default test file includes a commented-out template for a test module, demonstrating the use of `#[test_only]`, `#[test]`, `#[expected_failure]`, and constants.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_6

LANGUAGE: move
CODE:
```
/*
#[test_only]
module hello_world::hello_world_tests;
// uncomment this line to import the module
// use hello_world::hello_world;

const ENotImplemented: u64 = 0;

#[test]
fun test_hello_world() {
    // pass
}

#[test, expected_failure(abort_code = hello_world::hello_world_tests::ENotImplemented)]
fun test_hello_world_fail() {
    abort ENotImplemented
}
*/
```

----------------------------------------

TITLE: Module Abort Example
DESCRIPTION: Demonstrates how abort codes are handled at the module level and propagated through function calls.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/abort-and-assert.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
module 0x2::example {
    public fun aborts() {
        abort 42
    }
}

module 0x3::invoker {
    public fun always_aborts() {
        0x2::example::aborts()
    }
}
```

----------------------------------------

TITLE: Invalid Ability Declaration Examples
DESCRIPTION: Examples demonstrating invalid ability declarations where struct fields don't satisfy ability requirements.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/abilities.md#2025-04-22_snippet_1

LANGUAGE: move
CODE:
```
public struct NoAbilities {}

public struct WantsCopy has copy {
    f: NoAbilities, // ERROR 'NoAbilities' does not have 'copy'
}

public enum WantsCopyEnum has copy {
    Variant1
    Variant2(NoAbilities), // ERROR 'NoAbilities' does not have 'copy'
}
```

----------------------------------------

TITLE: Abort Type Examples
DESCRIPTION: Demonstrates how abort expressions can take on any type in the type system.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/abort-and-assert.md#2025-04-22_snippet_7

LANGUAGE: move
CODE:
```
let y: address = abort 0;

let b =
    if (x == 0) false
    else if (x == 1) true
    else abort 42;
```

----------------------------------------

TITLE: Example Transaction Command Sequence
DESCRIPTION: This pseudo-code snippet illustrates the structure of a transaction by showing a sequence of commands. It demonstrates splitting a coin for payment, calling a Move function, and transferring an object.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/concepts/what-is-a-transaction.md#_snippet_0

LANGUAGE: Pseudo-code
CODE:
```
Inputs:
- sender = 0xa11ce

Commands:
- payment = SplitCoins(Gas, [ 1000 ])
- item = MoveCall(0xAAA::market::purchase, [ payment ])
- TransferObjects(item, sender)
```

----------------------------------------

TITLE: Publishing Move Package with Sui Client CLI (Bash)
DESCRIPTION: Publish a Move package to the Sui network using `sui client publish`. This command automatically builds the package and publishes it in a single transaction, requiring a gas budget specified in MISTs.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_4

LANGUAGE: bash
CODE:
```
# run this from the `todo_list` folder
$ sui client publish --gas-budget 100000000

# alternatively, you can specify path to the package
$ sui client publish --gas-budget 100000000 todo_list
```

----------------------------------------

TITLE: Running Move Tests with Statistics
DESCRIPTION: Executes Move tests and displays statistics including runtime and gas usage for each test using the '-s' or '--statistics' option.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/unit-testing.md#2025-04-22_snippet_13

LANGUAGE: bash
CODE:
```
$ sui move test -s
```

----------------------------------------

TITLE: Vector Iteration Macro Usage Examples in Move
DESCRIPTION: Demonstrates practical uses of the vector iteration macros. Examples include printing elements, finding maximums, computing sums, and transforming vector contents using both immutable and mutable approaches.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions/macros.md#2025-04-22_snippet_15

LANGUAGE: move
CODE:
```
fun imm_examples(v: &vector<u64>) {
    // print all elements
    for_imm!(v, |x| std::debug::print(x));

    // sum all elements
    let mut sum = 0;
    for_imm!(v, |x| sum = sum + x);

    // find the max element
    let mut max = 0;
    for_imm!(v, |x| if (x > max) max = x);
}

fun mut_examples(v: &mut vector<u64>) {
    // increment each element
    for_mut!(v, |x| *x = *x + 1);

    // set each element to the previous value, and the first to last value
    let mut prev = v[v.length() - 1];
    for_mut!(v, |x| {
        let tmp = *x;
        *x = prev;
        prev = tmp;
    });

    // set the max element to 0
    let mut max = &mut 0;
    for_mut!(v, |x| if (*x > *max) max = x);
    *max = 0;
}
```

----------------------------------------

TITLE: Viewing Package Directory Structure - Plaintext
DESCRIPTION: This plaintext snippet illustrates the default directory structure created by the `sui move new` command. It shows the root directory, `Move.toml`, `sources/` with a default `.move` file, and `tests/` with a default test file.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_3

LANGUAGE: plaintext
CODE:
```
hello_world
├── Move.toml
├── sources
│   └── hello_world.move
└── tests
    └── hello_world_tests.move
```

----------------------------------------

TITLE: CopyBox Macro Implementation
DESCRIPTION: Example demonstrating type constraints in macro functions using a CopyBox struct.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions/macros.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
public struct NoAbilities()
public struct CopyBox<T: copy> has copy, drop { value: T }
macro fun make_box<$T>($x: $T): CopyBox<$T> {
    CopyBox { value: $x }
}
```

----------------------------------------

TITLE: Non-Exhaustive Pattern Matching Examples in Move
DESCRIPTION: Illustrates non-exhaustive pattern matching in Move, showing cases where the compiler will raise an error due to incomplete matching. Examples include matching on enums and structs.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/control-flow/pattern-matching.md#2025-04-22_snippet_11

LANGUAGE: move
CODE:
```
public enum MyEnum {
    Variant(u64, bool),
    OtherVariant(bool, u64),
}

public struct Pair<T>(T, T)

fun f(x: MyEnum): u8 {
    match (x) {
        MyEnum::Variant(1, true) => 1,
        MyEnum::Variant(_, _) => 1,
        MyEnum::OtherVariant(_, 3) => 2,
        // ERROR: not exhaustive as the value `MyEnum::OtherVariant(_, 4)` is not matched.
    }
}

fun match_pair_bool(x: Pair<bool>): u8 {
    match (x) {
        Pair(true, true) => 1,
        Pair(true, false) => 1,
        Pair(false, false) => 1,
        // ERROR: not exhaustive as the value `Pair(false, true)` is not matched.
    }
}
```

----------------------------------------

TITLE: Method Syntax with Move Macros
DESCRIPTION: Demonstrates how macros can be called using method syntax and explains the difference in argument evaluation order. The example uses a 'maybe_s' macro to show this behavior.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions/macros.md#2025-04-22_snippet_11

LANGUAGE: move
CODE:
```
public struct S() has copy, drop;
public fun foo(): S { abort 0 }
public macro fun maybe_s($s: S, $cond: bool): S {
    if ($cond) $s
    else S()
}
```

LANGUAGE: move
CODE:
```
maybe_s!(foo(), false) // does not abort
```

LANGUAGE: move
CODE:
```
foo().maybe_s!(false) // aborts
```

----------------------------------------

TITLE: Invalid Recursive Struct Examples
DESCRIPTION: Examples of invalid recursive struct definitions that are not allowed in Move.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/generics.md#2025-04-22_snippet_17

LANGUAGE: move
CODE:
```
public struct Foo<T> {
    x: Foo<u64> // ERROR! 'Foo' containing 'Foo'
}

public struct Bar<T> {
    x: Bar<T> // ERROR! 'Bar' containing 'Bar'
}

// ERROR! 'A' and 'B' forming a cycle, which is not allowed either.
public struct A<T> {
    x: B<T, u64>
}

public struct B<T1, T2> {
    x: A<T1>
    y: A<T2>
}
```

----------------------------------------

TITLE: Importing Specific Members in Move
DESCRIPTION: This example demonstrates how to import specific members from a module using the 'use' keyword.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/move-basics/importing-modules.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
module package::example {
    use sui::object::UID;
    use sui::tx_context::TxContext;

    struct Example has key {
        id: UID
    }

    public fun new(ctx: &mut TxContext): Example {
        Example { id: sui::object::new(ctx) }
    }
}
```

----------------------------------------

TITLE: Declaring a Basic Move Function
DESCRIPTION: Example of a simple Move function declaration with type parameters and a return value.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/functions.md#2025-04-22_snippet_0

LANGUAGE: move
CODE:
```
fun foo<T1, T2>(x: u64, y: T1, z: T2): (T2, T1, u64) { (z, y, x) }
```

----------------------------------------

TITLE: Function Naming Convention in Move
DESCRIPTION: Illustrates function naming using snake_case with descriptive names.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/guides/coding-conventions.md#2025-04-22_snippet_2

LANGUAGE: move
CODE:
```
public fun add(a: u64, b: u64): u64 { a + b }
public fun create_if_not_exists() { /* ... */ }
```

----------------------------------------

TITLE: Running Move Unit Tests
DESCRIPTION: Executes the Move unit tests in the current package using the 'sui move test' command.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/unit-testing.md#2025-04-22_snippet_10

LANGUAGE: bash
CODE:
```
$ sui move test
```

----------------------------------------

TITLE: Creating New Move Package - Bash
DESCRIPTION: Use the `sui move new` command followed by the desired package name to create a new Move package. This command scaffolds the basic directory structure and initial files.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-world.md#_snippet_1

LANGUAGE: bash
CODE:
```
$ sui move new hello_world
```

----------------------------------------

TITLE: Nested Loop Control Flow Example in Move
DESCRIPTION: Example showing how to use labeled loops for complex control flow in nested loops with multiple conditions.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/control-flow/labeled-control-flow.md#2025-04-22_snippet_1

LANGUAGE: move
CODE:
```
let x = 'outer: loop {
    ...
    'inner: while (cond) {
        ...
        if (cond0) { break 'outer value };
        ...
        if (cond1) { continue 'inner }
        else if (cond2) { continue 'outer }
        ...
    }
        ...
};
```

----------------------------------------

TITLE: Dependencies using Inline TOML Style (TOML)
DESCRIPTION: Provides an example of defining multiple dependencies within the `[dependencies]` section using the compact inline table format supported by TOML.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/concepts/manifest.md#_snippet_3

LANGUAGE: toml
CODE:
```
# Inline style
[dependencies]
Example = { override = true, git = "https://github.com/example/example.git", subdir = "crates/sui-framework/packages/sui-framework", rev = "framework/testnet" }
MyPackage = { local = "../my-package" }
```

----------------------------------------

TITLE: Querying Owned Objects with Sui Client CLI (Bash)
DESCRIPTION: Alternatively, use `sui client objects` to list all objects owned by your account. The output includes details like object ID, version, digest, and type for each object.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/book/src/your-first-move/hello-sui.md#_snippet_3

LANGUAGE: bash
CODE:
```
$ sui client objects
╭───────────────────────────────────────────────────────────────────────────────────────╮
│ ╭────────────┬──────────────────────────────────────────────────────────────────────╮ │
│ │ objectId   │  0x4ea1303e4f5e2f65fc3709bc0fb70a3035fdd2d53dbcff33e026a50a742ce0de  │ │
│ │ version    │  4                                                                   │ │
│ │ digest     │  nA68oa8gab/CdIRw+240wze8u0P+sRe4vcisbENcR4U=                        │ │
│ │ objectType │  0x0000..0002::coin::Coin                                            │ │
│ ╰────────────┴──────────────────────────────────────────────────────────────────────╯ │
╰───────────────────────────────────────────────────────────────────────────────────────╯
```

----------------------------------------

TITLE: Invalid Label Usage Examples in Move
DESCRIPTION: Examples showing incorrect usage of labeled control flow, demonstrating restrictions on break, continue, and return statements.

SOURCE: https://github.com/mystenlabs/move-book/blob/main/reference/src/control-flow/labeled-control-flow.md#2025-04-22_snippet_5

LANGUAGE: move
CODE:
```
fun bad_loop() {
    'name: loop {
        return 'name 5
            // ^^^^^ Invalid usage of 'return' with a loop block label
    }
}

fun bad_block() {
    'name: {
        continue 'name;
              // ^^^^^ Invalid usage of 'break' with a loop block label
        break 'name;
           // ^^^^^ Invalid usage of 'break' with a loop block label
    }
}
