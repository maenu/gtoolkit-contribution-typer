Extension { #name : #Boolean }

{ #category : #'*Typer-Static-Pharo' }
Boolean class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new.	"typParameters TypMethodResolver"
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
				argumentTypes: [ BlockClosure typAsType copy
						parameters: {TypUnknownType instance};
						yourself ];
				resultType: [ :r :a | 
					| resultType |
					resultType := a argumentTypes
						inject: TypUnionType new
						into: [ :e :f | 
							e
								increment:
									(f isParametric
										ifTrue: [ (f "typCastAs TypParametricType") parameters last ]
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
