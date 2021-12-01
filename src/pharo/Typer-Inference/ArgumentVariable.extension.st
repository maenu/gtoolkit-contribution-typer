Extension { #name : #ArgumentVariable }

{ #category : #'*Typer-Inference' }
ArgumentVariable >> typInfType: aNode in: aContext [

	| type sendNodes sendSelectors sendClasses useTypes |
	aNode isDefinition ifFalse: [ 
		^ ((aNode whoDefines: name) arguments detect: [ :e | e = aNode ]) 
			  typInfTypeIn: aContext ].
	type := aNode parent typInfArgumentTypeOf: aNode in: aContext.
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
					useTypes add: ((parent typInfMethodIn: aContext) arguments at:
							 (parent arguments indexOf: aNode)) ].
			(parent isAssignment and: [ parent value = aNode ]) ifTrue: [ 
				useTypes add: (parent variable typInfTypeIn: aContext) ] ] ].
	useTypes ifEmpty: [ ^ aContext unknown: aNode ].
	^ useTypes typAsType
]
