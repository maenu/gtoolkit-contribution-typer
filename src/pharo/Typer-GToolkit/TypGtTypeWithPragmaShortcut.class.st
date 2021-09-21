Class {
	#name : 'TypGtTypeWithPragmaShortcut',
	#superclass : 'GtSourceCoderShortcut',
	#category : 'Typer-GToolkit-Shortcut'
}

{ #category : 'accessing' }
TypGtTypeWithPragmaShortcut >> description [
	^ 'Types the method with pragmas.'
]

{ #category : 'accessing' }
TypGtTypeWithPragmaShortcut >> initialize [
	super initialize.
	combination := BlKeyCombination builder primary shift alt p build
]

{ #category : 'accessing' }
TypGtTypeWithPragmaShortcut >> name [
	^ 'Type with pragmas'
]

{ #category : 'accessing' }
TypGtTypeWithPragmaShortcut >> performOnEditor: aBrTextEditor element: aBrEditorElement coder: aGtSourceCoder dueTo: aShortcutEvent [
	aGtSourceCoder typGtTypeWithPragma
]
