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
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #do:;
				argumentTypes: [ :r :i :a :s | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a key parameters at: i).
							a key};
						yourself ];
				resultType: [ :r :a | a key ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #asSet;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | 
					TypParametricType new
						type: Set typAsType asNonParametricType;
						parameters: {(a key parameters at: 1)};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #anyOne;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a key parameters at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #includes:;
				argumentTypes: [ :r :i :a | a key parameters at: 1 ];
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
							{(a key parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #sort:;
				argumentTypes: [ :r :i :a :s | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a key parameters at: 1).
							(a key parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ :r :a | a key ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #detect:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a key parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ :r :a | a key parameters at: 1 ];
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
									{(a key parameters at: 1).
									Boolean typAsType};
								yourself ]
						ifFalse: [ i = 2
								ifTrue: [ TypParametricType new
										type: BlockClosure typAsType asNonParametricType;
										parameters:
											{(a key parameters at: 1).
											TypUnknownType instance};
										yourself ]
								ifFalse: [ TypParametricType new
										type: BlockClosure typAsType asNonParametricType;
										parameters:
											{(a key parameters at: 1).
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
							{(a key parameters at: 1).
							Boolean typAsType};
						yourself ];
				resultType: [ :r :a | a key ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #collect:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a key parameters at: 1).
							TypUnknownType instance};
						yourself ];
				resultType: [ :r :a | 
					a key copy
						parameters: {TypUnknownType instance};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
