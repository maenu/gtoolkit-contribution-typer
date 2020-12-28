Class {
	#name : #TypGtBrowseToTypeWithShadowShortcut,
	#superclass : #GtSourceCoderShortcut,
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtBrowseToTypeWithShadowShortcut >> description [
	^ 'Browses implementors of message/variable near cursor, filter by receiver type, to type using a shadow class.'
]

{ #category : #accessing }
TypGtBrowseToTypeWithShadowShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift s build
]

{ #category : #accessing }
TypGtBrowseToTypeWithShadowShortcut >> name [
	^ 'Browse to type by using a shadow class'
]

{ #category : #accessing }
TypGtBrowseToTypeWithShadowShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aBrTextEditor hasCursors
		ifTrue: [ aGtSourceCoder
				typGtBrowseToTypeWithShadowAt: aBrTextEditor cursors first position ]
]
