Extension { #name : #GtMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtMethodCoder >> typGtBrowseImplementors: anElement [
	| node |
	super typGtBrowseImplementors: anElement.
	node := self typGtRbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node isMethod
		ifFalse: [ ^ self ].
	anElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object:
					(TypGtCoderTypeFilter new
						type: self classOrMetaClass typAsType;
						yourself) & (GtCoderImplementorsFilter selector: self selector);
				sourceElement: anElement)
]

{ #category : #'*Typer-GToolkit' }
GtMethodCoder >> typGtInitializeAddOnsFor: anAst [
	<gtAstCoderAddOns: 10>
	super typGtInitializeAddOnsFor: anAst.
	addOns
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key t;
						build);
				action: [ self typGtTypeWithPragma ])
]

{ #category : #'*Typer-GToolkit' }
GtMethodCoder >> typGtTypeWithPragma [
	methodSource := self rbAST
		typGtTypeWithPragma;
		formattedCode.
	self buildSource
]
