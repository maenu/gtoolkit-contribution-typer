Extension { #name : #Dictionary }

{ #category : #'*Typer-Static-Pharo' }
Dictionary class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters:
			{TypUnknownType instance.
			TypUnknownType instance};
		yourself
]

{ #category : #'*Typer-Static-Pharo' }
Dictionary class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #at:put:;
				argumentTypes: [ :r :i :a | a receiverType parameters at: i ];
				resultType: [ :r :a | a receiverType parameters at: 2 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #at:ifAbsentPut:;
				argumentTypes: [ :r :i :a | 
					i = 1
						ifTrue: [ a receiverType parameters at: 1 ]
						ifFalse: [ TypParametricType new
								type: BlockClosure typAsType asNonParametricType;
								parameters: {(a receiverType parameters at: 2)};
								yourself ] ];
				resultType: [ :r :a | a receiverType parameters at: 2 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #associations;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | 
					TypParametricType new
						type: Collection typAsType asNonParametricType;
						parameters:
							{(TypParametricType new
								type: Association typAsType asNonParametricType;
								parameters:
									{(a receiverType parameters at: 1).
									(a receiverType parameters at: 2)};
								yourself)};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #associationsDo:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(TypParametricType new
								type: Association typAsType asNonParametricType;
								parameters:
									{(a receiverType parameters at: 1).
									(a receiverType parameters at: 2)};
								yourself).
							TypUnknownType instance};
						yourself ];
				resultType: [ :r :a :s | a receiverType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #keys;
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
				resultType: [ :r :a | a receiverType parameters at: 2 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #includes:;
				argumentTypes: [ :r :i :a | a receiverType parameters at: 2 ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #includesKey:;
				argumentTypes: [ :r :i :a | a receiverType parameters at: 1 ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #asOrderedDictionary;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | 
					TypParametricType new
						type: OrderedDictionary typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: 1).
							(a receiverType parameters at: 2)};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
