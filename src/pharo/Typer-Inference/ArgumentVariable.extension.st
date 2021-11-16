Extension { #name : #ArgumentVariable }

{ #category : #'*Typer-Inference' }
ArgumentVariable >> typInfTypeRecursiveIn: aNode [

	| type sendNodes sendSelectors sendClasses useTypes |
	aNode isDefinition ifFalse: [ 
		^ ((aNode whoDefines: name) arguments detect: [ :e | e = aNode ])
			  typInfType ].
	type := aNode parent typInfArgumentType: aNode.
	type isUnknown ifFalse: [ ^ type ].

	sendNodes := (aNode whoDefines: name) sendNodes select: [ :e | 
		             e receiver = aNode ].
	sendSelectors := sendNodes collect: #selector as: Set.
	sendClasses := (sendSelectors flatCollect: #typInfImplementors)
		               inject: Set new
		               into: [ :r :e | 
			               r
				               detect: [ :f | e methodClass inheritsFrom: f ]
				               ifNone: [ r add: e methodClass ].
			               r ].
	(sendClasses size between: 1 and: 8) ifTrue: [ 
		^ (sendClasses collect: #typAsType) typAsType ].
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
