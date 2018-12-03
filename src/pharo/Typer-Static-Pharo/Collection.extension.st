Extension { #name : #Collection }

{ #category : #'*Typer-Static-Pharo' }
Collection class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {TypUnknownType instance};
		yourself
]

{ #category : #'*Typer-Static-Pharo' }
Collection class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new.	"typParameters TypMethodResolver"
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #do:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: i).
							a receiverType};
						yourself ];
				resultType: [ :r :a | a receiverType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #inject:into:;
				argumentTypes: [ :r :i :a | 
					i = 1
						ifTrue: [ a argumentTypes at: 1 ]
						ifFalse: [ TypParametricType new
								type: BlockClosure typAsType asNonParametricType;
								parameters:
									{(a argumentTypes at: 1).
									(a receiverType parameters at: 1).
									(a argumentTypes at: 1)};
								yourself ] ];
				resultType: [ :r :a | a argumentTypes at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #asSet;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | 
					TypParametricType new
						type: Set typAsType asNonParametricType;
						parameters: {(a receiverType parameters at: 1)};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #anyOne;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a receiverType parameters at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #max;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Number typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #includes:;
				argumentTypes: [ :r :i :a | a receiverType parameters at: 1 ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #anySatisfy:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #sort:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: 1).
							(a receiverType parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ :r :a | a receiverType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #detect:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ :r :a | a receiverType parameters at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #detect:ifNone:;
				argumentTypes: [ :r :i :a | 
					i = 1
						ifTrue: [ TypParametricType new
								type: BlockClosure typAsType asNonParametricType;
								parameters:
									{(a receiverType parameters at: 1).
									Boolean typAsType};
								yourself ]
						ifFalse: [ TypParametricType new
								type: BlockClosure typAsType asNonParametricType;
								parameters:
									{(a receiverType parameters at: 1).
									TypUnknownType instance};
								yourself ] ];
				resultType: [ TypUnknownType instance ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #detect:ifFound:ifNone:;
				argumentTypes: [ :r :i :a | 
					i = 1
						ifTrue: [ TypParametricType new
								type: BlockClosure typAsType asNonParametricType;
								parameters:
									{(a receiverType parameters at: 1).
									Boolean typAsType};
								yourself ]
						ifFalse: [ i = 2
								ifTrue: [ TypParametricType new
										type: BlockClosure typAsType asNonParametricType;
										parameters:
											{(a receiverType parameters at: 1).
											TypUnknownType instance};
										yourself ]
								ifFalse: [ TypParametricType new
										type: BlockClosure typAsType asNonParametricType;
										parameters:
											{(a receiverType parameters at: 1).
											TypUnknownType instance};
										yourself ] ] ];
				resultType: [ TypUnknownType instance ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #size;
				argumentTypes: [ TypNoTypeError ];
				resultType: [ Integer typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #select:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ :r :a | a receiverType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #collect:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: 1).
							TypUnknownType instance};
						yourself ];
				resultType: [ :r :a | 
					| resultType |
					resultType := a argumentTypes
						inject: TypUnionType new
						into: [ :e :f | 
							e
								increment:
									(f isParametric
										ifTrue: [ f parameters last	"typCastAs TypParametricType" ]
										ifFalse: [ TypUnknownType instance ]).
							e ].
					a receiverType copy asParametricType: {resultType asType} ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
