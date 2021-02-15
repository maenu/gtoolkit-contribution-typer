Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfIsReturnSelf [
	<typTypeResultAs: 'Boolean'>
	^ self method isAbstract not
		and: [ self isPrimitive not
				and:
					[ (self typInfReturnNodes reject: [ :e | e value isSelf ]) isEmpty ] ]
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfReturnNodes [
	<typTypeResultAs: 'SequenceableCollection<RBReturnNode>'>
	^ (self allChildren select: #isReturn) "typParameters RBReturnNode"
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	^ TypMethodLookupIndex instance
		argumentTypeFor:
			(TypMethodLookup new
				receiverType: nil;
				selector: self selector asSymbol;
				argumentTypes: (self typTypesForArguments);
				argumentNodes: self arguments;
				yourself)
		at: anInteger
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typInfTypeForArgumentAt: i
]
