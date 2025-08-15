module capability::capability {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// Capability struct
    public struct WorkshopCapability has key, store {
        id: UID
    }

    fun init(ctx: &mut TxContext) {
        transfer::transfer(WorkshopCapability {
            id: object::new(ctx)
        }, ctx.sender())
    }
}