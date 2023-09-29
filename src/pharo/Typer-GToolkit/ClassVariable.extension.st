Extension { #name : #ClassVariable }

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShaCanTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-GToolkit' }
ClassVariable >> typGtShaMethodIn: aNode [
	self assert: [ self typGtShaCanTypeIn: aNode ].
	^ definingClass class typGtShaVariable: name asSymbol type: aNode type
]
