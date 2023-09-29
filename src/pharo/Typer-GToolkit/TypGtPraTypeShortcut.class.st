Class {
	#name : #TypGtPraTypeShortcut,
	#superclass : #GtSourceCoderShortcut,
	#category : #'Typer-GToolkit-Shortcut'
}

{ #category : #accessing }
TypGtPraTypeShortcut >> description [
	^ 'Types the method with pragmas.'
]

{ #category : #accessing }
TypGtPraTypeShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift alt p build
]

{ #category : #accessing }
TypGtPraTypeShortcut >> name [
	^ 'Type with pragmas'
]

{ #category : #accessing }
TypGtPraTypeShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aGtSourceCoder typGtPraType
]
