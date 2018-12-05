Class {
	#name : #TypGtMethodCoder,
	#superclass : #GtMethodCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtMethodCoder >> addOns [
	^ addOns
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> initializeShortcuts [
	super initializeShortcuts.
	addOns
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key t;
						build);
				action: [ :editorElement | self typeSelfWithPragma: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key t;
						build);
				action: [ :editorElement | self typeWithPragma: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						alt;
						key: Key t;
						build);
				action: [ :editorElement | self typeWithShadow: editorElement ])
]

{ #category : #'instance creation' }
TypGtMethodCoder >> newCompletionStrategy [
	| completionStrategy ast |
	completionStrategy := TypGtPharoCompletionStrategy new.
	completionStrategy classOrMetaClass: self classOrMetaClass.
	[ ast := GtPharoParser parseWithErrors: self patternSource.
	completionStrategy methodPattern: ast pattern ]
		on: Error
		do: [ :ex | ex return ].
	^ completionStrategy
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> rbNodeAtCursor [
	self
		cursorPositionDo: [ :e | 
			[ self rbAST bestNodeFor: (e to: e) ]
				on: Error
				do: [ :ex | ex return ] ].
	^ nil
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeSelfWithPragma: anEditorElement [
	| rbAst |
	rbAst := self rbAST ifNil: [ ^ self ].
	rbAst typGtTypeWithPragma.
	methodSource := rbAst formattedCode.
	self buildSource
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithPragma: anEditorElement [
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanTypeWithPragma
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: (node typGtTypeWithPragma);
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithShadow: anEditorElement [
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanTypeWithShadow
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: (node typGtTypeWithShadow);
				sourceElement: anEditorElement)
]
