Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtBrowseImplementorsAt: anInteger [
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
GtPharoMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns [
	<gtAstCoderAddOns: 11>
	anAddOns addShortcut: TypGtTypeWithPragmaShortcut new
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtTypeWithPragma [
	self
		sourceCode:
			(self rbAST
				typGtTypeWithPragma;
				formattedCode)
]
