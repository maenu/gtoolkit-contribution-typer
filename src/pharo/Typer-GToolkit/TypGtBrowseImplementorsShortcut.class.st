Class {
	#name : 'TypGtBrowseImplementorsShortcut',
	#superclass : 'GtSourceCoderShortcut',
	#category : 'Typer-GToolkit-Shortcut'
}

{ #category : 'accessing' }
TypGtBrowseImplementorsShortcut >> description [
	^ 'Browses implementors of message near cursor, filter by receiver type.'
]

{ #category : 'accessing' }
TypGtBrowseImplementorsShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift m build
]

{ #category : 'accessing' }
TypGtBrowseImplementorsShortcut >> name [
	^ 'Browse implementors (typed)'
]

{ #category : 'accessing' }
TypGtBrowseImplementorsShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aBrTextEditor hasCursors
		ifTrue: [ aGtSourceCoder
				typGtBrowseImplementorsAt: aBrTextEditor cursors first position ]
]
