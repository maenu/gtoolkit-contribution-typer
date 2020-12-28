Class {
	#name : #TypGtBrowseToTypeWithPragma,
	#superclass : #GtSourceCoderShortcut,
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtBrowseToTypeWithPragma >> description [
	^ 'Browses implementors of message/variable near cursor, filter by receiver type, to type using method pragmas.'
]

{ #category : #accessing }
TypGtBrowseToTypeWithPragma >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift p build
]

{ #category : #accessing }
TypGtBrowseToTypeWithPragma >> name [
	^ 'Browse to type by using method pragmas'
]

{ #category : #accessing }
TypGtBrowseToTypeWithPragma >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aBrTextEditor hasCursors
		ifTrue: [ aGtSourceCoder
				typGtBrowseToTypeWithPragmaAt: aBrTextEditor cursors first position ]
]
