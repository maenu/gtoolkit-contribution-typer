Class {
	#name : #TypGtMethodCoder,
	#superclass : #GtMethodCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #actions }
TypGtMethodCoder >> browseImplementors: editorElement [
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node isMessage
		ifFalse: [ ^ self ].
	editorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object:
					(TypGtCoderTypeFilter new
						type: node receiver typType;
						yourself) & (GtCoderImplementorsFilter selector: node selector);
				sourceElement: editorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> browseToTypeWithPragma: anEditorElement [
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
	addOns addStyler: TypGtDeclarationBodyStyler new.
	addOns
		addMainAction: 'Types' translated
		icon: BrGlamorousIcons inspect
		action: [ | declaration |
			declaration := addOns stylers
				anySatisfy: [ :e | e isKindOf: TypGtDeclarationBodyStyler ].
			declaration
				ifTrue: [ addOns removeStylerOfType: TypGtDeclarationBodyStyler.
					addOns addStyler: TypGtAllBodyStyler new ]
				ifFalse: [ addOns removeStylerOfType: TypGtAllBodyStyler.
					addOns addStyler: TypGtDeclarationBodyStyler new ].
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
				action: [ :editorElement | self typeWithPragma: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key t;
						build);
				action: [ :editorElement | self browseToTypeWithPragma: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key h;
						build);
				action: [ :editorElement | self typeWithShadow: editorElement ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key h;
						build);
				action: [ :editorElement | self browseToTypeWithShadow: editorElement ])
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
	self
		cursorPositionDo: [ :e | 
			[ ^ self rbAST bestNodeFor: (e to: e) ]
				on: Error
				do: [ :ex | ex return ] ].
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
	| rbAst |
	rbAst := self rbAST ifNil: [ ^ self ].
	rbAst typGtTypeWithPragma.
	methodSource := rbAst formattedCode.
	self buildSource
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithShadow: anEditorElement [
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
