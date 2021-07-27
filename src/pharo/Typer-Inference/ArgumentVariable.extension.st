Extension { #name : #ArgumentVariable }

{ #category : #'*Typer-Inference' }
ArgumentVariable >> typInfTypeRecursiveIn: aNode [

	aNode isDefinition ifTrue: [ 
		^ aNode parent typInfArgumentType: aNode ].
	^ ((aNode whoDefines: name) arguments detect: [ :e | e = aNode ])
		  typInfType
]
