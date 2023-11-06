Extension { #name : #Symbol }

{ #category : #'*Typer-GToolkit' }
Symbol >> typGtShaMethodSelector [
	self isUnary ifTrue: [ ^ 'Unary' , self capitalized ].
	self isBinary ifTrue: [ ^ 'BinaryToRename' ].
	self isKeyword
		ifTrue: [ ^ 'Keyword'
				, (''
						join: (self keywords collect: [ :s | s capitalized copyFrom: 1 to: s size - 1 ])) ].
	self error: 'not a selector'
]
