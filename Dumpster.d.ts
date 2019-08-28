declare class Dumpster {
	/**
	 * Adds `item` to the dumpster. Will be cleaned up on `Dumpster.burn`.
	 */
	public dump(item: Function | Instance | RBXScriptConnection): void;

	/**
	 * Cleans all items
	 */
	public burn(): void;
}

export = Dumpster;
