interface Destroyable {
	destroy(): void;
}

declare class Dumpster {
	/**
	 * Adds `item` to the dumpster. Will be cleaned up on `Dumpster.burn`.
	 */
	public dump(item: Function | Instance | RBXScriptConnection | Destroyable): void;

	/**
	 * Cleans all items
	 */
	public burn(): void;
}

export = Dumpster;
