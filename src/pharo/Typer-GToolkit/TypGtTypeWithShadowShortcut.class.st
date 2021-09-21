Class {
	#name : 'TypGtTypeWithShadowShortcut',
	#superclass : 'GtSourceCoderShortcut',
	#category : 'Typer-GToolkit-Shortcut'
}

{ #category : 'accessing' }
TypGtTypeWithShadowShortcut >> description [
	^ 'Browses implementors of message/variable near cursor, filter by receiver type, to type using a shadow class.'
]

{ #category : 'accessing' }
TypGtTypeWithShadowShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift s build
]

{ #category : 'accessing' }
TypGtTypeWithShadowShortcut >> name [
	^ 'Browse to type by using a shadow class'
]

{ #category : 'accessing' }
TypGtTypeWithShadowShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aBrTextEditor hasCursors
		ifTrue: [ aGtSourceCoder
				typGtTypeWithShadowAt: aBrTextEditor cursors first position ]
]
