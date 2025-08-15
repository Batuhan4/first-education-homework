module primitive_types::primitive_types {
    use std::string::{Self, String};

    // Constants for better maintainability
    const DEFAULT_NAME: vector<u8> = b"BuilderMare";
    const DEFAULT_AGE: u8 = 25;
    const LESSON_MOVE: vector<u8> = b"Move";
    const LESSON_RUST: vector<u8> = b"Rust";

    /// A struct to hold developer information
    public struct Developer has key, store {
        id: UID,
        name: String,
        age: u8,
        is_coder: bool,
        lessons: vector<String>
    }

    /// An entry function to create a new Developer object and transfer it.
    public entry fun create_developer(ctx: &mut TxContext) {
        let name = string::utf8(DEFAULT_NAME);
        let age = DEFAULT_AGE;
        let is_coder = true;
        let mut lessons = vector::empty<String>();
        vector::push_back(&mut lessons, string::utf8(LESSON_MOVE));
        vector::push_back(&mut lessons, string::utf8(LESSON_RUST));

        let developer = Developer {
            id: object::new(ctx),
            name: name,
            age: age,
            is_coder: is_coder,
            lessons: lessons
        };

        transfer::transfer(developer, ctx.sender());
    }
}