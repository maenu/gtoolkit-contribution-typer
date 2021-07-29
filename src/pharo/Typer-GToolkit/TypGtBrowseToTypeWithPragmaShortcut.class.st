Class {
	#name : #TypGtBrowseToTypeWithPragmaShortcut,
	#superclass : #GtSourceCoderShortcut,
	#category : #'Typer-GToolkit-Shortcut'
}

{ #category : #accessing }
TypGtBrowseToTypeWithPragmaShortcut >> description [
	^ 'Browses implementors of message/variable near cursor, filter by receiver type, to type using method pragmas.'
]

{ #category : #accessing }
TypGtBrowseToTypeWithPragmaShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift p build
]

{ #category : #accessing }
TypGtBrowseToTypeWithPragmaShortcut >> name [
	^ 'Browse to type by using method pragmas'
]

{ #category : #accessing }
TypGtBrowseToTypeWithPragmaShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aBrTextEditor hasCursors
		ifTrue: [ aGtSourceCoder
				typGtBrowseToTypeWithPragmaAt: aBrTextEditor cursors first position ]
]
