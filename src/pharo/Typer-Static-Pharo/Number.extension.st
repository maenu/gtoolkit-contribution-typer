Extension { #name : #Number }

{ #category : #'*Typer-Static-Pharo' }
Number class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new.	"typParameters TypMethodResolver"
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #timesCollect:;
				argumentTypes: [ BlockClosure typAsType
						asParametricType:
							{Integer typAsType.
							TypUnknownType instance} ];
				resultType: [ :r :a | 
					| resultType |
					resultType := a argumentTypes
						inject: TypUnionType new
						into: [ :e :f | 
							e
								increment:
									(f isParametric
										ifTrue: [ f parameters "typCastAs TypParametricType" last	 ]
										ifFalse: [ TypUnknownType instance ]).
							e ].
					OrderedCollection typAsType copy
						asParametricType: {resultType asType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
