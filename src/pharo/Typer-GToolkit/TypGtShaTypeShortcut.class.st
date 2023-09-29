Class {
	#name : #TypGtShaTypeShortcut,
	#superclass : #GtSourceCoderShortcut,
	#category : #'Typer-GToolkit-Shortcut'
}

{ #category : #accessing }
TypGtShaTypeShortcut >> description [
	^ 'Browses implementors of message/variable near cursor, filter by receiver type, to type using a shadow class.'
]

{ #category : #accessing }
TypGtShaTypeShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift s build
]

{ #category : #accessing }
TypGtShaTypeShortcut >> name [
	^ 'Browse to type by using a shadow class'
]

{ #category : #accessing }
TypGtShaTypeShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aBrTextEditor hasCursors
		ifTrue: [ aGtSourceCoder
				typGtShaTypeWithAt: aBrTextEditor cursors first position ]
]
