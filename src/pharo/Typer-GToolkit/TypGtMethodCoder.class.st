Class {
	#name : #TypGtMethodCoder,
	#superclass : #GtMethodCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #actions }
TypGtMethodCoder >> browseImplementors: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node isMessage
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object:
					(TypGtCoderTypeFilter new
						type: node receiver typType;
						yourself) & (GtCoderImplementorsFilter selector: node selector);
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> browseToTypeWithPragma: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: node typGtFiltersToTypeWithPragma;
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> browseToTypeWithShadow: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: node typGtFiltersToTypeWithShadow;
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> initializeAddOns [
	super initializeAddOns.
	addOns addStyler: TypGtTypeDeclarationBodyStyler new.
	addOns addStyler: TypGtCheckBodyStyler new.
	addOns
		addMainAction: 'Types' translated
		icon: BrGlamorousIcons inspect
		action: [ | declaration |
			declaration := addOns stylers anySatisfy: [ :e | e isKindOf: TypGtTypeDeclarationBodyStyler ].
			declaration
				ifTrue: [ addOns removeStylerOfType: TypGtTypeDeclarationBodyStyler.
					addOns addStyler: TypGtTypeValueBodyStyler new ]
				ifFalse: [ addOns removeStylerOfType: TypGtTypeValueBodyStyler.
					addOns addStyler: TypGtTypeDeclarationBodyStyler new ].
			self refreshForChanges ]
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
				action: [ :e | self typeWithPragma: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key t;
						build);
				action: [ :e | self browseToTypeWithPragma: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key h;
						build);
				action: [ :e | self typeWithShadow: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key h;
						build);
				action: [ :e | self browseToTypeWithShadow: e ])
]

{ #category : #'instance creation' }
TypGtMethodCoder >> newCompletionStrategy [
	| completionStrategy |
	completionStrategy := TypGtPharoCompletionStrategy new.
	completionStrategy classOrMetaClass: self classOrMetaClass.
	^ completionStrategy
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> rbNodeAtCursor [
	<typTypeResultAs: '!RBProgramNode'>
	self
		cursorPositionDo: [ :e | 
			[ ^ self rbAST bestNodeFor: (e to: e) ]
				on: Error
				do: [ :f | f return ] ].
	^ nil
]

{ #category : #actions }
TypGtMethodCoder >> save [
	^ super save
		ifTrue: [ self updateMethod: self compiledMethod ]
		ifFalse: [ false ]
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithPragma: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| rbAst |
	rbAst := self rbAST ifNil: [ ^ self ].
	rbAst typGtTypeWithPragma.
	methodSource := rbAst formattedCode.
	self buildSource
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithShadow: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: node typGtFiltersToTypeWithShadow;
				sourceElement: anEditorElement)
]
