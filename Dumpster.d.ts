interface Burnable {
	burn(): void;
}

interface Destroyable {
	destroy(): void;
}

/** A cleanup object into which items (Instances, Connections, etc) can be dumped and later burned.
 * @author fractality
 */
interface Dumpster extends Burnable, Destroyable {
	/**
	 * Adds `item` to the dumpster. Will be cleaned up on `Dumpster.burn`.
	 * @param item The function to call, instance to destroy, or connection to disconnect.
	 */
	dump(item: Function | Instance | RBXScriptConnection | Burnable | Destroyable): this;

	/**
	 * Adds `item` to the dumpster. Will be cleaned up on `Dumpster.burn` by the `burner` callback.
	 * @param item The item to pass into the `burner` function.
	 * @param burner The function to call on item to clean it up.
	 */
	dump<T>(item: T, burner: (item: T) => void): this;

	/**
	 * Cleans all items.
	 */
	burn(): void;

	/**
	 * Cleans all items.
	 * @alias destroy
	 */
	destroy(): void;
}

declare const Dumpster: new () => Dumpster;

export = Dumpster;
