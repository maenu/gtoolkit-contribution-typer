Extension { #name : #ArgumentVariable }

{ #category : #'*Typer-Inference' }
ArgumentVariable >> typInfTypeRecursiveIn: aNode [

	| type useTypes |
	aNode isDefinition ifFalse: [ 
		^ ((aNode whoDefines: name) arguments detect: [ :e | e = aNode ])
			  typInfType ].
	type := aNode parent typInfArgumentType: aNode.
	type isUnknown ifFalse: [ ^ type ].
	useTypes := OrderedCollection new.
	(aNode whoDefines: name) nodesDo: [ :e | 
		e = aNode ifTrue: [ 
			| parent |
			parent := e parent.
			(parent isMessage and: [ parent arguments includes: aNode ]) 
				ifTrue: [ 
					useTypes add:
						(parent typInfMethod arguments at:
							 (parent arguments indexOf: aNode)) ].
			(parent isAssignment and: [ parent value = aNode ]) ifTrue: [ 
				useTypes add: parent variable typInfType ] ] ].
	useTypes ifEmpty: [ ^ aNode typInfUnknown ].
	^ useTypes typAsType
]
