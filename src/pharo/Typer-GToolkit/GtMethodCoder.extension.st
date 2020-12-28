Extension { #name : #GtMethodCoder }

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
	anAddOns addShortcut: TypGtTypeWithPragmaShortcut new
]

{ #category : #'*Typer-GToolkit' }
GtMethodCoder >> typGtTypeWithPragma [
	self
		sourceCode:
			(self rbAST
				typGtTypeWithPragma;
				formattedCode)
]
