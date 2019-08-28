/** A cleanup object into which items (Instances, Connections, etc) can be dumped and later burned.
 * @author fractality
*/
interface Dumpster {
	/**
	 * Adds `item` to the dumpster. Will be cleaned up on `Dumpster.burn`.
	 * @param item The function to call, instance to destroy, or connection to disconnect.
	 */
	dump(item: Function | Instance | RBXScriptConnection): void;

	/**
	 * Adds `item` to the dumpster. Will be cleaned up on `Dumpster.burn` by the `burner` callback.
	 * @param item The item to pass into the `burner` function.
	 * @param burner The function to call on item to clean it up.
	 */
	dump<T>(item: T, burner: (item: T) => void): void;

	/**
	 * Cleans all items.
	 */
	burn(): void;
}

declare const Dumpster: new () => Dumpster;

export = Dumpster;
