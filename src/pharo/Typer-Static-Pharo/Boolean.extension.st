Extension { #name : #Boolean }

{ #category : #'*Typer-Static-Pharo' }
Boolean class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #or:;
				argumentTypes: [ BlockClosure typAsType copy
						parameters: {Boolean typAsType};
						yourself ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #and:;
				argumentTypes: [ BlockClosure typAsType copy
						parameters: {Boolean typAsType};
						yourself ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #ifTrue:ifFalse:;
				argumentTypes: [ :r :i :a | 
					| argumentType resultType |
					argumentType := a argumentTypes at: i.
					resultType := (argumentType isParametric and: [ argumentType hasClass and: [ argumentType asClass == BlockClosure ] ])
						ifTrue: [ argumentType parameters last ]
						ifFalse: [ TypUnknownType instance ].
					BlockClosure typAsType copy
						parameters: {resultType};
						yourself ];
				resultType: [ :r :a | 
					| resultType |
					resultType := a argumentTypes
						inject: TypUnionType new
						into: [ :e :f | 
							e
								increment:
									((f isParametric and: [ f hasClass and: [ f asClass == BlockClosure ] ])
										ifTrue: [ f parameters last ]
										ifFalse: [ TypUnknownType instance ]).
							e ].
					resultType asType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #not;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Boolean typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
