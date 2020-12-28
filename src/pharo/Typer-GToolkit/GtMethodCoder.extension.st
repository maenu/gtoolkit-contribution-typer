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
						yourself) & (GtSearchImplementorsFilter selector: self selector);
				sourceElement: anElement)
]

{ #category : #'*Typer-GToolkit' }
GtMethodCoder >> typGtBrowseImplementorsAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil
		ifTrue: [ ^ self ].
	node isMethod
		ifFalse: [ ^ self ].
	self
		notifyObjectSpawn:
			(TypGtCoderTypeFilter new
				type: self classOrMetaClass typAsType;
				yourself) & (GtSearchImplementorsFilter selector: self selector)
]

{ #category : #'*Typer-GToolkit' }
GtMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns [
	<gtAstCoderAddOns: 11>
	anAddOns
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: BlKeyboardKey t;
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
